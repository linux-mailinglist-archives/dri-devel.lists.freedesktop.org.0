Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 612572F5571
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 01:07:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A386E8CC;
	Thu, 14 Jan 2021 00:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693476E8A1;
 Thu, 14 Jan 2021 00:06:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/4kono+SB0mOUI1ZTnznRPaoV6UJYY1RIZDJwSdJBseGpywebSfa7re5MZtPJ0x9V5nm4xA+3dTDaeBFSsZEjRYoh+v60SXYRDJ0k7rSn4gjQMpC4RMna0TAp7uV/BruoFO7oDwp6PXBBkWQSufIqz7hsZpuSE3r4Y1shOPmWMQlFHwvGVzvXloQPRtFThbCSzYpELL/ZV+MhIUMoCi3Xk1iJg5NyPfG/Chj3bzoBGievf7t6b3CAq+rVPvNDwCLfSf5+HjMntxxW6PqMdkD09Azdbn3pTkjLXBFpanZI+6yz6bofCeeLv19HGZgjHOuQUzqR8eWLEUtWE3hFUnNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQiq0GGBAyHUey9VFHiLy05ajHqpxWjj7Otq1eIsDcc=;
 b=G/LKAHx8fSuIxsynOv3z77kIRBtTxsZAmTDc0iBOImGE6JyzdQDG3WUz0IUo69uL3YlcA2CFQt88pu026dY0UfgN7VhNKrcCWM+OrbDuYLqKUe6IrOJdMJ9vTnrbRQLo+jd90RuSZHxCB32HCPZTvhZSVhKPfynmeOObIqiiL5EbkXSBUC2xqBVvwJqYFJdM02+LLcDbJBeYUb963t17rac3mLkXI2C/rWw9xsmd2k27lyTrj1Vh1Wm2TiLTKFxMIiRoDRzMOOIIxzaFP2EV3TC6pp7QG7HO5wDwUy6obM69XMmgJlgwx0UBE5Z0pr8Qs6MvWMsWzCLA98kLY4A2Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQiq0GGBAyHUey9VFHiLy05ajHqpxWjj7Otq1eIsDcc=;
 b=BBGwESVyDvMIZVkTpbwA6knsQ36NrPr/Bref9RaRYuORVVN46DthlvL73MqrBMf4QiJg6SicoHTacLSRNuyLzio6IV31XJWY2qitnfEtT7388mvS/Ftp6Xn2AEJcK7YkC5rIGwzC2q5bAs0FBamYmhJHMAdn+5YtXNWheNKwiwc=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4900.namprd12.prod.outlook.com (2603:10b6:208:1c1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 14 Jan
 2021 00:06:56 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 00:06:56 +0000
Subject: Re: [PATCH 00/35] Add HMM-based SVM memory manager to KFD
To: Jerome Glisse <jglisse@redhat.com>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
 <20210113164747.GA521755@redhat.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <a419576a-3e03-cf2c-e96e-de5a1d0a8043@amd.com>
Date: Wed, 13 Jan 2021 19:06:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210113164747.GA521755@redhat.com>
Content-Language: en-US
X-Originating-IP: [142.117.121.176]
X-ClientProxiedBy: YT1PR01CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::27) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.117.121.176) by
 YT1PR01CA0058.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 00:06:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c8eb8a0b-bb6d-47cf-248a-08d8b8204e3a
