Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2313F31B681
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 10:35:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E116E10F;
	Mon, 15 Feb 2021 09:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770050.outbound.protection.outlook.com [40.107.77.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563156E10F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 09:34:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxgZft4zQgIVHvumZ3A38A5elBZQGSQ5wMYv5+wTg456s4BcQEK3b8lS9/XCFzBhGoxCgxjQg+YrutmNauKn4u7H63AZ0OOp0zNWgMwp3r6qWTikMDyz0NCNZs9pEz4gArGMgIeqxdAoFO0nnEBHplWfmBbquRemF3CSQbmEmjChj6MHHXOsPOda9tu9tXMkcZ73ze7IP0286sdKwtJnxfzgYCexsGzs4OHv/0XumICXAMIgtdRIBDEhE55efr3GFgHih75Kig1Pm6WQPC5Kd5KPZWKV0muNNmixwSMBrlqDvodDQEK1ArLGmeUWwaWRUTDF0Nwf3hYqxQ0cwXzC7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5VAaWGql15cRj3Yqd9OhtItG4SIPJAV/3La//eHFi4=;
 b=luIwKQ/1pCIKJ4+Oq3WHEyo/kjimUVsepC4JnxK4ZddJaLACMdLX1MkOdm9KwWmiqTgIhSIu8oB1E77blzmfTpDQtG/H6LD0IrH/sCxSBgkW7rBo6V+LT39+SxuV5Deh+umQgxB22hWgT0SmegWHNPf6XQtPn2ZJkyJs7pXWALMUx4NAmY47OLapP06u2ndSREdZcQYvKNHRbt74vOl9Ipu0LIzJHGNuTMmEb10A+XmLi9BH6R9dtScQxucdWMtWJ2VC8X4XZYnNoxx1C3KBkZYOGonvau/7Kpio0Vyc/4FyiE9V4VqTHvrn6hk0/0YOZckfYZoW6Ofc/Al450zx8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5VAaWGql15cRj3Yqd9OhtItG4SIPJAV/3La//eHFi4=;
 b=POKFB3IBFB00Qjyrq5o+OFWrIP6CD35JBve7iDgukvOxS+9YPzyFkdP3padYdeIUCQ8g3gXm0PX0qFJHybOKSQDHNi6u9UP2nv4Iqwa9Ir1ZtjRl9GlLj1YnXsflEGp+i0guPMcJ7UjSj9jJ+G+nE5j5Lt3GKiyjPEZg2Ymh5AM=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3950.namprd12.prod.outlook.com (2603:10b6:208:16d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Mon, 15 Feb
 2021 09:34:56 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3846.038; Mon, 15 Feb 2021
 09:34:56 +0000
Subject: Re: DMA-buf and uncached system memory
To: Simon Ser <contact@emersion.fr>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <GUuZYSQk2hxgykDhSxfB2GWo47lQlVrKBtWMwQUG7Ar2GAag5WQDxBI0zq6nDTooPBzTktyRpnu25Ju1UKE3FYD9yHbkNMAHcmSI96hoJhA=@emersion.fr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <da9edfa0-8a18-44a2-fa79-83b4177afd8e@amd.com>
Date: Mon, 15 Feb 2021 10:34:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <GUuZYSQk2hxgykDhSxfB2GWo47lQlVrKBtWMwQUG7Ar2GAag5WQDxBI0zq6nDTooPBzTktyRpnu25Ju1UKE3FYD9yHbkNMAHcmSI96hoJhA=@emersion.fr>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:e074:3b37:7224:b69f]
X-ClientProxiedBy: AM0PR03CA0054.eurprd03.prod.outlook.com (2603:10a6:208::31)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:e074:3b37:7224:b69f]
 (2a02:908:1252:fb60:e074:3b37:7224:b69f) by
 AM0PR03CA0054.eurprd03.prod.outlook.com (2603:10a6:208::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Mon, 15 Feb 2021 09:34:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 422e4859-2ebc-4707-c60d-08d8d194f463
X-MS-TrafficTypeDiagnostic: MN2PR12MB3950:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3950C52251030DA7D506083583889@MN2PR12MB3950.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dbnfUb1KLXtDOMjAroXjXZndlBIUoBOfBG9FvGNHe27mc7LUT7TPVYILeNXRdKjlKApytsGwIFalXFCu1xqsM+4eV6LsIRL93w1atUvx8ImJFPvLLhDGtHoC9tvIkfz6uo1Kj1kMERKoZ46NCCAyni14lF5RUYEHybBYJEXkymQ2AvvLs7echL4o/itHhIcPSy2FZiiuMsBTZqeLVmj01HShgvKMYjHJEyjUQnsFb8j5zlAxv1RbRIPD+TxcExI1u+Ox3nSKFOFVl2x3IMLUjE2EZBjj2SkGgF51CEMqaYU4U/YkYQMXHM0yydqlsytfJAr6r62h2HjZCSZ8s+Hf/ZcX2GYbSYwp5TDnDe+EPMbhGpE5RQn8Zyd46tJYsOUf/IcHnm+ZdUUR9v4HA/6+evYJ5YRjLezUnEhcKzoSpQa/jnZsgASRcYc+PyuTl9KL+Dob0lYBlH5BZpXs6ryJKKHFwskLzyvZPEpaQLRBWzPgPSW24+E+ZpjYJiUUJObTzBtifw+GtBCQeK2geSV1+ImDQVpbG5Izk9iT6EL4b0YCubcm2lvrD9MmVCtTzcKlBXmt6pV6QJUhrwymGfGij+K6I4m7c5a64qdXecqf6NH+rEtuQM4gWfRDUSjCgts7u5SWg+vjNIxF1uHJxmb5xJ3do9NV+jad5HJa25BXTDYLOWDkMeZg5sL+YJ5nqel6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(66476007)(31696002)(66946007)(86362001)(2616005)(6666004)(8676002)(8936002)(66574015)(83380400001)(66556008)(6916009)(5660300002)(52116002)(316002)(45080400002)(6486002)(478600001)(966005)(31686004)(54906003)(36756003)(4326008)(186003)(16526019)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QnZxZUVTVG5PUkx2U3lOdmo0U2JQQ2hlZlFEZjNSa0Z3M09CMHVoK3BGY1Zs?=
 =?utf-8?B?ck1iL1JEMkdtOGFST0ttS0lQYmgzdHJwL0lSV05JWTA3VElkZUJKRHJ6d0tB?=
 =?utf-8?B?SmpCUlQ3QkdSR3c0VnNPcHdsQlRQKzlTdnVzNnZSOU5VdURnR2Vzcmw2TjNz?=
 =?utf-8?B?V3ZHSkVKNlhoYXNiRVk1eE5vWXQydnRIc3U4dTQ3ZzNoVWF3eEJvK3JpTG5U?=
 =?utf-8?B?clNKcGxXbTQ2T21tMURVWXR1MkhQRE9Xc29LcTF6UDJ4NDNnYThGV0gvdXRy?=
 =?utf-8?B?c2ZMeEt2cXB3VVVLT1YxelcxaldESk8xeGY2N0txT3QzU2lBb05aVmlrUVB4?=
 =?utf-8?B?dnB6VmNSMnR6TGNST1JEQTFhR0x3VG9FS1IrdkVoZ0QrQnRtVnRkcGc5NS92?=
 =?utf-8?B?dThaeXJSQnJpNkZPcVN1cGR5U1l2aFdnQUU3N01QM01ualVJdldlSktHQ3V1?=
 =?utf-8?B?L1h2aSthakhMUEVxS1BoUXBOSW42WEtSOHdMSjduTWpXWjA4WFp0aTlKNC9H?=
 =?utf-8?B?VGE0V0hRaG96RmZGckFpMmliYnN1WVNMMXU2NHYzV1NLb1N4RVExcTdseGM4?=
 =?utf-8?B?eUlDY2hpZzcrRVVpMkhlU0kxUERaMEhkLzAxdDlES01WU0hVNzBaY1NxWkRs?=
 =?utf-8?B?TlYzNzFIZ0EzWjFSK00vbkpKTzAwbHVxamJLQU9odUhaT0NPY0xGN3laaSta?=
 =?utf-8?B?STVmeTFaZVFUbjlVVEI3VGt0K093Ymw3VVV6amFYemdkNjM1SUp1R3A1TlRZ?=
 =?utf-8?B?L2NxZm1YTkNpb0FZTkNsQ09Eb2RtOXFhRVF2SkszOFNORVZSa3RrUEgyLzE4?=
 =?utf-8?B?UFhGS3dEVCtnTnlFVG1FYmNHR3A4akNuOXBibDJsRHU0UkEyREppV1BpaGIw?=
 =?utf-8?B?ZVlZOU5CeGZ0czkvM01MR3J5Y0JwUmVaV3BkNXEzaWZ3SnpPTVVQOThRV2xF?=
 =?utf-8?B?b1NnTGVIY2cvZTgzU3h6K2dRU2RrRkx5QzNpTHd4L2g0cTQwYzdFeDJhUkdZ?=
 =?utf-8?B?Zk05TTBkZjYyekxnOUNzWmV2Z0NsbTJFSDNuUllMMElyNHI3WklGckF6WDJ2?=
 =?utf-8?B?VjNSWU5FalFxa3A3SWN6SG9nYmRoR3dIbmhaNmpPeTFzRTh5c0tzcXRQWDlu?=
 =?utf-8?B?SS9qcHpZcHYrcUU1d3g3RVQ2SVhPeXJJMWs4QnhBVk16Q1VoMElnZU1uSWpJ?=
 =?utf-8?B?R2VUdVlkSldRSU9uWmc2VEJaNXZzMkR0L3VFZ3J2TEdMUFNmbWpKblhDdEQr?=
 =?utf-8?B?RWgyZXRkb3ZFdFIyT29tS0lVeForc0JVSnd5UlRoWFpUZU9MY3g4RzV0SUJC?=
 =?utf-8?B?TDNvVjRjb2RkUkhGVHl5Smd1dVl6di9JdFN5QUN6RjhiT2hrSjV0RlhBcFBV?=
 =?utf-8?B?V0tYN002bzRFbmUramZLbXArUFYrZkdJckRjM1VMcFVFOGhublo4OVNBeWNF?=
 =?utf-8?B?QWlwTmJueVBRT2NYYXcrc0Q0eVFSU2l6WWlHT0o4eU9aNVJKcHllM0ZVSUVM?=
 =?utf-8?B?aXhYUUwxNlRtV2pKTHl1TzVXSUUxODU0UlEwK2E2Q3lZU3FPeUZxemJmK3Qw?=
 =?utf-8?B?NkVDbnRBbWhwbWp6ZGxUL0huTWlKOEZTek5XNEVHbVpsdzc1OFhUYlJNSDZz?=
 =?utf-8?B?K0ducTN2RG1xZHRLOHhBa09RQ2lsNXVpNENSVGhKcGczeEpnRVJIV3lFMExJ?=
 =?utf-8?B?Ui90MWgzcUFaNS83bjFzcTRrQzJBVWRBYnRwRjJGaDVEUm11R0Y2NitIa1Nm?=
 =?utf-8?B?TGp5Y2RDdmJiTy8zL1dwdlQ1cFlZb1ZMbXhuRStrNHQvL3F0aUExN2plOEFr?=
 =?utf-8?B?SnVMUW1ZdDJKZk5nY2lEZG1FcmpWZ3BXVU9HUExzYlZ4dFVadllqU2JoNk5R?=
 =?utf-8?Q?GeHi8jYvBuq3O?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 422e4859-2ebc-4707-c60d-08d8d194f463
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2021 09:34:55.9948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RVB+zPHKqxM+wVu5faWVH6TIcERyaB87tKAWIlR3bmDf5itkRpGWFCpaccJrEPAG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3950
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: linaro-mm-sig@lists.linaro.org, "Sharma,
 Shashank" <Shashank.Sharma@amd.com>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAxNS4wMi4yMSB1bSAxMDowNiBzY2hyaWViIFNpbW9uIFNlcjoKPiBPbiBNb25kYXksIEZl
YnJ1YXJ5IDE1dGgsIDIwMjEgYXQgOTo1OCBBTSwgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+PiB3ZSBhcmUgY3VycmVudGx5IHdvcmtpbmcgYW4g
RnJlZXN5bmMgYW5kIGRpcmVjdCBzY2FuIG91dCBmcm9tIHN5c3RlbQo+PiBtZW1vcnkgb24gQU1E
IEFQVXMgaW4gQStBIGxhcHRvcHMuCj4+Cj4+IE9uIHByb2JsZW0gd2Ugc3R1bWJsZWQgb3ZlciBp
cyB0aGF0IG91ciBkaXNwbGF5IGhhcmR3YXJlIG5lZWRzIHRvIHNjYW4KPj4gb3V0IGZyb20gdW5j
YWNoZWQgc3lzdGVtIG1lbW9yeSBhbmQgd2UgY3VycmVudGx5IGRvbid0IGhhdmUgYSB3YXkgdG8K
Pj4gY29tbXVuaWNhdGUgdGhhdCB0aHJvdWdoIERNQS1idWYuCj4+Cj4+IEZvciBvdXIgc3BlY2lm
aWMgdXNlIGNhc2UgYXQgaGFuZCB3ZSBhcmUgZ29pbmcgdG8gaW1wbGVtZW50IHNvbWV0aGluZwo+
PiBkcml2ZXIgc3BlY2lmaWMsIGJ1dCB0aGUgcXVlc3Rpb24gaXMgc2hvdWxkIHdlIGhhdmUgc29t
ZXRoaW5nIG1vcmUKPj4gZ2VuZXJpYyBmb3IgdGhpcz8KPj4KPj4gQWZ0ZXIgYWxsIHRoZSBzeXN0
ZW0gbWVtb3J5IGFjY2VzcyBwYXR0ZXJuIGlzIGEgUENJZSBleHRlbnNpb24gYW5kIGFzCj4+IHN1
Y2ggc29tZXRoaW5nIGdlbmVyaWMuCj4gSW50ZWwgYWxzbyBuZWVkcyB1bmNhY2hlZCBzeXN0ZW0g
bWVtb3J5IGlmIEknbSBub3QgbWlzdGFrZW4/CgpObyBpZGVhLCB0aGF0J3Mgd2h5IEknbSBhc2tp
bmcuIENvdWxkIGJlIHRoYXQgdGhpcyBpcyBhbHNvIGludGVyZXN0aW5nIApmb3IgSStBIHN5c3Rl
bXMuCgo+IFdoZXJlIGFyZSB0aGUgYnVmZmVycyBhbGxvY2F0ZWQ/IElmIEdCTSwgdGhlbiBpdCBu
ZWVkcyB0byBhbGxvY2F0ZSBtZW1vcnkgdGhhdAo+IGNhbiBiZSBzY2FubmVkIG91dCBpZiB0aGUg
VVNFX1NDQU5PVVQgZmxhZyBpcyBzZXQgb3IgaWYgYSBzY2Fub3V0LWNhcGFibGUKPiBtb2RpZmll
ciBpcyBwaWNrZWQuCj4KPiBJZiB0aGlzIGlzIGFib3V0IGNvbW11bmljYXRpbmcgYnVmZmVyIGNv
bnN0cmFpbnRzIGJldHdlZW4gZGlmZmVyZW50IGNvbXBvbmVudHMKPiBvZiB0aGUgc3RhY2ssIHRo
ZXJlIHdlcmUgYSBmZXcgcHJvcG9zYWxzIGFib3V0IGl0LiBUaGUgbW9zdCByZWNlbnQgb25lIGlz
IFsxXS4KCldlbGwgdGhlIHByb2JsZW0gaGVyZSBpcyBvbiBhIGRpZmZlcmVudCBsZXZlbCBvZiB0
aGUgc3RhY2suCgpTZWUgcmVzb2x1dGlvbiwgcGl0Y2ggZXRjOi4uIGNhbiBlYXNpbHkgY29tbXVu
aWNhdGVkIGluIHVzZXJzcGFjZSAKd2l0aG91dCBpbnZvbHZlbWVudCBvZiB0aGUga2VybmVsLiBU
aGUgd29yc3QgdGhpbmcgd2hpY2ggY2FuIGhhcHBlbiBpcyAKdGhhdCB5b3UgZHJhdyBnYXJiYWdl
IGludG8geW91ciBvd24gYXBwbGljYXRpb24gd2luZG93LgoKQnV0IGlmIHlvdSBnZXQgdGhlIGNh
Y2hpbmcgYXR0cmlidXRlcyBpbiB0aGUgcGFnZSB0YWJsZXMgKGJvdGggQ1BVIGFzIAp3ZWxsIGFz
IElPTU1VLCBkZXZpY2UgZXRjLi4uKSB3cm9uZyB0aGVuIEFSTSBmb3IgZXhhbXBsZSBoYXMgdGhl
IAp0ZW5kZW5jeSB0byBqdXN0IHNwb250YW5lb3VzbHkgcmVib290CgpYODYgaXMgZm9ydHVuYXRl
bHkgYSBiaXQgbW9yZSBncmFjZWZ1bGx5IGFuZCB5b3Ugb25seSBlbmQgdXAgd2l0aCByYW5kb20g
CmRhdGEgY29ycnVwdGlvbiwgYnV0IHRoYXQgaXMgb25seSBtYXJnaW5hbGx5IGJldHRlci4KClNv
IHRvIHN1bSBpdCB1cCB0aGF0IGlzIG5vdCBzb21ldGhpbmcgd2hpY2ggd2UgY2FuIGxlYXZlIGlu
IHRoZSBoYW5kcyBvZiAKdXNlcnNwYWNlLgoKSSB0aGluayB0aGF0IGV4cG9ydGVycyBpbiB0aGUg
RE1BLWJ1ZiBmcmFtZXdvcmsgc2hvdWxkIGhhdmUgdGhlIGFiaWxpdHkgCnRvIHRlbGwgaW1wb3J0
ZXJzIGlmIHRoZSBzeXN0ZW0gbWVtb3J5IHNub29waW5nIGlzIG5lY2Vzc2FyeSBvciBub3QuCgpV
c2Vyc3BhY2UgY29tcG9uZW50cyBjYW4gdGhlbiBvZiBjb3Vyc2UgdGVsbCB0aGUgZXhwb3J0ZXIg
d2hhdCB0aGUgCmltcG9ydGVyIG5lZWRzLCBidXQgdmFsaWRhdGlvbiBpZiB0aGF0IHN0dWZmIGlz
IGNvcnJlY3QgYW5kIGRvZXNuJ3QgCmNyYXNoIHRoZSBzeXN0ZW0gbXVzdCBoYXBwZW4gaW4gdGhl
IGtlcm5lbC4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCj4KPiBTaW1vbgo+Cj4gWzFdOiBodHRwczov
L25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYl
MkZ4ZGMyMDIwLngub3JnJTJGZXZlbnQlMkY5JTJGY29udHJpYnV0aW9ucyUyRjYxNSUyRiZhbXA7
ZGF0YT0wNCU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0NiMjgyNGJkNzliZDQ0
ODYyYjM4ZTA4ZDhkMTkwZjM0NCU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdD
MCU3QzAlN0M2Mzc0ODk3Njc3OTY5MDA3ODMlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lq
b2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4w
JTNEJTdDMTAwMCZhbXA7c2RhdGE9aElwdGZpbjVYeDZYbFlCdEdGWUFBYmZ1TnNuRDZrbVFFaWdn
cTlrMTBFOCUzRCZhbXA7cmVzZXJ2ZWQ9MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
