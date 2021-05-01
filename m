Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E0B3704BE
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 03:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155E06F618;
	Sat,  1 May 2021 01:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2081.outbound.protection.outlook.com [40.107.102.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CAF46E0BE;
 Sat,  1 May 2021 01:57:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLZu8owsKmfS3WSSkTKKwxomreV/9wNzFjhNlm8igmmHclR3EE4bff6uP+lzTSfonAX5jbNlzZm+kz6QSSAbNa/IVzNfx/7SL92/3ARPLw6Id2jDqXwyhFbSkDf7pIkjFMNlW3jt79tMoWRojsNVwoef5khURDeHWmn9wzRa8fk110sTbEiUHvlyDdgowcCkWEZkDaoHywEsypkT7+epj/QVMtutR/6lOpL+q7g/tPvAmJZpBTY+6eMvjAKwg6QQLCz7XssacFu9CsWQx/MvTSbibzietnJAOGVUnQWenN9/B5MBnte4riCY+1qep0TJ/Af43Dc1KmlCsZfmdPomag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BL/5h87C7OPWCEpllXvfXCmYLcak1hEVe6Y2EQVVFM=;
 b=lMEbJ2j7L6Kri9QcexIfs5UE+cOQXAJHqbpGUJpxtKza+6N8gE62u5nWKy45HciftmszhM31I1O47ecnGqFHsVcSSVGucQbALIPe7F/bazZT0/MC9j1l7wR/YOlftlipJM0vKJmYC3yGIjTGBaFOOTm+PxTEvuQ6hGFuuqcM9oAcraFQLE2GCyp+wvFVJtdKp1gbdPJcacPO/GGy+b1/dwoCIC5R4ojapPtTxvB45ueIPyzs9iW24LgZ65k1QF89ZyKFnGnO2hG38DIAfjuR/0ebbwGfWqLk6aIKgR0HLN62JleH27mzobXUYRpb7zfVqFj1nwJ1enhDTFbK1JT0/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BL/5h87C7OPWCEpllXvfXCmYLcak1hEVe6Y2EQVVFM=;
 b=OqLOD677oyVKACR8/NXNGm/sPf3/ywKDp5qO0USjVloeH0dopKifkmmKr0kC4BfTFFzckuDN1I464aPSBZegM65T5eTNvuwftFxbJASqELXeN7wqIUO88IXbh9OLGJNM5OMYLGxuuSpa5WWbxahyzaL2IWEOyzZRmxkGL3V+qVE=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (52.135.46.212) by
 MN2PR12MB4142.namprd12.prod.outlook.com (52.135.51.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25; Sat, 1 May 2021 01:57:48 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.4065.027; Sat, 1 May 2021
 01:57:48 +0000
From: Felix Kuehling <felix.kuehling@amd.com>
Subject: [RFC] CRIU support for ROCm
To: criu@openvz.org, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Message-ID: <9245171d-ecc9-1bdf-3ecd-cf776dc17855@amd.com>
Date: Fri, 30 Apr 2021 21:57:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
Content-Language: en-US
X-Originating-IP: [142.182.183.69]
X-ClientProxiedBy: YT1PR01CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::18)
 To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.182.183.69) by
 YT1PR01CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Sat, 1 May 2021 01:57:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 163ba344-b312-493f-dc1f-08d90c4484ff