X-MS-TrafficTypeDiagnostic: BL0PR12MB4900:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB490045357721CAD269F0ADE392A80@BL0PR12MB4900.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NW8cs+w/ZBaV4IRhzzHb1sXmeXENCaenicv/LjxrwLbrrgr+G8xsRi9Xjy0/OglUJ3ndr8cRTYE6usDvSC9u9zIuawBttmW3qIK5EPMx6nmGa71WzqKUiAwJmIksjM5nV9TrSK69fpg4KMmai5hegnpRdOEiGbs9M4XISQEQ0dMHOOEcLbWmeErU68kU0su8ZMbbLrmz2IsojPRR12ciU9WSr1nQwZW2j4G2XudoiYWqaUp5ewNSunHNNacjRmSfOhl5igLwMM/ExWlIxg0h8zonEgL19uz+/gxl1WIdEC0Tzp4HXLgnQvUwJn0FdkA9HZQBOfqQDpnk9llYiWGE0X3B8wA/noPeF2rb6Wu77/XZKScUs/gRwMrQ/QFW7M6XrAWYP9IbY/l6lF6s2LMuY3JEsNv+Wc3GEogBogt0/ZUprveABPepp/ixsc1eAMqJDji9xurgWrWTExnX9ZQNvICm/pIKr015CY+jzbcM57I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(6916009)(4326008)(16576012)(66476007)(6486002)(956004)(316002)(83380400001)(86362001)(31696002)(8676002)(2616005)(8936002)(66946007)(52116002)(186003)(36756003)(44832011)(478600001)(16526019)(31686004)(5660300002)(26005)(2906002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bG5mNnpUaUxLWFMzZWgxZVdINy9DZy90VHhMaFFJUW9VQlZJWng0RU1oL2g0?=
 =?utf-8?B?ejB4VVExZWUzQTg3TU0xYjNYSE1yUndUZnZtdGIxOHFlZFlucGxUVWozMGMw?=
 =?utf-8?B?ZmJVcmhScHU3RllZb1NtK0VodSt2NC9uQ2V6VlJ0TDVxdjFUMTZXbDNnc3dZ?=
 =?utf-8?B?aTF2ZmIvSjJlbVIxS2lsK0RCTnVkQXFFVjJlVGNwZnBjb3ovUjFBL1ptbDlw?=
 =?utf-8?B?bUtDVlU3RWFDUnZ4NU9qVGswRytnZkEyVzVndFBQMVdvY08rT29XRmtIZ2pV?=
 =?utf-8?B?cHBBaGRFMEtXYWNobWd6czk1d0wvRUZXcC9HUVlvWDhmeUdwYkpIck84c09z?=
 =?utf-8?B?NnZMaVI1NWRaNjdCTVJQYTNiL1JZWmZkOEJ4TXdkem1kOHVQVlFpUXFSWlpC?=
 =?utf-8?B?bk1Cc3ZoUzNqUGFNM0FCWUhhblNkZnNDQWdEOFlqUG1VZklVdDhuQ0dhWGFC?=
 =?utf-8?B?SCtjTW9pMXNGQjR5TFgyS2pRTDFCLytxSTV1dnlEbGtRSHJCTjhTVjVYbW1k?=
 =?utf-8?B?MEg2ZVhGYkhabi9neFFjR0lhWmR5ZmNIRnRyVWx3REpqU0xvQ25yM3hPT0VE?=
 =?utf-8?B?dlhsT1M3aGxOVzhXWkJ2Z2cyK3lJUllySnR4TVdCZFp1VlVNTTU4TW4rOFFw?=
 =?utf-8?B?K3Y0aEx2emNDUzEyQkgvZ1ovVVdxVWxYbGt6T3JuWWNXMkZIdzRUcUtCbFI5?=
 =?utf-8?B?em9kcUJpTytIcDhqVkpGcUkyYmVoK1laWlNJK29VYWFwMWI1VExRbHB4dlZh?=
 =?utf-8?B?b041STZEd29LMzZsRmVsc2pYSGwzSUJDeDJ2K3E1U3BvUDV1Wk5yN2Z5QWlU?=
 =?utf-8?B?SHYxM1hSZDBHZVFrZ09TbHpneVBmM1BJY0VqV21EWi8vQm1DM2ZzU0c1ck5H?=
 =?utf-8?B?d2VKZC9CRmxTOUVzTEtkQmZUVXVzNDFyYSs3WE9WSzcvWHd0ck9lRThzODRI?=
 =?utf-8?B?REl0TXBpMU0rWkFoQi9STzZOR1EwUnJZZ1dxQnJoMGZHNnRXdVNQY0NreTZq?=
 =?utf-8?B?KzlwNDdNby9wSnhlZFo2WlJhQTNRZ2NIMkJXREd4d3JNK2l3djBacHQ1WUli?=
 =?utf-8?B?d3hMWUpZWUMrdE1WRStZMm02b1dvVzFtOEFmSzI2aHFHM0MrMlNwL1hDaGlv?=
 =?utf-8?B?STRaWnpoYWo4K1JZYVRaU3BFU0cwd3NGRzJacE9HUk80S1orTU1YMTRBY0xQ?=
 =?utf-8?B?bUlVS09LRWk1MFdzVytRRm44cURMN3hvTURFaEdRODlJOHFjWW8reFAvdUJ4?=
 =?utf-8?B?bGhOWExTUktNTHcxWEVqMHhTZjBRbm1IeVBRQi9adDQ4UzJyY3Q0bkxBS2pG?=
 =?utf-8?Q?T/3xaPSNvU1k+6YXl3o3oQcpfxhdx1yMcx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 00:06:56.2807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: c8eb8a0b-bb6d-47cf-248a-08d8b8204e3a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GtKhKASfe0qGxlvvsLIWcxtcwfgy31VL/rUb3BGhXMp4lq9r+iyuaykmofsUc+SeS3HaU0PmrF6kLUjfl7qc6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4900
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
Cc: alex.sierra@amd.com, philip.yang@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkFtIDIwMjEtMDEtMTMgdW0gMTE6NDcgYS5tLiBzY2hyaWViIEplcm9tZSBHbGlzc2U6Cj4gT24g
V2VkLCBKYW4gMDYsIDIwMjEgYXQgMTA6MDA6NTJQTSAtMDUwMCwgRmVsaXggS3VlaGxpbmcgd3Jv
dGU6Cj4+IFRoaXMgaXMgdGhlIGZpcnN0IHZlcnNpb24gb2Ygb3VyIEhNTSBiYXNlZCBzaGFyZWQg
dmlydHVhbCBtZW1vcnkgbWFuYWdlcgo+PiBmb3IgS0ZELiBUaGVyZSBhcmUgc3RpbGwgYSBudW1i
ZXIgb2Yga25vd24gaXNzdWVzIHRoYXQgd2UncmUgd29ya2luZyB0aHJvdWdoCj4+IChzZWUgYmVs
b3cpLiBUaGlzIHdpbGwgbGlrZWx5IGxlYWQgdG8gc29tZSBwcmV0dHkgc2lnbmlmaWNhbnQgY2hh
bmdlcyBpbgo+PiBNTVUgbm90aWZpZXIgaGFuZGxpbmcgYW5kIGxvY2tpbmcgb24gdGhlIG1pZ3Jh
dGlvbiBjb2RlIHBhdGhzLiBTbyBkb24ndAo+PiBnZXQgaHVuZyB1cCBvbiB0aG9zZSBkZXRhaWxz
IHlldC4KPiBbLi4uXQo+Cj4+IEtub3duIGlzc3VlczoKPj4gKiB3b24ndCB3b3JrIHdpdGggSU9N
TVUgZW5hYmxlZCwgd2UgbmVlZCB0byBkbWFfbWFwIGFsbCBwYWdlcyBwcm9wZXJseQo+PiAqIHN0
aWxsIHdvcmtpbmcgb24gc29tZSByYWNlIGNvbmRpdGlvbnMgYW5kIHJhbmRvbSBidWdzCj4+ICog
cGVyZm9ybWFuY2UgaXMgbm90IGdyZWF0IHlldAo+IFdoYXQgd291bGQgdGhvc2UgY2hhbmdlcyBs
b29rcyBsaWtlID8gU2VlaW5nIHRoZSBpc3N1ZSBiZWxvdyBpIGRvIG5vdAo+IHNlZSBob3cgdGhl
eSBpbnRlci1wbGF5IHdpdGggbW11IG5vdGlmaWVyLiBDYW4geW91IGVsYWJvcmF0ZS4KCldlIGN1
cnJlbnRseSBoYXZlIHNvbWUgcmFjZSBjb25kaXRpb25zIHdoZW4gbXVsdGlwbGUgdGhyZWFkcyBh
cmUgY2F1c2luZwptaWdyYXRpb25zIGNvbmN1cnJlbnRseSAoZS5nLiBDUFUgcGFnZSBmYXVsdHMs
IEdQVSBwYWdlIGZhdWx0cywgbWVtb3J5CmV2aWN0aW9ucywgYW5kIGV4cGxpY2l0IHByZWZldGNo
IGJ5IHRoZSBhcHBsaWNhdGlvbikuCgpJbiB0aGUgY3VycmVudCBwYXRjaCBzZXJpZXMgd2Ugc2V0
IHVwIG9uZSBNTVUgcmFuZ2Ugbm90aWZpZXIgZm9yIHRoZQplbnRpcmUgYWRkcmVzcyBzcGFjZSBi
ZWNhdXNlIHdlIGhhZCB0cm91YmxlIHNldHRpbmcgdXAgTU1VIG5vdGlmaWVycyBmb3IKc3BlY2lm
aWMgYWRkcmVzcyByYW5nZXMuIFRoZXJlIGFyZSBzaXR1YXRpb25zIHdoZXJlIHdlIHdhbnQgdG8g
ZnJlZSBvcgpmcmVlL3Jlc2l6ZS9yZWFsbG9jYXRlIE1NVSByYW5nZSBub3RpZmllcnMsIGJ1dCB3
ZSBjYW4ndCBkdWUgdG8gdGhlCmxvY2tpbmcgY29udGV4dCB3ZSdyZSBpbjoKCiAgKiBNTVUgcmVs
ZWFzZSBub3RpZmllciB3aGVuIGEgdmlydHVhbCBhZGRyZXNzIHJhbmdlIGlzIHVubWFwcGVkCiAg
KiBDUFUgcGFnZSBmYXVsdCBoYW5kbGVyCgpJbiBib3RoIHRoZXNlIHNpdHVhdGlvbnMgd2UgbWF5
IG5lZWQgdG8gc3BsaXQgdmlydHVhbCBhZGRyZXNzIHJhbmdlcwpiZWNhdXNlIHdlIG9ubHkgd2Fu
dCB0byBmcmVlIG9yIG1pZ3JhdGUgYSBwYXJ0IG9mIGl0LiBJZiB3ZSBoYXZlCnBlci1hZGRyZXNz
IHJhbmdlIG5vdGlmaWVycyB3ZSBhbHNvIG5lZWQgdG8gZnJlZSBvciBjcmVhdGUgbm90aWZpZXJz
LAp3aGljaCBpcyBub3QgcG9zc2libGUgaW4gdGhvc2UgY29udGV4dHMuIE9uIHRoZSBvdGhlciBo
YW5kLCB1c2luZyBhCnNpbmdsZSByYW5nZSBub3RpZmllciBmb3IgZXZlcnl0aGluZyBjYXVzZXMg
dW5uZWNlc3Nhcnkgc2VyaWFsaXphdGlvbi4KCldlJ3JlIHJld29ya2luZyBhbGwgb2YgdGhpcyB0
byBoYXZlIHBlci1hZGRyZXNzIHJhbmdlIG5vdGlmaWVycyB0aGF0IGFyZQp1cGRhdGVkIHdpdGgg
YSBkZWZlcnJlZCBtZWNoYW5pc20gaW4gd29ya2Vycy4gSSBmaW5hbGx5IGZpZ3VyZWQgb3V0IGhv
dwp0byBkbyB0aGF0IGluIGEgY2xlYW4gd2F5LCBob3BlZnVsbHkgd2l0aG91dCByYWNlcyBvciBk
ZWFkbG9ja3MsIHdoaWNoCnNob3VsZCBhbHNvIGFkZHJlc3MgdGhlIG90aGVyIHJhY2UgY29uZGl0
aW9ucyB3ZSBoYWQgd2l0aCBjb25jdXJyZW50Cm1pZ3JhdGlvbiB0cmlnZ2Vycy4gUGhpbGlwIGlz
IHdvcmtpbmcgb24gdGhlIGltcGxlbWVudGF0aW9uLgoKUmVnYXJkcywKwqAgRmVsaXgKCj4KPiBD
aGVlcnMsCj4gSsODwqlyw4PCtG1lCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
