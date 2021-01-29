Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BBB3088FC
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 13:18:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7137F6EB11;
	Fri, 29 Jan 2021 12:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097EF6EB11
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 12:18:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAOwhoCGN6+yVkWlW/Z4HXloDnmOTcn+QS5NfBa3PACzDkgiZEC1brbem6rM3AaQR/qtWI2WhMbem3uKnL2wGjELbXcPL60Rluw2oNVo2xcsHVUa2epIIdihsX76oRVEMMbPoYJNLvRTEO1b08oAcqY9z9ob6dKAoFi+mFNuq6ALm6ahSV8EhgETLqkuTj73RjQt9pSPtpteHNc8dW1hqrikkY8qt7MNxYUwyZexoNjF1E9wNEWRSnAiYgaTo9h9KBeEyKIdDoXS725G/1W4kJN3B3gQLHEoGj8JcTfJUcGoaH8Ob1uhf3iuMjiPhqiO6sCoK0A3hmI4eOGlQ6G2PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USZmI+G9xY9VBMqNWoE/Wo+/vfLngUe+ebHM/Pmii74=;
 b=fWwVgr2LOyLxGxXcDCb51HWCWZvNbqPKSPMhGcEMvR1A7yTVQA8qm6t1Jb6RX5LHuNq4Sj3CRf9MRgTS4hbT6Q1kr0pWn5WQ8U62n0tsIn47tcwPBllg80F2MNiJuLRjNlHfjp1pS+mCy1h+exFQv4nVbuGZkd6t3ayrKeH+oGYNDGqGH+uOEDm4/+N2pULkXBmbBDhUtQ+jjzJl7eOru4OMo/gEjsSrA6vS3Oc/XMZ/rsTlnYhFERkfb3YBYHniBjompgbhCU5Tm3mUdPP6+wypIPH8H+HIVltcST8JgaX1FKojIw/pNZjkUZQaT3F39/w7GVDvBCWPeHJqDqlJmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USZmI+G9xY9VBMqNWoE/Wo+/vfLngUe+ebHM/Pmii74=;
 b=VsOKDP5SnZ1tE58aDn1W8aMng6fsZm1yVHRGLxWkosyvyr0vJvmgy0bK+AtgApEwDf0FiyUpf5/s+U2vGOaXCIWYvWUG2/sOETQ4DIQfiyZZlvJ6nZnvu1SGKnwB2VNa4I/Q5aLMy0sAV5XzwBXxHQnVzIlP2/GVs7/tsiQ1XXg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3727.namprd12.prod.outlook.com (2603:10b6:208:15a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 29 Jan
 2021 12:18:11 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 12:18:11 +0000
Subject: Re: [PATCH] procfs/dmabuf: Add /proc/<pid>/task/<tid>/dmabuf_fds
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20210126225138.1823266-1-kaleshsingh@google.com>
 <CAG48ez2tc_GSPYdgGqTRotUp6NqFoUKdoN_p978+BOLoD_Fdjw@mail.gmail.com>
 <YBFG/zBxgnapqLAK@dhcp22.suse.cz>
 <ea04b552-7345-b7d5-60fe-7a22515ea63a@amd.com>
 <20210128120130.50aa9a74@eldfell>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c95af15d-8ff4-aea0-fa1b-3157845deae1@amd.com>
Date: Fri, 29 Jan 2021 13:18:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210128120130.50aa9a74@eldfell>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM9P193CA0012.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM9P193CA0012.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Fri, 29 Jan 2021 12:18:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5850fffd-b810-4ef3-cd6d-08d8c44ff1e8
X-MS-TrafficTypeDiagnostic: MN2PR12MB3727:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3727ECE8B36F1F932680C76683B99@MN2PR12MB3727.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7ysnbGhkF2cmhz1q4nc9cwrtsawWC5o/47IWrH0g1rI9wVUeXvvcArsb5CdmeILcMN8M725T5NA3e2GPDzrlTC77zB2NJPWNadiP6S4nTjIY9dER72L75wf33G3AYtdOfxtmI6+5Rhi5OaHyVM993d7nGSkWU6HLRMsPRFpWAi4AYEMB8jEdhfDIW5wzqHD3PhO0beaXecczr0lRfW0h/hUvE2pWEjsW6UGljAvww3BOsixFue1C1HXpERoCuCy0opiSh19IyXy7MIv+Ya+9TaTm17BrAugo5xISMcV2vQBtEEKpqolOvEMFJwh6YkOteL83kUoRlOa2lIHRn9VvRTVmknRiBpFj3Z9U06I8UMInl9yZby7zidnY4KZ8Oo8uIrKGL1uwZ+wEoBdVf21MB8qLrCDWejatPgPaQspWtLTLvzCb/Y7NO0rF2iyGGPVWDIcEHT+lkdGL9la7nu13wej/QFAiDAGtowwrL80XP0WnhhwQ3LHRZOzjkNTbHcCyK0YJLaeMPZ3zeiyF4tGmZ82pYJAO539pNmszFWOdhhD4A6P4HXV/FDFTvTIifr222Px3+n2CrhIz6WxaCUkJ0/FOt4N8F6Oi1Sbe6vjMru19FXryQvPeleofPVRksSyVrJ9sMeI7pIpBmztCV5QhbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(2906002)(52116002)(8936002)(31686004)(7406005)(7416002)(316002)(4326008)(6666004)(478600001)(5660300002)(186003)(8676002)(54906003)(6486002)(66946007)(6916009)(66556008)(66476007)(16526019)(36756003)(83380400001)(86362001)(31696002)(2616005)(66574015)(34580700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b3lEK0NWb1VabjVZUDh2ZmRuOElsTHIrZm5rZ0RBcFdWZUxOOExQRlErSm5Z?=
 =?utf-8?B?WUw5L1RQZFExWUhxZ3VaUzlSRUxrZGNWcGU1K2RtWTV2b3RiWFg0ZWxHRFY1?=
 =?utf-8?B?aDdEV1prbEtOdHFkK0dCU1JrVW5ReThneE1yR3hLSzlFU0ZXQmMwYm54QWxX?=
 =?utf-8?B?aDlUbEhUNVVqNTlwM1NsbEo4Ukc5cEVLMHJrM2dhdDI5bXRmSEQ5UE9LRHQz?=
 =?utf-8?B?WlhML01TYmdNY2NrKzBBcVFrNzJjWVRNZFpHWDVsUjFydzUzM0I3c3llL0JP?=
 =?utf-8?B?MFdYWFYvY2FqcXpzY2N2U1h2MllLSXJZY2pvMWZ0bXlTZnlDRnhUZW4rcTls?=
 =?utf-8?B?K0JnRmxubDVmQ2VjYys1ekpWTkVRRmt1UU5iT201dEl3ajUwWldNMittMGxB?=
 =?utf-8?B?NVh6WStNclczTWtOTHJVemZETHk4cjRBWk8zU1dMZDlKc0prMWFlenVxNTk2?=
 =?utf-8?B?a003dTQ4Tm9tKzRWdEo5bkVhUW8xdWg5NUZ6Y2MvKzRuUXc2aXRtYmxDZWJm?=
 =?utf-8?B?d2V6cjUyU3pLcXpINTc2djRPcVZTQ2dtK0hDZmx4cld6eitKL3NYVXovenVV?=
 =?utf-8?B?S3FQbXhGWWtNQlpjYUJvUlpvMnY2Y05hdzd4NGtoVkdGQ3pSYkk0UGJTZXNP?=
 =?utf-8?B?cDNnQ2xLUkM3VDRJSkFpRHZ1N25xbzNITm15U1Y2VW85WGhucSsvclg1bFdt?=
 =?utf-8?B?NE1oRDhYWEZDODhEeEo3dFBHaTBNY1pKQ3A4ZmFmWXdvVkMwTGJDblFSTnJY?=
 =?utf-8?B?SUtYUVpRM01JcUF0RlJKdFdZR3A2OHhkd011cFN6WWtMZFgrbTFNajUydTVG?=
 =?utf-8?B?Q3lnUzRDMlhyL1JjZmVXTXl6WXN3MDhpcUtTTDNsZXdscnN2NkdYUW9iUS9q?=
 =?utf-8?B?dThYbUhzc2VNNmhSdWs0Q0xlaFJtMElFRmkvVXByWDFPd3FISDdiclljVU9l?=
 =?utf-8?B?aC8vcjRqOFUrZm85S3BCQVZBVUpUWlV4cHlTTk1ZTHVnUDZTRkkvbUVXQ0Jq?=
 =?utf-8?B?QzVhVXF6dmM0ZzRUZjNhMHplQXJmMmVkb29QeDlselMyb0NiWlVPaHJDT253?=
 =?utf-8?B?SGFGYWpwczNPSldYRnVyOEh5eUgzLzlJay94MVJKWVJIS1FDUUo1dGRBdGtN?=
 =?utf-8?B?N1RiZnQ3NzI2amtwQ0NUOTVXdGs5ZHVaLy96anVxZUltcEJEQ0Vtc0NBdXc5?=
 =?utf-8?B?WWpPYml0K1J3ZXNFcStwSFJBUDhYMjZRalAxVWRubThzZDgvNjdnUG4vTmJj?=
 =?utf-8?B?dklEbkVuT0ZpU0c4SUQxcUtOZlZjaDJFcm16NFF4czZldjEzTk1yR2k3dWFH?=
 =?utf-8?B?Q1ZLdkY4ZTFSMUNoUldTU1BjSkZLMmpSY1JXUE92a1hHcnRadGxyVDNTWkQ1?=
 =?utf-8?B?cXZ2VVhRVG1jbzU4NHNhL3V1dmpyRlZtYkt6UFVHd3JFNkREU005UGxab1dQ?=
 =?utf-8?B?aDIzUFNFeUFneDhpTU5yWFNrQVhpTy9BVWhHVzdVYVkweEphMndBdXF5bGNO?=
 =?utf-8?B?TzVSdWswMnJiVi9UZGZjQ2lXaVpFeWdKenp6WWUwNlEreFRaY04rRzNaU21H?=
 =?utf-8?B?WlVYZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5850fffd-b810-4ef3-cd6d-08d8c44ff1e8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 12:18:11.6629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ds5wCfy0624SX4ZF5RjmvrZrAGRhVsMxzuIFmmfmS8qDu3r9Ufvoz9dbFHWFOKGh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3727
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
Cc: Michal Hocko <mhocko@suse.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Szabolcs Nagy <szabolcs.nagy@arm.com>, dri-devel@lists.freedesktop.org,
 Andrei Vagin <avagin@gmail.com>, Kalesh Singh <kaleshsingh@google.com>,
 Hui Su <sh_def@163.com>, Michel Lespinasse <walken@google.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jeffrey Vander Stoep <jeffv@google.com>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 kernel-team <kernel-team@android.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>,
 linaro-mm-sig@lists.linaro.org, Hridya Valsaraju <hridya@google.com>,
 Bernd Edlinger <bernd.edlinger@hotmail.de>,
 Suren Baghdasaryan <surenb@google.com>,
 Alexey Gladkov <gladkov.alexey@gmail.com>,
 kernel list <linux-kernel@vger.kernel.org>, Minchan Kim <minchan@kernel.org>,
 Yafang Shao <laoar.shao@gmail.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux API <linux-api@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjguMDEuMjEgdW0gMTE6MDEgc2NocmllYiBQZWtrYSBQYWFsYW5lbjoKPiBPbiBXZWQsIDI3
IEphbiAyMDIxIDEyOjAxOjU1ICswMTAwCj4gQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+PiBTb21ld2hhdCBjb3JyZWN0LiBUaGlzIGludGVyZmFj
ZSBoZXJlIHJlYWxseSBkb2Vzbid0IG1ha2Ugc2Vuc2Ugc2luY2UKPj4gdGhlIGZpbGUgZGVzY3Jp
cHRvciByZXByZXNlbnRhdGlvbiBvZiBETUEtYnVmIGlzIG9ubHkgbWVhbnQgdG8gYmUgdXNlZAo+
PiBmb3Igc2hvcnQgdGVybSB1c2FnZS4KPj4KPj4gRS5nLiB0aGUgaWRlYSBpcyB0aGF0IHlvdSBj
YW4gZXhwb3J0IGEgRE1BLWJ1ZiBmZCBmcm9tIHlvdXIgZGV2aWNlCj4+IGRyaXZlciwgdHJhbnNm
ZXIgdGhhdCB0byBhbm90aGVyIHByb2Nlc3MgYW5kIHRoZW4gaW1wb3J0IGl0IGFnYWluIGludG8g
YQo+PiBkZXZpY2UgZHJpdmVyLgo+Pgo+PiBLZWVwaW5nIGEgbG9uZyB0ZXJtIHJlZmVyZW5jZSB0
byBhIERNQS1idWYgZmQgc291bmRzIGxpa2UgYSBkZXNpZ24gYnVnCj4+IGluIHVzZXJzcGFjZSB0
byBtZS4KPiBFeGNlcHQga2VlcGluZyB0aGUgZmQgaXMgZXhhY3RseSB3aGF0IHVzZXJzcGFjZSBt
dXN0IGRvIGlmIGl0IHdpc2hlcyB0bwo+IHJlLXVzZSB0aGUgYnVmZmVyIHdpdGhvdXQgcGFzc2lu
ZyBhIG5ldyBmZCBvdmVyIElQQyBhZ2Fpbi4gUGFydGljdWxhcmx5Cj4gV2F5bGFuZCBjb21wb3Np
dG9ycyBuZWVkIHRvIGtlZXAgdGhlIGNsaWVudCBidWZmZXIgZG1hYnVmIGZkIG9wZW4gYWZ0ZXIK
PiByZWNlaXZpbmcgaXQsIHNvIHRoYXQgdGhleSBjYW4gcmUtaW1wb3J0IGl0IHRvIEVHTCB0byBl
bnN1cmUgdXBkYXRlZAo+IGNvbnRlbnRzIGFyZSBjb3JyZWN0bHkgZmx1c2hlZCBhcyBFR0wgaGFz
IG5vIG90aGVyIEFQSSBmb3IgaXQuCgpIdWkgd2hhdD8/PyBJJ20gbm90IHRoYXQgZGVlcCBpbnRv
IHRoZSBFR0wgc3BlY2lmaWNhdGlvbiwgYnV0IGZyb20gdGhlIAprZXJuZWwgc2lkZSB0aGF0IGlz
IHV0dGVybHkgbm9uc2Vuc2UuCgpDb3VsZCBiZSB0aGF0IHJlLWltcG9ydGluZyB0cmlnZ2VycyBz
b21ldGhpbmcgaW4gdXNlcnNwYWNlLCBidXQgdGhpcyAKc291bmRzIHN0cm9uZ2x5IGxpa2UgYSB3
b3JrYXJvdW5kIHRvIG1lIHdoaWNoIHNob3VsZG4ndCBiZSBuZWNlc3NhcnkuCgo+IFRoYXQgaXMg
bXkgdmFndWUgdW5kZXJzdGFuZGluZywgYW5kIHdoYXQgV2VzdG9uIGltcGxlbWVudHMuIFlvdSBj
YW4gc2F5Cj4gaXQncyBhIGJhZCB1c2Vyc3BhY2UgQVBJIGRlc2lnbiBpbiBFR0wsIGJ1dCB3aGF0
IGVsc2UgY2FuIHdlIGRvPwoKUGxlYXNlIG9wZW4gdXAgYSBidWcgcmVwb3J0IHdpdGggeW91ciBF
R0wgZHJpdmVyIGlmIHRoYXQgaXMgcmVhbGx5IApuZWNlc3NhcnkuCgpETUEtYnVmcyBzaGFyZWQg
dXNpbmcgYSBmaWxlIGRlc2NyaXB0b3Igc2hvdWxkIGJlIGNvaGVyZW50IHdoZW4gCndyaXR0ZW4v
cmVhZCBmcm9tIGEgR1BVIG9yIG90aGVyIGhhcmR3YXJlIGRldmljZS4gV2hhdCBpcyBwb3NzaWJs
ZSBpcyAKdGhhdCB5b3UgbmVlZCB0byBkbyBzb21ldGhpbmcgc3BlY2lhbCBmb3IgQ1BVIGFjY2Vz
cy4KCkluIG90aGVyIHdvcmRzIG9uY2UgYSBETUEtYnVmIGlzIGltcG9ydGVkIGFuZCBhdmFpbGFi
bGUgYXMgCmhhbmRsZS90ZXh0dXJlL2ltYWdlIGluc2lkZSBFR0wgaXQgZG9lc24ndCBuZWVkcyB0
byBiZSBmbHVzaGVkL3N5bmNlZCAKZXhwbGljaXRseSBhZ2Fpbi4KClJlLWltcG9ydGluZyBpdCBh
ZGRzIHF1aXRlIGEgaHVnZSBDUFUgb3ZlcmhlYWQgdG8gYm90aCB1c2Vyc3BhY2UgYXMgd2VsbCAK
YXMgdGhlIGtlcm5lbC4KCj4gSG93ZXZlciwgaW4gdGhlIHBhcnRpY3VsYXIgY2FzZSBvZiBXYXls
YW5kLCB0aGUgc2hhcmVkIGRtYWJ1ZnMgc2hvdWxkCj4gYmUgYWNjb3VudGVkIHRvIHRoZSBXYXls
YW5kIGNsaWVudCBwcm9jZXNzLiBPT00ta2lsbGluZyB0aGUgY2xpZW50Cj4gcHJvY2VzcyB3aWxs
IGV2ZW50dWFsbHkgZnJlZSB0aGUgZG1hYnVmLCBhbHNvIHRoZSBXYXlsYW5kIHNlcnZlcgo+IHJl
ZmVyZW5jZXMgdG8gaXQuIEtpbGxpbmcgdGhlIFdheWxhbmQgc2VydmVyIChjb21wb3NpdG9yLCBk
aXNwbGF5Cj4gc2VydmVyKSBPVE9IIGlzIHNvbWV0aGluZyB0aGF0IHNob3VsZCBub3QgYmUgZG9u
ZSBhcyBsb25nIGFzIHRoZXJlIGFyZQo+IGUuZy4gV2F5bGFuZCBjbGllbnRzIHRvIGJlIGtpbGxl
ZC4KPgo+IFVuZm9ydHVuYXRlbHkoPyksIFdheWxhbmQgY2xpZW50cyBkbyBub3QgaGF2ZSBhIHJl
YXNvbiB0byBrZWVwIHRoZQo+IGRtYWJ1ZiBmZCBvcGVuIHRoZW1zZWx2ZXMsIHNvIHRoZXkgcHJv
YmFibHkgY2xvc2UgaXQgYXMgc29vbiBhcyBpdCBoYXMKPiBiZWVuIHNlbnQgdG8gYSBkaXNwbGF5
IHNlcnZlci4gU28gdGhlIHByb2Nlc3MgdGhhdCBzaG91bGQgYmUgT09NLWtpbGxlZAo+IGRvZXMg
bm90IGhhdmUgYW4gb3BlbiBmZCBmb3IgdGhlIGRtYWJ1ZiAoYnV0IHByb2JhYmx5IGhhcyBzb21l
dGhpbmcKPiBlbHNlLCBidXQgbm90IGFuIG1tYXAgZm9yIENQVSkuIEJ1ZmZlciByZS11c2UgaW4g
V2F5bGFuZCBkb2VzIG5vdAo+IHJlcXVpcmUgcmUtc2VuZGluZyB0aGUgZG1hYnVmIGZkIG92ZXIg
SVBDLgoKQ29ycmVjdC4gVGhlIHJlZmVyZW5jZSB0byB5b3VyIG1lbW9yeSBpcyBrZXB0IGluc2lk
ZSB0aGUgZHJpdmVycyBHRU0gaGFuZGxlLgoKVGhhdCdzIG9uZSByZWFzb24gd2h5IHdlIHNhaWQg
dGhhdCB0aGlzIGFwcHJvYWNoIGhlcmUgaXMgbm90IHRha2luZyBpbiAKdGhlIHdob2xlIHBpY3R1
cmUuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4gKEluIGdlbmVyYWwsIGRtYWJ1ZnMgYXJlIG5l
dmVyIG1tYXBwZWQgZm9yIENQVS4gVGhleSBhcmUgYWNjZXNzZWQgYnkKPiBkZXZpY2VzLikKPgo+
Cj4gVGhhbmtzLAo+IHBxCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