X-MS-TrafficTypeDiagnostic: MN2PR12MB4142:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB41420694E9EB3D50D807567B925D9@MN2PR12MB4142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r1xYGPJ2zJEHx9L7Xb36gtGBuqKgE0LGf8RHE8wLFbXNqxqbPQTzUUd2zcHxLn7ovni9qLLoMeHZn7BM7Yu0lJXHgwMTZBkP9aLf4N1EmRob0nclxT/NE01CV9AnBODg5eH4qrsgeKM8xhhOFeOT5UWVj9zLi1e/OUQCNftakzV/Mbwt19QUTkZye4FY9t8ZWTLRB2/YIo1Y0VWLo+FwSuv5805b3EcVwrjWEndpxUOdbBW7oXiUIOra+JcWLEYXtW6ME3NwN9a+9G2gJyTZWJMGrNro5sO8Z8xufBtooEYjTKOPgfm/6PjSs6oGqzZGTD1xUXWSmGlrtCjq+NSGG8FWgFQIRKMv0zDW+qmCQMpFQ8uNFF+5PQMLmVY/RYLRwSxOwmHGxnr3ZQbsv0CgLBoz0ObnGwMebRqs6OZ8GaMzIUL+nQSzdzvqHTQVf+IyUiNvH+LYkdvpYtz0jLYi2tce/ASKJtA2x0NNYgxzPVxY/zLfUVpdpUJKz1CeVH3RhPTLxIXNLJPEjQsTUfb0zBpOo29Aj4vKA0naS5FvO5snUcUnvmYRjKYnXwe8tJ2jmh96X9BW43fNlwKMxbpH1sl4HRy8dPdPhfle5uVXlliCQhCzyqE2cfjRa3QPgdtHz87eyTNXmb5hUrmjZHcx0T3Lk3w2CnmooiL4lumA/HNUsjuodNQsN3RgZ6UnDtbgdmMaIlcsp11S2QNnAKKqFNZVaOqKKZBzm1n4ourtspJHoOYc8Duu0YWESGlijwuH4XCmnz6PLI57aUIs1SLcRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(66556008)(54906003)(2616005)(66946007)(66476007)(956004)(31686004)(38100700002)(4326008)(16576012)(8676002)(8936002)(478600001)(110136005)(2906002)(6486002)(86362001)(26005)(186003)(44832011)(16526019)(83380400001)(5660300002)(31696002)(36756003)(966005)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q0Z3QWxJZHoxdkxDQnk0eUF5MXZvcDJYczZaNFZXS0gzS0g1eUZ4OVN2WWpY?=
 =?utf-8?B?Z1NHNW9kUll5a2hYVU5XeDAwWCtHNXc2dG1HbjlEcXNOVmJ0YlQ0aWM0N2hp?=
 =?utf-8?B?dU1YdXBOUGJLakMvdVN1ejhxcHhOTDRUdnZRMTRjdk9HOGZjaDRJckJVakJi?=
 =?utf-8?B?TzA2cG4rUG9wVCtXZ1FIVnhxakFYT1RSYVUzSVczbnhlUFFtdXh2Q3VOYlRj?=
 =?utf-8?B?cU9iWk1ncExld0x2b084RG5NVjl5RjlFS1dURzByKzRPM3ZOL3lXTWMveGwz?=
 =?utf-8?B?ejEvdENRVUNsTjNDM3JoOFIrclpicytWVnB6bFVwOGQ1bUllWDRWVVFIejBh?=
 =?utf-8?B?bU9KaWhxRXFsTm92aFJCcXhjVVQ0cGtOOWo2QkZWREhsL2xsM09NMHliRFRk?=
 =?utf-8?B?K3l0aUVJRm9jT04rTmgwZmsxVGJDUTc4dVVldnlqMm1DYTc4aTNQTC9LbE1o?=
 =?utf-8?B?YmdCTGNxd3Uzb3VEczM4MU15UkhGY0VXanJGdWVUTnZ1bDFySlRjbUVEZTl4?=
 =?utf-8?B?WXd2VlNGQWgvcDNpbExrbVFraVdnQ0RGOVR4aXpyYnhKRDBQYUpTR0lKZjdj?=
 =?utf-8?B?bDVLNnkrMkVpNU1XdjVWN0p2Mys0dzA3TEljWWlzc0NPRUx5Y0FURG1hbVFS?=
 =?utf-8?B?bDdmbGpPazhmZmlvdDZaSi9pMDVqMkRuT2ZkSFBWZXlLMFlVOEEvQVR0clBM?=
 =?utf-8?B?UjNYL0dOR0ZGVlVKRHhrdG5QNEIrS3ozTlhkVTZocU5oekJ6ZkRoaXE3OEFT?=
 =?utf-8?B?aWRIandicmpPVUpDR1ptN2YwVjYzWU5mWit0bkJpL3l0aTY3cDlOeXAvcDcy?=
 =?utf-8?B?NDZmRjVnL0RVWFZrd0xXNGg3YUJxWkMwOXdUZWdKTXV4UUVHWmY2WFNpSVJm?=
 =?utf-8?B?aVZTR0NSMUZzQlJVN2NvRXp0ZEdVSGZBblg4ZWZRNmtMditEYlJYNlpYSjAw?=
 =?utf-8?B?OXIwNUM1Q3NhbWRvRXBZNS8zbGhId1VlNlh5THdqSmxPRVk3Z0RoRDRoVE05?=
 =?utf-8?B?R0l4cW8vNzJsSmI3RUpGTkkybnhwdGJMbTJ3aFdNN3ljY1hYUmtSQ0g4aVVt?=
 =?utf-8?B?MnhSSGhqaG9iaDNBZEJTUHROUUhGdG5iY0tHclYvVW8vYkNwTGlFWlNydnpO?=
 =?utf-8?B?WCtFdmhxL1ZlMkhldmRYeUFkSVkzMFk0eVZUald4d1JEbVcrQnowTElzUXYw?=
 =?utf-8?B?cm51cHR3QnlLVUt5VG1Pa2hQRGNRYzNNcXRyM3dVZUcwRDlRdUlaK053VjJw?=
 =?utf-8?B?M054Wk9pRUZMVzFZZVZlUjdVdEpQRGhDeDV2V0UveS9hc0krRTlLYm9TdkU2?=
 =?utf-8?B?V2I1WmpEYWZObmE1MWVUaVY2eWx5VVJxMTF1YU4rK0ZRUUtFWDErSENvMWVv?=
 =?utf-8?B?VjhRU3NwQUZjNnd0MkVjOERyMUtPTEhOSGxaU1ZGbHYya2dUTDVuV2dsbzhK?=
 =?utf-8?B?QUdPQWtoaitTbzB6WkZUL2FGdzJkQVdFV3RlVFlnb3hzVUJtNk5YNkRjd2VS?=
 =?utf-8?B?Y3NDQzZ0VTB0ZkVRSzd4ckU4WFBRUlM5VDNsdWlld25KSUExYlEzNnRzVzJa?=
 =?utf-8?B?K05DVFFpRlZndnhicjBLQy9aMHU0emZEWmMzdGJWbGxCeHVZZit4YVlaM0cv?=
 =?utf-8?B?OG81cjdSRGhNTmhsa1BGYW1zVGxvN1p2eVlQcG9yMC9BMUthcHpQWXFYbjhM?=
 =?utf-8?B?V0NYVXpqSmxOS1FiT2NNYUVSZXZVdlBhb1RTWGxpOE5RUzhRdUVxbUQ1bTVr?=
 =?utf-8?Q?d9WVopbUoe5KgSkTOOOROqs/4FSTdrEVSdxjjLj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 163ba344-b312-493f-dc1f-08d90c4484ff
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2021 01:57:47.9829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hl/Hsj6rrFE+o0J0LY7IkoYP1xPtkmz9gqZWIrNl9WXi0BihH+tmFy/iJF4PPoNtDZmzfwWgzxX798ulcqmkfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142
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
Cc: Alexander Mihalicyn <alexander@mihalicyn.com>,
 Pavel Emelyanov <ovzxemul@gmail.com>, "Bhardwaj,
 Rajneesh" <Rajneesh.Bhardwaj@amd.com>, Pavel Tikhomirov <snorcht@gmail.com>,
 "Yat Sin, David" <David.YatSin@amd.com>, Adrian Reber <adrian@lisas.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgaGF2ZSBiZWVuIHdvcmtpbmcgb24gYSBwcm90b3R5cGUgc3VwcG9ydGluZyBDUklVIChDaGVj
