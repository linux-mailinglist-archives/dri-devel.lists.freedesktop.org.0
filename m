Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0712D589D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 11:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF656EA78;
	Thu, 10 Dec 2020 10:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2060.outbound.protection.outlook.com [40.107.102.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B4D6EA78
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 10:53:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0GKVTFr8WKTqSOptoLNVwjRapcFhfpH5/dH1XTI2PgpqU/AEfpMae7GupIiMIE3elf5iJP0EwI/1Sgj0jtBRS0UqBiROlDHj1jXssouB20mYgsiNgZVY4qOkHfzSbcvyXhh5Lx7Rxc6NxSLQT+3ROt1sUHgng++BDwz+UdqARlPtbLUkwQd3mChMKAkpCddcIAHq8B/BzuBb2DW76QKrpz5qu3KK16btcU8k17FdjAzo3gljEuZ8scPwMlcg+Bi1OgQ1MGlqoB8NjMS2XilwWG60EGxFq0/SrZZHpBe9wfrZbkA6ILtzMSVumdhCZJHAZCCtLC+0HNw66Y0BUsnhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BpLuvvG1a69WQrKST/o5H1tR+80jPyqGfKAD0QKuhW8=;
 b=SFWbMiMD/Owzru/YIO4+xVvS84zF/h2PgyWtgWM/LHcYINKbnmpfkXGdbO4wndGCLB2m8HKdmqJzVmr2YXneCMD0+pjXka3WJv1wopD6s2alksAS7GDokCaNDIGC9AAX878x4qHnKTQzdjzQ9xxOxiOe75tJd1gkTAWHY62lJMrIs1VYzQvJGct4hQHSP29/NipBSaTujokDzn+vuqjmWfxqYihw4KDSWfZgwWPQRysuKKFPfB4J+SbZgtFrrp4rxxL5ULNwTpIoDNHttWB32mvBtlpP9Fa/TOfLKRB/Xi0ACEm6mwg2geb2+ge8m3VkVJIF8Mt3AkZsZC6i1/taKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BpLuvvG1a69WQrKST/o5H1tR+80jPyqGfKAD0QKuhW8=;
 b=uA5lyxqjVXqOoWCS3F4Bdf4dz7JZhBAbP/Qk1L7H+N/43nAdhbiMIinqMoiZEQdktMlgxMkcySfMZjSrny65fK4Oo8XG2ac6yeM4R2yPlBTOdWTfpcTN95GUSgSixL70nFgSn2O1c9wfWWSm8vcKj96h4w7BLJnx/TxK9Kays6o=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3967.namprd12.prod.outlook.com (2603:10b6:208:16c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 10 Dec
 2020 10:53:12 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.016; Thu, 10 Dec 2020
 10:53:12 +0000
Subject: Re: Fence wait in mmu_interval_notifier_ops::invalidate
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <912c29f1-4e17-8b66-419b-1854d03845fd@shipmail.org>
 <20201209163731.GU552508@nvidia.com>
 <b4018af1-998f-dc79-c83a-8eac95cb1ceb@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1b52322f-569e-f523-3baa-ffb822cb72c2@amd.com>
Date: Thu, 10 Dec 2020 11:53:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <b4018af1-998f-dc79-c83a-8eac95cb1ceb@shipmail.org>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4P190CA0006.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::16) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4P190CA0006.EURP190.PROD.OUTLOOK.COM (2603:10a6:200:56::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 10:53:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d4a97b7a-7939-4c96-a760-08d89cf9c9f9
X-MS-TrafficTypeDiagnostic: MN2PR12MB3967:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3967747C9B3DAE9FAEF42A6483CB0@MN2PR12MB3967.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WTkDRn9bi5ID8a3ZQO/N4llVO6lZkFkX2pImiLg6RB4l2ud+8cnUPRv9gLMfMg6dA6bbSuTpSrFbdk6aH9Pl0HD4aw13O2eiDYxgCsRr6vYDwbrRWIxSW7tqbBajyjnN67HVQIswbudvvUo9idY1t17fnb/ujBncFXFNJlkvloRFqqVEmmIdo3frF6rnty9+/cYOeRm+M0CLNlU+ahHEDCFPA1od/5EG68TeZ9Ur+k8WHy2E0eztNebgpQmQcMikOmgF3Of0ukauOdJMUTOKjMplxx8C2Tu9PYPSSOaRZs8aCYmH6G/Ug0XfC6OIkE4gwLW1VQ8va/yXb9tm2UOoejs2+s259ADKcAk5qrZHqcE1BnowCIv6G3+BK3oiKHR+lWJef1uEZstdPmck+443B8AxsViOYKjPqp1jo1XjrHO4oB3VUQnT+jE+tN6a+GGJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(376002)(52116002)(6486002)(34490700003)(36756003)(8676002)(66476007)(66556008)(31686004)(2906002)(66946007)(31696002)(8936002)(53546011)(6666004)(83380400001)(86362001)(5660300002)(2616005)(110136005)(186003)(508600001)(66574015)(16526019)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RjBGUGE5SEo4SEt5QzVYNHQ0ZisrM24xVDNydHhZRkNMc01YKzZjY2FFUjEy?=
 =?utf-8?B?QmR1R3RHT0NXMDk4Z2VyMkYrTHpLcTQ3NFhOQlluRURJK1VzeHowUElqRno0?=
 =?utf-8?B?dFg0MGFhOFRJamZwSW1jMUllT1c4a0NyN1IzOGo3YVI0TXB0NGlsTWl2TWhT?=
 =?utf-8?B?RGlmajg2THpXemhTelVXSVZTei95eDhSbDdhWHNnNXpuNTBjd3dSUHVtQWl5?=
 =?utf-8?B?ZFJkSi9QdDhnWTBicW5CZmprOFVBclYzZDBtcGxsZHJGamprakk4aklYdUM5?=
 =?utf-8?B?bmtacUdNeG1IYTFlY29kbkJ6UXcrcS9GVWpTeC84MGhER3NXVCtZZnhpTlg4?=
 =?utf-8?B?Z0ZiL1pwYlJhNHgzNTdod3FBVjdPQXpWNFMxeXpEeFdiRWpoL3hCQUk1d1gv?=
 =?utf-8?B?alNxRjhFZmVIRGNGaWkrakNiODh1bGZBT3lnUDZnTTl5MVYyQzI3ZVdwNk41?=
 =?utf-8?B?bWVqL1ZYWGFPaEN5djRCcUlhUkZ6eER0RHY3VElRQkFNdEt1cEpMZ2ZFQm9l?=
 =?utf-8?B?S3hlRkRtRVBsMFcrbGVGdDZ3TEJIbXBYL3dwV0VqODhxT3dQbHliSzZvSDVm?=
 =?utf-8?B?cUQ0cU13dWUxZFlCNmZLSGJMUGY1cWZodFJXbjByUG44TzBtTUZTamQ4U0J0?=
 =?utf-8?B?QU55d2FyWklUWSt3bTVEQTFTRS91WVpxanJBY1RJeWEwM1NZQzRITkpuUFJ0?=
 =?utf-8?B?ZUJGQ1dWSTZJbHZiYmkzRG51UU1oMStZRlV1ZkVBQ0pOenNvdnREbEw1VVI1?=
 =?utf-8?B?MWRKaWZzWmpnalRQZ0oyUW45Q0JGeWdtS1RYeEtCU3lsZlhPR0Z6VTV2WjRC?=
 =?utf-8?B?Ujh1OEZJTlIrU3R3Vm5ZcWt1dE10NzV6aWk3NzFYNnN0QUNqby9kR0kxaGlF?=
 =?utf-8?B?eFgyeGdrNlY0YzVKSE11YlVXQllZUlNvbXFhZVRVTU5FN1M1TFl1OENqVmlU?=
 =?utf-8?B?MGpmTENsTEdMUlV4dDNwVlVBbU5sbDR5TGU3MGhINVZyOG9paGV1NGlRVlVa?=
 =?utf-8?B?R2I2T29JZXN4ZTNBQ082RGVtVVh6UE5JOW44WnJib1lpL3FONUcrTWd6RjFo?=
 =?utf-8?B?dCtIc29LaEZDSW0yelp5NmpjZmM4ajdxUDlpdXVyU3B1aFl2MnMyeG1oQTB3?=
 =?utf-8?B?UzRISXdoNjk4dVczaGorQ3VuV0xJK01RUHc3VXI3QWN6ZVlQTm9FWDNuN094?=
 =?utf-8?B?ZkJJYzd4bW54VkVVK0t0UVozTUplZnluWEtqMDY3TkxRVlhCWXJsZ2RseGph?=
 =?utf-8?B?S0M3TzA3djRqajlHRFp5WTB2Z2w1a1hLUjBVNFpkMGt3WVRQNkZKTW54ZlZG?=
 =?utf-8?B?UWZWbitJWGUzV1V0UE5kcmJzUW9sNWRoZmJrUDRoVkxIaHlBMFF6WnU1dE1l?=
 =?utf-8?B?NlRFSFNIZEdvakVTaFhOcjZybTcxaDdLbXJOWk5vMmNzaUU4eTdiemVRZjZY?=
 =?utf-8?Q?UXH3ryic?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 10:53:12.1567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a97b7a-7939-4c96-a760-08d89cf9c9f9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kYvgHJnI41JPPbrIxd3ZfFPwm2O3yDDECLhT7rv1VJ7+RMpOWasrdxweUskz2UtV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3967
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDkuMTIuMjAgdW0gMTc6NDYgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpOgo+
Cj4gT24gMTIvOS8yMCA1OjM3IFBNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4+IE9uIFdlZCwg
RGVjIDA5LCAyMDIwIGF0IDA1OjM2OjE2UE0gKzAxMDAsIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRl
bCkgCj4+IHdyb3RlOgo+Pj4gSmFzb24sIENocmlzdGlhbgo+Pj4KPj4+IEluIG1vc3QgaW1wbGVt
ZW50YXRpb25zIG9mIHRoZSBjYWxsYmFjayBtZW50aW9uZWQgaW4gdGhlIHN1YmplY3QgCj4+PiB0
aGVyZSdzIGEKPj4+IGZlbmNlIHdhaXQuCj4+PiBXaGF0IGV4YWN0bHkgaXMgaXQgbmVlZGVkIGZv
cj8KPj4gSW52YWxpZGF0ZSBtdXN0IHN0b3AgRE1BIGJlZm9yZSByZXR1cm5pbmcsIHNvIHByZXN1
bWFibHkgZHJpdmVycyB1c2luZwo+PiBhIGRtYSBmZW5jZSBhcmUgcmVseWluZyBvbiBhIGRtYSBm
ZW5jZSBtZWNoYW5pc20gdG8gc3RvcCBETUEuCj4KPiBZZXMsIHNvIGZhciBJIGZvbGxvdywgYnV0
IHdoYXQncyB0aGUgcmVhc29uIGRyaXZlcnMgbmVlZCB0byBzdG9wIERNQT8KCldlbGwgaW4gZ2Vu
ZXJhbCBhbiBpbnZhbGlkYXRpb24gbWVhbnMgdGhhdCB0aGUgc3BlY2lmaWVkIHBhcnQgb2YgdGhl
IApwYWdlIHRhYmxlcyBhcmUgdXBkYXRlZCwgZWl0aGVyIHdpdGggbmV3IGFkZHJlc3NlcyBvciBu
ZXcgYWNjZXNzIGZsYWdzLgoKSW4gYm90aCBjYXNlcyB5b3UgbmVlZCB0byBzdG9wIHRoZSBETUEg
YmVjYXVzZSB5b3UgY291bGQgb3RoZXJ3aXNlIHdvcmsgCndpdGggc3RhbGUgZGF0YSwgZS5nLiBy
ZWFkL3dyaXRlIHdpdGggdGhlIHdyb25nIGFkZHJlc3NlcyBvciB3cml0ZSB0byBhIApyZWFkIG9u
bHkgcmVnaW9uIGV0Yy4uLgoKPiBJcyBpdCBmb3IgaW52bGlkYXRpb24gYmVmb3JlIGJyZWFraW5n
IENPVyBhZnRlciBmb3JrIG9yIHNvbWV0aGluZyAKPiByZWxhdGVkPwoKVGhpcyBpcyBqdXN0IG9u
ZSBvZiBtYW55IHVzZSBjYXNlcyB3aGljaCBjb3VsZCBpbnZhbGlkYXRlIGEgcmFuZ2UuIEJ1dCAK
dGhlcmUgYXJlIG1hbnkgbW9yZSwgYm90aCBmcm9tIHRoZSBrZXJuZWwgYXMgd2VsbCBhcyB1c2Vy
c3BhY2UuCgpKdXN0IGltYWdpbmcgdGhhdCB1c2Vyc3BhY2UgZmlyc3QgbW1hcHMoKSBzb21lIGFu
b255bW91cyBtZW1vcnkgci93LCAKc3RhcnRzIGEgRE1BIHRvIGl0IGFuZCB3aGlsZSB0aGUgRE1B
IGlzIG9uZ29pbmcgZG9lcyBhIHJlYWRvbmx5IG1tYXAoKSAKb2YgbGliYyB0byB0aGUgc2FtZSBs
b2NhdGlvbi4KClNpbmNlIG1vc3QgaGFyZHdhcmUgZG9lc24ndCBoYXZlIHJlY292ZXJhYmxlIHBh
Z2UgZmF1bHRzIGd1ZXNzIHdoYXQgCndvdWxkIGhhcHBlbiBpZiB3ZSBkb24ndCB3YWl0IGZvciB0
aGUgRE1BIHRvIGZpbmlzaD8gVGhhdCB3b3VsZCBiZSBhIApzZWN1cml0eSBob2xlIHlvdSBjYW4g
cHVzaCBhbiBlbGVwaGFudCB0aHJvdWdoIDopCgpDaGVlcnMsCkNocmlzdGlhbi4KCj4KPiBUaGFu
a3MsCj4KPiBUaG9tYXMKPgo+Pgo+PiBKYXNvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
