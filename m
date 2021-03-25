Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B29C83492AF
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 14:05:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B206ED1B;
	Thu, 25 Mar 2021 13:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676A06ED17
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 13:05:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MqmQD7pn+Ny7V8fo0GNO0IgUTIkvooqErc1cAScf1yt5uAB6wwP7vpgDix+c8piK3WvmMHCZSBwUoORbdz9QPF1fFFxaR1ZB994ZbhkK7msKy944+7KkTCZARTmT7PbW+Pi0LaDLDM4D3p3GnRd/wXYU2ooV7kU6syblubVZD/l1kUUPsa4+FhfiScrxSifAItA6CEejjEr3h3ViZvVGWEDklp+iOOO2HysVAohZBIbEGs6vSnF+ki02cTLBipwqkmhR1PTt0nl3fAffrO9KX7P0k+I5wssztLxlnXKPW2+yXkHLax/i0Ax3sasZfVyMDzf/vy5QWSSXVtdR20pXOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CDzCjf3X+kztfOdIZAZyCHDrHPHNRnFsOTf7I7FjNU=;
 b=mjOxXchBfqTDEhyKJ3cdi1aydYmh8j67Xp8XL49b9gbcM/Io5bXIeN4Pdg3RmsvtFEqGFpUVwl0Fygrnfoz/Ac5tHrUpR5LHvrF933hWyaCknVclUnqD6Rwxo6hUOuxhWohrkqtSAeh0Cc4TRrPwk/QTvd7a/RoZn10K6v/RtF4DxG5VNexUrZtEb5jEj+zHhmImT0EOI49rabAdrqoEviDSU6S2PwIwL4XNc85hhjSTNwe8oggFWd5Q+yLK0P6yTaSLgKCdleI39M8+g5SQ6+Ksyfvhda4W1HIhxuuWeOdoNnOhtNrNgvckVPSl15XpQ65EDpN7tlO63mUCqyy2HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CDzCjf3X+kztfOdIZAZyCHDrHPHNRnFsOTf7I7FjNU=;
 b=inYUOTb8OFx6isLZJpIYKlKkpWnY9UvpJxJgSYnkFNxSwyTt3v/Tv9r1RQ1N8uDPQWW6hVrHYPkaty/9ZM+UyuQHWiRYGyOqyJpLFdpovUv5oHQINH5U7udPPapyIlfYNRp1cIXh4NuyCdsoLqSPxiA4DrirknuOnCzBau9nWBE=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4550.namprd12.prod.outlook.com (2603:10b6:208:24e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 25 Mar
 2021 13:05:19 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3977.029; Thu, 25 Mar 2021
 13:05:19 +0000
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
To: Jason Gunthorpe <jgg@nvidia.com>
References: <08f19e80-d6cb-8858-0c5d-67d2e2723f72@amd.com>
 <730eb2ff-ba98-2393-6d42-61735e3c6b83@shipmail.org>
 <20210324231419.GR2356281@nvidia.com>
 <607ecbeb-e8a5-66e9-6fe2-9a8d22f12bc2@shipmail.org>
 <fb74efd9-55be-9a8d-95b0-6103e263aab8@amd.com>
 <15da5784-96ca-25e5-1485-3ce387ee6695@shipmail.org>
 <20210325113023.GT2356281@nvidia.com>
 <afad3159-9aa8-e052-3bef-d00dee1ba51e@shipmail.org>
 <20210325120103.GV2356281@nvidia.com>
 <a0d0ffd7-3c34-5002-f4fe-cb9d4ba0279e@amd.com>
 <20210325124206.GA599656@nvidia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <00f79bae-75c4-d694-8dc9-35ac21cd1006@amd.com>
Date: Thu, 25 Mar 2021 14:05:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210325124206.GA599656@nvidia.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:72d1:2a48:a80e:e149]
X-ClientProxiedBy: AM0PR05CA0096.eurprd05.prod.outlook.com
 (2603:10a6:208:136::36) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:72d1:2a48:a80e:e149]
 (2a02:908:1252:fb60:72d1:2a48:a80e:e149) by
 AM0PR05CA0096.eurprd05.prod.outlook.com (2603:10a6:208:136::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29 via Frontend
 Transport; Thu, 25 Mar 2021 13:05:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 80f162b5-6038-4f18-5437-08d8ef8ea3fc
X-MS-TrafficTypeDiagnostic: MN2PR12MB4550:
X-Microsoft-Antispam-PRVS: <MN2PR12MB455023095F82B2B48C841CFE83629@MN2PR12MB4550.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U+g78YcwzBrTuju7gHrlAaghQ5cbfNj6SGo7qEWlSXO7T12q7Hom2bum3iqfb4ZEnjRjaFH8dKSArGZWqEym4po4MGjEyJkbDN5XAu7cq6//Q9Pbxde/wBIoy1lGpOcuqf2hTLnjJD5a2b1PEZ3ycjaWihbsKUslIRbu/z4MkwuEy9Yu/3daRWhhdCLd2/yvkH4z+lqwYqXI7glUc48bWHdCgnC0WbIC2qYLLJid6hvxGQIUYJybFuC5xVI8+bXXx5dRHYexjTXF5lAt9UlILMQF4kzFI/0qoLXmZSYOA5EzDz56D6X39QCtwuLeNElGgQ7bpRjIrqUJtGGrnisacBoJezngYKPeftt+YGMxAYx1mrLGo6NwjdSIvY4E7YB3966dU+G+UC8wLSmjVo7xK88KiLxESaEkM0TY6jrY+fq1LUL+Aw5KycAk33gYaRN+4ZLNby/l7ZzrF9uo/s8If++X0QbAXv+7A9z2vox+icgAXP5TQNgdwTSYUwLv1CRhyVy/sZdXjCtw1ZjNjJlKd+NVJfzB55qK/nIFmKed2DabHtvva2jeoeWaZMbEbCy/zsVsvXEu/sUY1ZLcBeLeXrzYrOCGcnmeH6Nq32avehZGoMkLp7aadAh48lLTjk2s9WPdDg9vKRmZt50VtC2YJgQxzEc1LCUzlEFmpkyn9an8I2ga3EIQEl8zN6WA+j6xW7UwJo69mMMV+omJ/PZUAuOJt9IKbu0RmO1r++EBSI0MvUYpdCaTXTBq61dcA9Aj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(52116002)(478600001)(316002)(36756003)(6916009)(6666004)(2906002)(5660300002)(2616005)(66946007)(86362001)(4326008)(66476007)(66556008)(31686004)(186003)(38100700001)(8936002)(6486002)(31696002)(8676002)(54906003)(16526019)(14583001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MEFJQjVWS2trNzBVcGpIN1RCSi9iN3ZCeTQxK0lvQkV0ZVlqQysrMXo2K3BG?=
 =?utf-8?B?T3M2d1NrOVRUWVg3Mng2am9xNlQyczVJWHo2NExJWlJ5V3ZoRTNSMGpxbWla?=
 =?utf-8?B?REgrMXk5a1NZQStGWmhjVzVpekNKUzh6S2hlbDQ1cmE1dS9jbnUzdE5ycHVN?=
 =?utf-8?B?bU1xWUpocDA1ZEtOcGlOSzlOWC95dmNMZ09JRWhNemUzTi82MlBwUys0Q3dL?=
 =?utf-8?B?YVBZb3FMdDdLbml4QVJuZ3hZK2lXUXBrN0dRYmcxYndMUTlMblRmMmR4aHlX?=
 =?utf-8?B?ZzIzdmFUQ1pyME5xclBBdmtCOWJiS0krMWlqTUlDK2Uxbjl6eEdjY0F2dE4v?=
 =?utf-8?B?N2pGR0tuc20zSFB2dWdidEFiT1B0S1g1Z3NKdGYraWZoMmpjeEtxK0ora3VM?=
 =?utf-8?B?cGt5bWN2MDhtengwUkxYdzFJTU44RHhpWjJXTDc1Y1daZ2krczRYa2ZvZEFC?=
 =?utf-8?B?d2d6eDNLV2VXZE5PajczWTZhZ3l2NUpXTHdrU3p0alp2K0VVcXl0Ymd1d3Yw?=
 =?utf-8?B?UFI1U0lMRWpCWWlQL2pXc1VJQ0I1MktvTThEdnRXaDk0dFBkYlVGcmYwRDl0?=
 =?utf-8?B?K2tnUGhVWlQ2QTRMb1dUR3ZhbUptakNlZS8xUTMwMlZ4TGZMcXloRGd6UGdz?=
 =?utf-8?B?KzFGZG90UlpweWtxbmg2c1Jkc2kxVTFDY0pDTC9RMVJhNHoxOGhKU2NIUlpy?=
 =?utf-8?B?c3lIWTlraDdtK1AxcTJmcmE2bGhKc1h3SW5NeVJmMmNvWTU5VTFha0ZiWCt6?=
 =?utf-8?B?eHVsS0xFSHpVeFB5d0tGeHdiMXM5K0o2L1lIZEVoVGFRWGtIN2ZsNTVJalIy?=
 =?utf-8?B?TkUrVmQvY0dJb0p2QVpHeEhkN2w3S05kNWZ1em5KaGg4T3ZBMXB5UVArNHd6?=
 =?utf-8?B?VlY0V3B6SWh0K3ZWcURpZWJmbVRudUFsUnNWRE5RWUhtQWh5NzdwbXRaVllQ?=
 =?utf-8?B?b2VBODF4RFl5bUlVODl2T2J6MU1RVU9qTXVHME9LUUZXT01sak5EcEl4cjRG?=
 =?utf-8?B?N1p2QXBwSktEOTNWMGJWY3VZcHdaVUdnQUhkSUw2Y0tvWjRkYUNueFdseWZR?=
 =?utf-8?B?d2cwazg5L2g3VEFPUWZQNmFPYXZMWm9mc2lqZjdVTkdJc3pDaVNuQ2tXWlh5?=
 =?utf-8?B?bjBzdmo0ckhFY3k0cVJIMjg0WVRvQU5EY3pnd0lrWG9MWkdSNXU5dmY1VzZw?=
 =?utf-8?B?NjdkL1BkSzJDMjdMcC9ueVRxSmtzSXkrRjhacUNrWUxrVUZQSHQrRG85ZkhH?=
 =?utf-8?B?N1l6V2I0U3VZSWJTc3lIbHd0NnpmbGdWR2JHTTdwZVRFTS84UitKb2lJcDFx?=
 =?utf-8?B?cEJON3F1NW1SUUtsOVRHOEJOTzRmMHZyRUNHRTdTdnEvOUs4V292bTFiS2Yy?=
 =?utf-8?B?d0FrTndZVXRrakVYenp4N0plOFNRK0tRN2JHUnkxREhuMTJEbm81aTY1aHpw?=
 =?utf-8?B?eW1wUUJqWTlybFhhZDhhY09vVElweU10dmQvN2VSTm5IREZNMVdVTDdJbkhx?=
 =?utf-8?B?OWlGSHJtUXExWDcvWnFpaGRrRzJhUXNpN3N5cXdRWDc0RzUrYVdtZVFFdm5U?=
 =?utf-8?B?c25RS0lBbWdkdGo5U1dudytXbS94a2QyVzFTSG1sQmZNcVk5SVh4NWxSTVZX?=
 =?utf-8?B?Y29QUElDRjNqOGV3TXZoN2VrNVAyazk2T2Z3SHd6RzlENituZTFuTDBKcjdU?=
 =?utf-8?B?SzBjdWFRcVZGMndGV0UyTWVYdjBGeXF0bWlOYW90bE0zMDA1UkVTaUQrZkxT?=
 =?utf-8?B?UEl5eFltTlNRekh0ZVVIcVlXMWpYaEpkZVdUWVZ1Z3VqWGdudXIxakdseFJI?=
 =?utf-8?B?QUJ1RHJrS1krd0k3SE9JVTlmVFRiWEdTYWhwZWxqN0NjNUlCcy83MEJlYXJF?=
 =?utf-8?Q?HV6/rvDn+Okfm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f162b5-6038-4f18-5437-08d8ef8ea3fc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 13:05:19.1450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJCHEcEGveOmA7ZoVS5PWckwnqNCsapgLc12T94lwnaxZecAZEGP9ffJLaW8wOfW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4550
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAyNS4wMy4yMSB1bSAxMzo0MiBzY2hyaWViIEphc29uIEd1bnRob3JwZToKPiBPbiBUaHUs
IE1hciAyNSwgMjAyMSBhdCAwMTowOToxNFBNICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Ogo+PiBBbSAyNS4wMy4yMSB1bSAxMzowMSBzY2hyaWViIEphc29uIEd1bnRob3JwZToKPj4+IE9u
IFRodSwgTWFyIDI1LCAyMDIxIGF0IDEyOjUzOjE1UE0gKzAxMDAsIFRob21hcyBIZWxsc3Ryw7Zt
IChJbnRlbCkgd3JvdGU6Cj4+Pgo+Pj4+IE5vcGUuIFRoZSBwb2ludCBoZXJlIHdhcyB0aGF0IGlu
IHRoaXMgY2FzZSwgdG8gbWFrZSBzdXJlIG1tYXAgdXNlcyB0aGUKPj4+PiBjb3JyZWN0IFZBIHRv
IGdpdmUgdXMgYSByZWFzb25hYmxlIGNoYW5jZSBvZiBhbGlnbmVtZW50LCB0aGUgZHJpdmVyIG1p
Z2h0Cj4+Pj4gbmVlZCB0byBiZSBhd2FyZSBvZiBhbmQgZG8gdHJpY2tlcnkgd2l0aCB0aGUgaHVn
ZSBwYWdlLXRhYmxlLWVudHJ5IHNpemVzCj4+Pj4gYW55d2F5LCBhbHRob3VnaCBJIHRoaW5rIGlu
IG1vc3QgY2FzZXMgYSBzdGFuZGFyZCBoZWxwZXIgZm9yIHRoaXMgY2FuIGJlCj4+Pj4gc3VwcGxp
ZWQuCj4+PiBPZiBjb3Vyc2UgdGhlIGRyaXZlciBuZWVkcyBzb21lIHdheSB0byBpbmZsdWVuY2Ug
dGhlIFZBIG1tYXAgdXNlcywKPj4+IGdlcm5hbGx5IGl0IHNob3VsZCBhbGlnbiB0byB0aGUgbmF0
dXJhbCBwYWdlIHNpemUgb2YgdGhlIGRldmljZQo+PiBXZWxsIGEgbW1hcCgpIG5lZWRzIHRvIGJl
IGFsaWduZWQgdG8gdGhlIHBhZ2Ugc2l6ZSBvZiB0aGUgQ1BVLCBidXQgbm90Cj4+IG5lY2Vzc2Fy
aWx5IHRvIHRoZSBvbmUgb2YgdGhlIGRldmljZS4KPj4KPj4gU28gSSdtIHByZXR0eSBzdXJlIHRo
ZSBkZXZpY2UgZHJpdmVyIHNob3VsZCBub3QgYmUgaW52b2x2ZWQgaW4gYW55IHdheSB0aGUKPj4g
Y2hvb3Npbmcgb2YgdGhlIFZBIGZvciB0aGUgQ1BVIG1hcHBpbmcuCj4gTm8sIGlmIHRoZSBkZXZp
Y2Ugd2FudHMgdG8gdXNlIGh1Z2UgcGFnZXMgaXQgbXVzdCBpbmZsdWVuY2UgdGhlIG1tYXAKPiBW
QSBvciBpdCBjYW4ndCBmb3JtIGh1Z2UgcGdhZXMuCgpObywgdGhhdCdzIHRoZSBqb2Igb2YgdGhl
IGNvcmUgTU0gYW5kIG5vdCBvZiB0aGUgaW5kaXZpZHVhbCBkcml2ZXIuCgpJbiBvdGhlciB3b3Jk
cyBjdXJyZW50LT5tbS0+Z2V0X3VubWFwcGVkX2FyZWEgc2hvdWxkIGFscmVhZHkgcmV0dXJuIGEg
CnByb3Blcmx5IGFsaWduZWQgVkEuCgpNZXNzaW5nIHdpdGggdGhhdCBpbnNpZGUgZmlsZS0+Zl9v
cC0+Z2V0X3VubWFwcGVkX2FyZWEgaXMgdXR0ZXJseSAKbm9uc2Vuc2UgYXMgZmFyIGFzIEkgY2Fu
IHNlZS4KCkl0IGhhcHBlbnMgdG8gYmUgdGhpcyB3YXkgY3VycmVudGx5LCBidXQgdGhhdCBpcyBu
b3QgZXZlbiByZW1vdGVseSBnb29kIApkZXNpZ24uCgpDaHJpc3RpYW4uCgo+Cj4gSXQgaXMgdGhl
IHNhbWUgcmVhc29uIHdoeSBtbWFwIHJldHVybnMgMk0gc3R1ZmYgdGhlc2UgZGF5cyB0byBtYWtl
IFRIUAo+IHBvc3NpYmxlCj4KPiBKYXNvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