a3BvaW50L1Jlc3RvcmUKSW4gVXNlcnNwYWNlKSBmb3IgYWNjZWxlcmF0ZWQgY29tcHV0ZSBhcHBs
aWNhdGlvbnMgcnVubmluZyBvbiBBTUQgR1BVcwp1c2luZyBST0NtIChSYWRlb24gT3BlbiBDb21w
dXRlIFBsYXRmb3JtKS4gV2UncmUgaGFwcHkgdG8gZmluYWxseSBzaGFyZQp0aGlzIHdvcmsgcHVi
bGljbHkgdG8gc29saWNpdCBmZWVkYmFjayBhbmQgYWR2aWNlLiBUaGUgZW5kLWdvYWwgaXMgdG8K
Z2V0IHRoaXMgd29yayBpbmNsdWRlZCB1cHN0cmVhbSBpbiBMaW51eCBhbmQgQ1JJVS4gQSBzaG9y
dCB3aGl0ZXBhcGVyCmRlc2NyaWJpbmcgb3VyIGRlc2lnbiBhbmQgaW50ZW50aW9uIGNhbiBiZSBm
b3VuZCBvbiBHaXRodWI6Cmh0dHBzOi8vZ2l0aHViLmNvbS9SYWRlb25PcGVuQ29tcHV0ZS9jcml1
L3RyZWUvY3JpdS1kZXYvdGVzdC9vdGhlcnMvZXh0LWtmZC9SRUFETUUubWQuCgpXZSBoYXZlIFJG
QyBwYXRjaCBzZXJpZXMgZm9yIHRoZSBrZXJuZWwgKGJhc2VkIG9uIEFsZXggRGV1Y2hlcidzCmFt
ZC1zdGFnaW5nLWRybS1uZXh0IGJyYW5jaCkgYW5kIGZvciBDUklVIGluY2x1ZGluZyBhIG5ldyBw
bHVnaW4gYW5kIGEKZmV3IGNvcmUgQ1JJVSBjaGFuZ2VzLiBJIHdpbGwgc2VuZCB0aG9zZSB0byB0
aGUgcmVzcGVjdGl2ZSBtYWlsaW5nIGxpc3RzCnNlcGFyYXRlbHkgaW4gYSBtaW51dGUuIFRoZXkg
Y2FuIGFsc28gYmUgZm91bmQgb24gR2l0aHViLgoKICAgIENSSVUrcGx1Z2luOiBodHRwczovL2dp
dGh1Yi5jb20vUmFkZW9uT3BlbkNvbXB1dGUvY3JpdS9jb21taXRzL2NyaXUtZGV2CiAgICBLZXJu
ZWwgKEtGRCk6CiAgICBodHRwczovL2dpdGh1Yi5jb20vUmFkZW9uT3BlbkNvbXB1dGUvUk9DSy1L
ZXJuZWwtRHJpdmVyL2NvbW1pdHMvZnhrYW1kL2NyaXUtd2lwCgpBdCB0aGlzIHBvaW50IHRoaXMg
aXMgdmVyeSBtdWNoIGEgd29yayBpbiBwcm9ncmVzcyBhbmQgbm90IHJlYWR5IGZvcgp1cHN0cmVh
bSBpbmNsdXNpb24uIFRoZXJlIGFyZSBzdGlsbCBzZXZlcmFsIG1pc3NpbmcgZmVhdHVyZXMsIGtu
b3duCmlzc3VlcywgYW5kIG9wZW4gcXVlc3Rpb25zIHRoYXQgd2Ugd291bGQgbGlrZSB0byBzdGFy
dCBhZGRyZXNzaW5nIHdpdGgKeW91ciBmZWVkYmFjay4KCldoYXQncyB3b3JraW5nIGFuZCB0ZXN0
ZWQgYXQgdGhpcyBwb2ludDoKCiAgKiBDaGVja3BvaW50IGFuZCByZXN0b3JlIGFjY2VsZXJhdGVk
IG1hY2hpbmUgbGVhcm5pbmcgYXBwczogUHlUb3JjaAogICAgcnVubmluZyBCZXJ0IG9uIHN5c3Rl
bXMgd2l0aCAxIG9yIDIgR1BVcyAoTUk1MCBvciBNSTEwMCksIDEwMCUKICAgIHVubW9kaWZpZWQg
dXNlciBtb2RlIHN0YWNrCiAgKiBDaGVja3BvaW50IG9uIG9uZSBzeXN0ZW0sIHJlc3RvcmUgb24g
YSBkaWZmZXJlbnQgc3lzdGVtCiAgKiBDaGVja3BvaW50IG9uIG9uZSBHUFUsIHJlc3RvcmUgb24g
YSBkaWZmZXJlbnQgR1BVCgpNYWpvciBLbm93biBpc3N1ZXM6CgogICogVGhlIEtGRCBpb2N0bCBB
UEkgaXMgbm90IGZpbmFsOiBOZWVkcyBhIGNvbXBsZXRlIHJlZGVzaWduIHRvIGFsbG93CiAgICBm
dXR1cmUgZXh0ZW5zaW9uIHdpdGhvdXQgYnJlYWtpbmcgdGhlIEFCSQogICogVmVyeSBzbG93OiBO
ZWVkIHRvIGltcGxlbWVudCBETUEgdG8gZHVtcCBWUkFNIGNvbnRlbnRzCgpNaXNzaW5nIG9yIGlu
Y29tcGxldGUgZmVhdHVyZXM6CgogICogU3VwcG9ydCBmb3IgdGhlIG5ldyBLRkQgU1ZNIEFQSQog
ICogQ2hlY2sgZGV2aWNlIHRvcG9sb2d5IGR1cmluZyByZXN0b3JlCiAgKiBDaGVja3BvaW50IGFu
ZCByZXN0b3JlIG11bHRpcGxlIHByb2Nlc3NlcwogICogU3VwcG9ydCBmb3IgYXBwbGljYXRpb25z
IHVzaW5nIE1lc2EgZm9yIHZpZGVvIGRlY29kZS9lbmNvZGUKICAqIFRlc3Rpbmcgd2l0aCBtb3Jl
IGRpZmZlcmVudCBHUFVzIGFuZCB3b3JrbG9hZHMKCkJpZyBPcGVuIHF1ZXN0aW9uczoKCiAgKiBX
aGF0J3MgdGhlIHByZWZlcnJlZCB3YXkgdG8gcHVibGlzaCBvdXIgQ1JJVSBwbHVnaW4/IEluLXRy
ZWUgb3IKICAgIG91dC1vZi10cmVlPwogICogV2hhdCdzIHRoZSBwcmVmZXJyZWQgd2F5IHRvIGRp
c3RyaWJ1dGUgb3VyIENSSVUgcGx1Z2luPyBTb3VyY2U/CiAgICBCaW5hcnkgLnNvPyBXaG9sZSBD
UklVPyBKdXN0IGluLWJveCBzdXBwb3J0PwogICogSWYgb3VyIHBsdWdpbiBjYW4gYmUgdXBzdHJl
YW1lZCBpbiB0aGUgQ1JJVSB0cmVlLCB3aGF0IHdvdWxkIGJlIHRoZQogICAgcmlnaHQgZGlyZWN0
b3J5PwoKQmVzdCByZWdhcmRzLArCoCBGZWxpeAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
