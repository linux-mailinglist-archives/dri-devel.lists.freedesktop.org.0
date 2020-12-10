Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 105E52D58C2
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 12:03:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F466EA77;
	Thu, 10 Dec 2020 11:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0940E6EA77
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 11:03:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LA8TltEtvTYXqEvkkyLgBTBGtTUpG7Mv83BFpbMDBipHTU5NMgb3FfAaHa8hIAyJBAnQ5PgYBLthf8HBYVSkGvKKkOcRwQQJcMBmsi15etDbQu3c4R0oACq+D2SK/LnnZaqhllo2fTX+rbdRRGs0+nMDQ5QEKfNZokZJxeT6IWRXhWKazxgc79QwkLV7GIfkMSyS1r0wp9sbHYQ9euWgbE/ZzkmhpDaxP2aNwr2l6TrAYQZ3FMiBHCPIoLdzhnuPhIMrLsiYp+nhwSYBKo4sekcu81h4rVZ/HaXK3bs+/AP9UMUbYWI09dFMgysVkqaxhNYij/ibnrATuu7P865NGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sO6hyNVQZSLQT5Got1CR7nv/Azw5iZv9aCsyzQ7Gydo=;
 b=iLpbQdve+CLcjSnPNeReQo4zohD4NLSA6j1FUdLzf6BOfjv99fXIIgvZM9F5KiXaHbsTHotwuslxLyvfm/vyIx1qQX+atJZp3k9NKT22f3EEpR/aw8R/X3NcuLEYPsNVHc81Ns7nC22wU9Uv8kPYAObnA2CnN09Kg2eoO7OOt3ECZBloLVgu/cQBmi8rvvtXio+iV9Zx4SzvurVzANfyUdynSa5uSUPXpzb8stuQwu8FKoSKGXsGw1bhCOUGbdqlSJRK7w5PaWGY1KG6D1SApaDXze2NWxPwQH4xm5i0oUZQD+BItc1M1a3Kb8JHnjIRuYXqlEnYkqMKOYF8rkweFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sO6hyNVQZSLQT5Got1CR7nv/Azw5iZv9aCsyzQ7Gydo=;
 b=YAeIbk2Ek00rYir6Y+j8is3sHBuMTam8pv/d4dcP8XH9YW4abe5grFMSPyUQzCnF5+j0omaX1WqpnYNmwgIazg8mvHmiIMljz2LkMmRrzkhUlEVmXGPz/4BoQR1+x0eUnKaDh56gvMH6JmZaASyDmH1ifBN+dOSvYUZ8Wo9TWNg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3935.namprd12.prod.outlook.com (2603:10b6:208:168::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Thu, 10 Dec
 2020 11:03:00 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.016; Thu, 10 Dec 2020
 11:03:00 +0000
Subject: Re: [PATCH] dmabuf: Add the capability to expose DMA-BUF stats in
 sysfs
To: Greg KH <gregkh@linuxfoundation.org>, surenb@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Hridya Valsaraju <hridya@google.com>,
 kernel-team@android.com, linux-media@vger.kernel.org
References: <20201210044400.1080308-1-hridya@google.com>
 <b5adfe46-8615-5821-d092-2b93feed5b79@amd.com> <X9H0JREcdxDsMtLX@kroah.com>
 <20201210102727.GE401619@phenom.ffwll.local> <X9H+3AP1q39aMxeb@kroah.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f95ee5dc-62f8-4870-11e4-3513dc8382ef@amd.com>
Date: Thu, 10 Dec 2020 12:02:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <X9H+3AP1q39aMxeb@kroah.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0P190CA0026.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::36) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0P190CA0026.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 11:02:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8803686b-7bea-42b1-8866-08d89cfb2883
X-MS-TrafficTypeDiagnostic: MN2PR12MB3935:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3935AE7055252664E6BF1D8483CB0@MN2PR12MB3935.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iy6YInYBWHzDhI+cd6kGSwxFcxA9bB5x/GMU7JyzMIlycRNpiw8LrVRSoQxqdr8bwFuEXcgXjIysU29xFfXubZZNEjgFHZPKWq8CCX+ajPJvaAWnWaqoX0i3SES9jR/rk39s+r5vstHMkd33J3OHJduE5/bG9xr43zjtWiRfhA/YhFrq2zU4/EBQySqWkz1tUt/b5sn4MeFvAtmofi1+S3oheu0u6HCvu8PFXnm/EPlTccli4AZxZdYmSQ7b0hgLXINGxpFejeqOYnQ5+QaULUbdKxBJYttP0oQYwQnyuKZlz4mgrYOnSigzhJxGA3wnEKqU5eVTH0MKVyemmDxZHVUBgxp818LpDMle2ma7cwbq2ftzjiuidCED198O4d8yTAKRm/rQXvMLefvW8PGF0IUzcGosrBALDK4nkQy6hVA95S7+OCesfZaB14cZu9XH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(376002)(66476007)(66946007)(508600001)(66556008)(8936002)(36756003)(8676002)(5660300002)(2906002)(34490700003)(31696002)(86362001)(6666004)(83380400001)(66574015)(2616005)(16526019)(31686004)(110136005)(52116002)(6486002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R2tKZmUwUkZVYkZaR2RMWElTYXpWTnNkZDkrT3FBcGJJNmhjenY2dlFHWnI3?=
 =?utf-8?B?My8yb3R0TXErNVkrTHVpSUJLdS94YVhBNXAvS05pZjZIc1lNczM4QUI5NGcy?=
 =?utf-8?B?dVYzOVROblVOTStFWk90N2ZBMXAzb2xyK0dJZ0RlK3MxaGY3cGdoZ09NR25r?=
 =?utf-8?B?Q2N4UHEveHM4dWdTRXdielZvY1F1QW8yRFJndSs0RnlqR3VYWml1cm5ta3Rj?=
 =?utf-8?B?ZFQwS3JkdHdmNkVrVHg0emlITUp3QStWRDNxcVRtb0RvdzduYldadFRQcm14?=
 =?utf-8?B?d3ZrNXB3NkNUNEYrREx3MEQ2a09pMmFUZXRic25UNnBORUxxQ3psL3pOWExn?=
 =?utf-8?B?a3JXdVkxNmpoN05RKzQzSzRnVkRuRmdEbjF3S0d0ZnlZakxQTC9JbDh4MVJo?=
 =?utf-8?B?TFVHd3dkRDVWLzRXRm5QOVBqZjlEeGlsTVRUNXJtL054S0cxVkV6WWhrSm9l?=
 =?utf-8?B?OGZJWnJFNXNybWtHZ2h6MW1vNk9tb2JiM2NPWmZ3QUROQlM3S2RrUmxveW5n?=
 =?utf-8?B?d0dsSU5xTy9lVzZCcHFHV2NGVG8xMGxZblBPaldyV0ttL2lucHFvUDB6eity?=
 =?utf-8?B?K3BPU2s3aXlRMlVpUkV5VlcwQVl2L1JpTG5ORGE1S3dJSERORXA1OXdiUWpV?=
 =?utf-8?B?RTRtQ2c0S2F4bFY2bmk0WTM0TXd4c01iNXR5Qnh0cDF5dHEra2h4ZFBPam80?=
 =?utf-8?B?OFBMcVFBOGRWSHBEcy9qL2hrY2gvQ3JCc3E2REN3NWQ0T0ZiMWg5SHdMeXVr?=
 =?utf-8?B?Y0dDeE5IRHhkK3pMK0R5Mi96eVNEUzBaWGNPTmRqcUZoelNYZ1BQcXFOaTRN?=
 =?utf-8?B?OTZ5cTFFeWxQWklGdmg1cUtBcW9hVDlXbFYwY1RSakpFK2szcHBxRUVmTExR?=
 =?utf-8?B?U3VXaTh0dVpRMjRUbzJxM3RUTm1QNTBZYWhGbHlqcUJCNE8vcEJqT3ErVjVM?=
 =?utf-8?B?TW1CSkZwSEZLZlhSeE9kOEVPbnR3VHBIL0RSMVhrMC9iR28wb2NUQ0ltMWd4?=
 =?utf-8?B?ZDFwelY0SmtkYW1Yc2ZwanRCNXA1THFuZW5VQklBdGR4dVhPdldRZjRLZUdh?=
 =?utf-8?B?alJrRGptSWhQc0d2UlpwNFhJK0RsanRsSkxaa1ZqandDVWhNRnNwRFJpaFZG?=
 =?utf-8?B?eUVReEVjZmdLSXBhZmFaRVFNd2NQTUhQRVc4d2lYUlhMQ1hRZWRKRnZoZWpT?=
 =?utf-8?B?MXFYQlB1QUVoOHFxbEZ4R1I4bmdkQm5NSmhCclQwQVJHQit4NzV5TnZmTW5P?=
 =?utf-8?B?SFppcVQwdURsTkpBbWZERHQ2TVR2OTc4Q3h4a3Bxc20rbVhrZDduOUhoQzF5?=
 =?utf-8?B?R3hzbU0zK0l6dnpXT3l2S3BMZUwzUnNjQ3FXYVhBbStLQU5zTTNub3ArYlRJ?=
 =?utf-8?B?aHQ1bVIzai94UVJka01QL0dVSSs2WnFDNlFraFBjOGdoWE1qempZN3ZzelVN?=
 =?utf-8?Q?Q7bI3JyY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 11:03:00.2528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 8803686b-7bea-42b1-8866-08d89cfb2883
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Ht0QXVpna3dVWkd28a1neZ/QLN0iZSRnl8/1m2X3Bffl6j0y8A3PBgDh3bXraX5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3935
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTAuMTIuMjAgdW0gMTE6NTYgc2NocmllYiBHcmVnIEtIOgo+IE9uIFRodSwgRGVjIDEwLCAy
MDIwIGF0IDExOjI3OjI3QU0gKzAxMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+IE9uIFRodSwg
RGVjIDEwLCAyMDIwIGF0IDExOjEwOjQ1QU0gKzAxMDAsIEdyZWcgS0ggd3JvdGU6Cj4+PiBPbiBU
aHUsIERlYyAxMCwgMjAyMCBhdCAxMDo1ODo1MEFNICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdy
b3RlOgo+Pj4+IEluIGdlbmVyYWwgYSBnb29kIGlkZWEsIGJ1dCBJIGhhdmUgYSBmZXcgY29uY2Vy
bi9jb21tZW50cyBoZXJlLgo+Pj4+Cj4+Pj4gQW0gMTAuMTIuMjAgdW0gMDU6NDMgc2NocmllYiBI
cmlkeWEgVmFsc2FyYWp1Ogo+Pj4+PiBUaGlzIHBhdGNoIGFsbG93cyBzdGF0aXN0aWNzIHRvIGJl
IGVuYWJsZWQgZm9yIGVhY2ggRE1BLUJVRiBpbgo+Pj4+PiBzeXNmcyBieSBlbmFibGluZyB0aGUg
Y29uZmlnIENPTkZJR19ETUFCVUZfU1lTRlNfU1RBVFMuCj4+Pj4+Cj4+Pj4+IFRoZSBmb2xsb3dp
bmcgc3RhdHMgd2lsbCBiZSBleHBvc2VkIGJ5IHRoZSBpbnRlcmZhY2U6Cj4+Pj4+Cj4+Pj4+IC9z
eXMva2VybmVsL2RtYWJ1Zi88aW5vZGVfbnVtYmVyPi9leHBvcnRlcl9uYW1lCj4+Pj4+IC9zeXMv
a2VybmVsL2RtYWJ1Zi88aW5vZGVfbnVtYmVyPi9zaXplCj4+Pj4+IC9zeXMva2VybmVsL2RtYWJ1
Zi88aW5vZGVfbnVtYmVyPi9kZXZfbWFwX2luZm8KPj4+Pj4KPj4+Pj4gVGhlIGlub2RlX251bWJl
ciBpcyB1bmlxdWUgZm9yIGVhY2ggRE1BLUJVRiBhbmQgd2FzIGFkZGVkIGVhcmxpZXIgWzFdCj4+
Pj4+IGluIG9yZGVyIHRvIGFsbG93IHVzZXJzcGFjZSB0byB0cmFjayBETUEtQlVGIHVzYWdlIGFj
cm9zcyBkaWZmZXJlbnQKPj4+Pj4gcHJvY2Vzc2VzLgo+Pj4+Pgo+Pj4+PiBDdXJyZW50bHksIHRo
aXMgaW5mb3JtYXRpb24gaXMgZXhwb3NlZCBpbgo+Pj4+PiAvc3lzL2tlcm5lbC9kZWJ1Zy9kbWFf
YnVmL2J1ZmluZm8uCj4+Pj4+IEhvd2V2ZXIsIHNpbmNlIGRlYnVnZnMgaXMgY29uc2lkZXJlZCB1
bnNhZmUgdG8gYmUgbW91bnRlZCBpbiBwcm9kdWN0aW9uLAo+Pj4+PiBpdCBpcyBiZWluZyBkdXBs
aWNhdGVkIGluIHN5c2ZzLgo+Pj4+IE1obSwgdGhpcyBtYWtlcyBpdCBwYXJ0IG9mIHRoZSBVQVBJ
LiBXaGF0IGlzIHRoZSBqdXN0aWZpY2F0aW9uIGZvciB0aGlzPwo+Pj4+Cj4+Pj4gSW4gb3RoZXIg
d29yZHMgZG8gd2UgcmVhbGx5IG5lZWQgdGhvc2UgZGVidWcgaW5mb3JtYXRpb24gaW4gYSBwcm9k
dWN0aW9uCj4+Pj4gZW52aXJvbm1lbnQ/Cj4+PiBQcm9kdWN0aW9uIGVudmlyb25tZW50cyBzZWVt
IHRvIHdhbnQgdG8ga25vdyB3aG8gaXMgdXNpbmcgdXAgbWVtb3J5IDopCj4+IFRoaXMgb25seSBz
aG93cyBzaGFyZWQgbWVtb3J5LCBzbyBpdCBkb2VzIHNtZWxsIGEgbG90IGxpa2UgJHNwZWNpZmlj
X2lzc3VlCj4+IGFuZCB3ZSdyZSBkZXNpZ25pbmcgYSBuYXJyb3cgc29sdXRpb24gZm9yIHRoYXQg
YW5kIHRoZW4gaGF2ZSB0byBjYXJyeSBpdAo+PiBmb3JldmVyLgo+IEkgdGhpbmsgdGhlICJpc3N1
ZSIgaXMgdGhhdCB0aGlzIHdhcyBhIGZlYXR1cmUgZnJvbSBpb24gdGhhdCBwZW9wbGUKPiAibWlz
c2VkIiBpbiB0aGUgZG1hYnVmIG1vdmUuICBUYWtpbmcgYXdheSB0aGUgYWJpbGl0eSB0byBzZWUg
d2hhdCBraW5kCj4gb2YgYWxsb2NhdGlvbnMgd2VyZSBiZWluZyBtYWRlIGRpZG4ndCBtYWtlIGEg
bG90IG9mIGRlYnVnZ2luZyB0b29scwo+IGhhcHB5IDooCgpZZWFoLCB0aGF0IGlzIGNlcnRhaW5s
eSBhIHZlcnkgdmFsaWQgY29uY2Vybi4KCj4gQnV0IEhyaWR5YSBrbm93cyBtb3JlLCBzaGUncyBi
ZWVuIGRlYWxpbmcgd2l0aCB0aGUgdHJhbnNpdGlvbiBmb3IgYSBsb25nCj4gdGltZSBub3cuCj4K
Pj4gRS5nLiB3aHkgaXMgdGhlIGxpc3Qgb2YgYXR0YWNobWVudHMgbm90IGEgc3lzZnMgbGluaz8g
VGhhdCdzIGhvdyB3ZQo+PiB1c3VhbGx5IGV4cG9zZSBzdHJ1Y3QgZGV2aWNlICogcG9pbnRlcnMg
aW4gc3lzZnMgdG8gdXNlcnNwYWNlLCBub3QgYXMgYQo+PiBsaXN0IG9mIHRoaW5ncy4KPiBUaGVz
ZSBhcmVuJ3Qgc3RydWN0IGRldmljZXMsIHNvIEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgb2JqZWN0
aW9uIGhlcmUuCj4gV2hlcmUgZWxzZSBjb3VsZCB0aGVzZSBnbyBpbiBzeXNmcz8KClN1cmUgdGhl
eSBhcmUhIEp1c3QgdGFrZSBhIGxvb2sgYXQgYW4gYXR0YWNobWVudDoKCnN0cnVjdCBkbWFfYnVm
X2F0dGFjaG1lbnQgewogwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmOwog
wqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZGV2aWNlICpkZXY7CgpUaGlzIGlzIHRoZSBzdHJ1Y3Qg
ZGV2aWNlIHdoaWNoIGlzIGltcG9ydGluZyB0aGUgYnVmZmVyIGFuZCB0aGUgcGF0Y2ggaW4gCmRp
c2N1c3Npb24gaXMganVzdCBwcmludGluZyB0aGUgbmFtZSBvZiB0aGlzIGRldmljZSBpbnRvIHN5
c2ZzLgoKPj4gRnVydGhlcm1vcmUgd2UgZG9uJ3QgaGF2ZSB0aGUgZXhwb3J0ZXIgZGV2aWNlIGNv
dmVyZWQgYW55d2hlcmUsIGhvdyBpcwo+PiB0aGF0IHRyYWNrZWQ/IFllcyBBbmRyb2lkIGp1c3Qg
dXNlcyBpb24gZm9yIGFsbCBzaGFyZWQgYnVmZmVycywgYnV0IHRoYXQncwo+PiBub3QgaG93IGFs
bCBvZiBsaW51eCB1c2Vyc3BhY2Ugd29ya3MuCj4gRG8gd2UgaGF2ZSB0aGUgZXhwb3J0ZXIgZGV2
aWNlIGxpbmsgaW4gdGhlIGRtYWJ1ZiBpbnRlcmZhY2U/ICBJZiBzbywKPiBncmVhdCwgbGV0J3Mg
dXNlIHRoYXQsIGJ1dCBmb3Igc29tZSByZWFzb24gSSBkaWRuJ3QgdGhpbmsgaXQgd2FzIHRoZXJl
LgoKQ29ycmVjdCwgc2luY2Ugd2UgZG9uJ3QgcmVhbGx5IG5lZWQgYSBkZXZpY2UgYXMgYW4gZXhw
b3J0ZXIgKGl0IGNhbiBqdXN0IApiZSBhIHN5c3RlbSBoZWFwIGFzIHdlbGwpIHdlIG9ubHkgaGF2
ZSBhIGNvbnN0IGNoYXIqIGFzIG5hbWUgZm9yIHRoZSAKZXhwb3J0ZXIuCgo+PiBUaGVuIEkgZ3Vl
c3MgdGhlcmUncyB0aGUgbW1hcHMsIHlvdSBjYW4gZmlzaCB0aGVtIG91dCBvZiBwcm9jZnMuIEEg
dG9vbAo+PiB3aGljaCBjb2xsZWN0cyBhbGwgdGhhdCBpbmZvcm1hdGlvbiBtaWdodCBiZSB1c2Vm
dWwsIGp1c3QgYXMgZGVtb25zdHJhdGlvbgo+PiBvZiBob3cgdGhpcyBpcyBhbGwgc3VwcG9zZWQg
dG8gYmUgdXNlZC4KPiBUaGVyZSdzIGEgc2NyaXB0IHNvbWV3aGVyZSB0aGF0IGRvZXMgdGhpcyB0
b2RheSwgYWdhaW4sIEhyaWR5YSBrbm93cwo+IG1vcmUuCj4KPj4gVGhlcmUncyBhbHNvIHNvbWUg
dGhpbmdzIHRvIG1ha2Ugc3VyZSB3ZSdyZSBhdCBsZWFzdCBoYXZpbmcgdGhvdWdodCBhYm91dAo+
PiBob3cgb3RoZXIgdGhpbmdzIGZpdCBpbiBoZXJlLiBFLmQuIGRtYV9yZXN2IGF0dGFjaGVkIHRv
IHRoZSBkbWEtYnVmCj4+IG1hdHRlcnMgaW4gZ2VuZXJhbCBhIGxvdC4gSXQgZG9lc24ndCBtYXR0
ZXIgb24gQW5kcm9pZCBiZWNhdXNlCj4+IGV2ZXJ5dGhpbmcncyBwaW5uZWQgYWxsIHRoZSB0aW1l
IGFueXdheS4KPj4KPj4gQWxzbyBJIHRob3VnaHQgc3lzZnMgd2FzIG9uZSB2YWx1ZSBvbmUgZmls
ZSwgZHVtcGluZyBhbiBlbnRpcmUgbGlzdCBpbnRvCj4+IGRldl9pbmZvX21hcCB3aXRoIHByb3Bl
cnRpZXMgd2UnbGwgbmVlZCB0byBleHRlbmQgKG9uY2UgeW91IGNhcmUgYWJvdXQKPj4gZG1hX3Jl
c3YgeW91IGFsc28gd2FudCB0byBrbm93IHdoaWNoIGF0dGFjaG1lbnRzIGFyZSBkeW5hbWljKSBk
b2VzIG5vdAo+PiBzbWVsbCBsaWtlIHN5c2ZzIGRlc2lnbiBhdCBhbGwuCj4gc3lzZnMgaXMgb25l
IHZhbHVlIHBlciBmaWxlLCB3aGF0IGlzIGJlaW5nIGV4cG9ydGVkIHRoYXQgaXMgbGFyZ2VyIHRo
YW4KPiB0aGF0IGhlcmU/ICBEaWQgSSBtaXNzIHNvbWV0aGluZyBvbiByZXZpZXc/CgpTZWUgdGhp
cyBjaHVuayBoZXJlOgoKKworwqDCoMKgIGxpc3RfZm9yX2VhY2hfZW50cnkoYXR0YWNobWVudCwg
JmRtYWJ1Zi0+YXR0YWNobWVudHMsIG5vZGUpIHsKK8KgwqDCoCDCoMKgwqAgaWYgKGF0dGFjaG1l
bnQtPm1hcF9jb3VudGVyKSB7CivCoMKgwqAgwqDCoMKgIMKgwqDCoCByZXQgKz0gc3lzZnNfZW1p
dF9hdChidWYsIHJldCwgIiVzICIsCivCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKg
IMKgwqDCoMKgIGRldl9uYW1lKGF0dGFjaG1lbnQtPmRldikpOworwqDCoMKgIMKgwqDCoCB9CivC
oMKgwqAgfQoKQW5kIHllcyBub3cgdGhhdCBEYW5pZWwgbWVudGlvbmVkIHRoYXQgaXQgbG9va3Mg
bGlrZSBhIHN5c2ZzIHJ1bGVzIAp2aW9sYXRpb24gdG8gbWUgYXMgd2VsbC4KClJlZ2FyZHMsCkNo
cmlzdGlhbi4KCgo+Cj4gdGhhbmtzLAo+Cj4gZ3JlZyBrLWgKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
