Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E35D2CC477
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 19:02:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA1F6EA60;
	Wed,  2 Dec 2020 18:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6F26EA5E;
 Wed,  2 Dec 2020 18:02:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcMixmksNR7cnP8vsV0fwe56Jto7KrUpY8NVuiCWYbKkztvDK47wTTLPGzBNUPlPqsgfctyYrsWvnpXXkgbdKJOMgp2clrX6EZeFvhEY7gzn3xH65mUBKLC+zr8Z70C2oo3+BDtBv0eSzqkg17T/EXYUL9JPIXzxbc0ZfZbe2e4soclHQb6Uww4lAy0eCnERttfMJ86eLwywguc1Blq2n+QlvboEervqxR31w5DRmoEDhJdkghDp2FC548aYDArTuyniE1k/nIF38gdUEwzYQzf5wiRTPOj4V1X0nu47EbYYIyUSN6ixoT5AZi5OMLgvwDpc+26vunhq2cJm/kqgxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnutB2bl7ht4P4lqz7e6amb2rM2LKOcjyCG6seTiEDc=;
 b=Eef6bqt9VIOL62ATH7Hd5Boci67dX4HDOum+jxT5gDGfrXzwjIC2cKjSydhVbY/y4CPQEDGxrdotAY6F8+BI0G4f9pNnPeeosYh4Z+UkEiE+tJz6dGvyCBSlmT37Xf3Okayq9/jA0riHvewcjKN9t/2mYBMxolxRztKSAo28OJgB8k3UyUpWOPNFEPlLpr1mGNCcQeGvnGvJ2P1KSYwqCg9/dEIrOrq01rdwfV4dI259gsUPdim2a1CMYFvP68moKZ/WEjeUUOJy3wfa+8tsjofX1bgwziHFCdD6jQit1DM/CXaM6ba+a+nO9ASeybX7C+BqjozAwY2JTyRWFZf5Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnutB2bl7ht4P4lqz7e6amb2rM2LKOcjyCG6seTiEDc=;
 b=ayZFh9K56EuX7PC/1AeFTuDHs6O6PZ11felq9oJNHq7gGF9ORceQM6gyOlvnvxobZrS/iM1Wu6QFW4u/ZdvzT384AH8ZaIpRRMQ3GHe+ymj5OBEEdAg/j26ak3KxGpqUwmXdKKONJLBP9/R+jGkNIQ+kI6cdvX03u/VvNUD/d70=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB4042.namprd12.prod.outlook.com (2603:10b6:5:215::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17; Wed, 2 Dec 2020 18:02:09 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3611.025; Wed, 2 Dec 2020
 18:02:09 +0000
Subject: Re: [PATCH v2 5/8] drm/amdgpu: Refactor sysfs removal
To: Greg KH <gregkh@linuxfoundation.org>
References: <20200622164551.GA112181@kroah.com>
 <4787b2a9-e7bf-ea3c-02e9-484a4fcb4742@amd.com>
 <20200623060532.GB3818201@kroah.com>
 <090c5a35-3088-d6d0-dcaf-5ce5542a4298@amd.com>
 <20200624061153.GA933050@kroah.com>
 <c864c559-71f4-08a5-f692-3f067a9a32f8@amd.com> <X6rU6lKDCyl6RN+V@kroah.com>
 <9db66134-0690-0972-2312-9d9155a0c5d8@amd.com> <X6wEbtSDm69gzFbR@kroah.com>
 <bc6cc476-4f09-1c0f-37b9-522723ecdc85@amd.com> <X8fQQpYDqsgGJUPt@kroah.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <7a35f0d7-6e0c-0ebd-c6ea-6629335b85ff@amd.com>
Date: Wed, 2 Dec 2020 13:02:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <X8fQQpYDqsgGJUPt@kroah.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:9ced:9698:f02b:99c8]
X-ClientProxiedBy: YT1PR01CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::19) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:9ced:9698:f02b:99c8]
 (2607:fea8:3edf:49b0:9ced:9698:f02b:99c8) by
 YT1PR01CA0050.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 18:02:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 77cdbf27-d991-419e-41ba-08d896ec6334
X-MS-TrafficTypeDiagnostic: DM6PR12MB4042:
X-Microsoft-Antispam-PRVS: <DM6PR12MB40427CE1263969B6B7DEE4DDEAF30@DM6PR12MB4042.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n8esew/JT+Lf5B2wEJGYpwLug1R5HA97dN3xaD0prCpxKdrDsX8/GBKQy7+R0W4HUrDz5oa/qkqO2+HPj19/h2fMOX7Wk3vpMGdNNweGzGplR/bI630gOyHgUA9clA3ZtgPA3Bfgm9rJVDhjAGmoTg623eb2pnqOFe1iIbjcHNxOlp68H06Acif/1HDrhu3y5lvuUcyi3K7hdnzACAz7DEfVYRn2ObQ3jERr0ldLOVCMsRn1LO+1K4WEUPvX9UEvAWULS2bIDXwAWqyKHNHA+fKqjvb3LEeVzAoEHdT9hQUCnSzI44JF+eLf/ou8BzRy5KRiJqJWeIeGTCAwHKij/Xh/v/XXQ2OwISNReJGgaVsE+WeuxfZlff6kAYL31Tc9BKnJv93r8yRDs5uovZAkxn9RPKA5Mg5asnvIAgeA/wk6+PXZJ/Z0sLqfSsmOJyjR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(8676002)(2616005)(36756003)(31696002)(966005)(316002)(45080400002)(478600001)(31686004)(5660300002)(66476007)(66946007)(66556008)(83380400001)(186003)(2906002)(86362001)(4326008)(53546011)(16526019)(52116002)(6486002)(8936002)(6916009)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cmNKVktaT2hzdW5PbUNFMWZjUlkzYTA5eUVwR1U2aHp2dWQwSWVCWnlKQ2tk?=
 =?utf-8?B?VkdjbE5pZE5Ibmo0d1J3UzEzdmxuNGFyTEdDd3FUK1Bzb04vVzZjTWlXcEo3?=
 =?utf-8?B?cXpManMxSXpCQUw0SWZyQlZiNEpkRnFkUXZnNm10VWFvZFJYSEhKdkdERnhQ?=
 =?utf-8?B?QkRlYnMydlRhenNWeU5EcFcrYnU2aDJ2ekUrMVBtTEdXNXpiN3VtbkxESUpV?=
 =?utf-8?B?cU5ObDNXL1ZrdFlzQjlYMGRPYTVlYVJrNkZvNm80eDNoM2dLRmJYbG5yNFM1?=
 =?utf-8?B?R1EyRnpPdVNnb2FWUFJkRW1RU3UyVDJHZVo0NGpNZkFBaXJMYkhrVGtyWnpx?=
 =?utf-8?B?bStFZ2NjVTYwZUhhakZDN0EwUlZxMzVWZzl3SlFmWVdSUFhUanI4bWtEaDVY?=
 =?utf-8?B?Sms2L0N4Zm9MRld2Qy80TXhpemo2Ulh3WG1KR29YUGljaStDYndwRWJUcWtj?=
 =?utf-8?B?ZU4yMFVmdm5naHpZckxYU29BcHZRdDAzeUFpQktaQXlDWm1JS2syWThFTjFM?=
 =?utf-8?B?L0JNaGg3M1NtWDcrKzlPcVVRcE1CRHBjSFBVZEJzWVc2eHpWWXovb2RqRG9N?=
 =?utf-8?B?NktsZFordnZNZlJQeCtvYXUreWdpVUFKd3RtcUc1NVh0MTNUNFRUaHNMM1JB?=
 =?utf-8?B?Q1l2YVJVcXFNYmtUOHc2ejJDQ0Z6cS9uTDEvS3doNGNZUUVXT3ZPL1o4bE1z?=
 =?utf-8?B?d0tndVBuNjNiNGlsSnh1bUxtRVBlWGJiZ2NHUDV1YjdWa3hqVWV5QVk4c2R3?=
 =?utf-8?B?WFhwZ1dya015UWMzTjJ1cWlPci9YeTVKbFlEWGcvM0E1Y3ZDR2hBU1Y4SUYv?=
 =?utf-8?B?UC9kcDJtaktsMXRZT1BPR25UK1loc0lFL0ZZL09oYkdnTDhYaVJZWWl1YWND?=
 =?utf-8?B?RU5ENG1nZmRTTkN5b0d4elZCVW16blNwUDNqcjVPUnc0Y0crNDZLdDlkSXAv?=
 =?utf-8?B?dkJGZzBEclhGODJGWkEyd21ienVRQmhnNktUM1pmOUFKVWk1WFlZRlNpNy9N?=
 =?utf-8?B?TXpmcmhCaU8wckE0aHFQd011Sis0WWg5dmlJZ3VMZ3g2WVdYOUZMTVlwZlpM?=
 =?utf-8?B?NlZ5bzZkOGpQb1hLcVF3T1VFSmVJeDY4c2FHdDhiTmw0TWRVQVk2RDBjdUg0?=
 =?utf-8?B?Q20yS04va05ralJZcUw2Mll5djU2K3RIdGNEaDFRSnFsWnlOc3NTZ1FQZ3hw?=
 =?utf-8?B?RlNIcHpTWkwxeVpRSUhUZlB0VEJONmRCaGZsVjNrcyt1NGFreTQrN1czWmJW?=
 =?utf-8?B?UFh4Y1dHeEg2MFBScTZLUnkxMmM2azBOT3BSZ2tpc1h6L2FVVENHN3lTbFVV?=
 =?utf-8?B?WmVSWGQ2Tmw5Z29VZ2daNWRNejFMVUdab3NxcTg1dDVGL0FoMUFoUERHUzBp?=
 =?utf-8?B?KzJKNUZSRXk4Tjkxa2haSXFybnBFakptcElnQnFCS0pweFlONkdqczhJVk9y?=
 =?utf-8?Q?Y9Z+kiRT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77cdbf27-d991-419e-41ba-08d896ec6334
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 18:02:09.5644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVsM/D9UY/8ekXx3zpXbfcgubgB8soyODuerQgSQgfVMenXg5XzpctlYnjsCNW3kpFiOK7mAqIqhNfSvIEDVJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4042
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDEyLzIvMjAgMTI6MzQgUE0sIEdyZWcgS0ggd3JvdGU6Cj4gT24gV2VkLCBEZWMgMDIsIDIw
MjAgYXQgMTA6NDg6MDFBTSAtMDUwMCwgQW5kcmV5IEdyb2R6b3Zza3kgd3JvdGU6Cj4+IE9uIDEx
LzExLzIwIDEwOjM0IEFNLCBHcmVnIEtIIHdyb3RlOgo+Pj4gT24gV2VkLCBOb3YgMTEsIDIwMjAg
YXQgMTA6MTM6MTNBTSAtMDUwMCwgQW5kcmV5IEdyb2R6b3Zza3kgd3JvdGU6Cj4+Pj4gT24gMTEv
MTAvMjAgMTI6NTkgUE0sIEdyZWcgS0ggd3JvdGU6Cj4+Pj4+IE9uIFR1ZSwgTm92IDEwLCAyMDIw
IGF0IDEyOjU0OjIxUE0gLTA1MDAsIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+Pj4+Pj4gSGks
IGJhY2sgdG8gdGhpcyBhZnRlciBhIGxvbmcgY29udGV4dCBzd2l0Y2ggZm9yIHNvbWUgaGlnaGVy
IHByaW9yaXR5IHN0dWZmLgo+Pj4+Pj4KPj4+Pj4+IFNvIGhlcmUgSSB3YXMgYWJsZSBldmVudHVh
bGx5IHRvIGRyb3AgYWxsIHRoaXMgY29kZSBhbmQgdGhpcyBjaGFuZ2UgaGVyZSBodHRwczovL25h
bTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHM6JTJGJTJGY2dp
dC5mcmVlZGVza3RvcC5vcmclMkZ+YWdyb2R6b3YlMkZsaW51eCUyRmNvbW1pdCUyRiUzRmglM0Rh
bWQtc3RhZ2luZy1kcm0tbmV4dC1kZXZpY2UtdW5wbHVnJTI2aWQlM0Q2MTg1MmM4YTU5YjRkZDg5
ZDYzNzY5MzU1MmM3MzE3NWI5ZjJjY2Q2JmFtcDtkYXRhPTA0JTdDMDElN0NBbmRyZXkuR3JvZHpv
dnNreSU0MGFtZC5jb20lN0MyOWZmN2VmYjg5YmQ0N2Q4NDg4NzA4ZDg5NmU4NmU3YyU3QzNkZDg5
NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc0MjUyNzIzMTc1MjkxMzQl
N0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVN
eklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9VnpjM2ZW
b2ZBNiUyQk1QU3FIbUJxY1dhdlFMS1dVMSUyRlhLSkZ1bjI0aXJMZjAlM0QmYW1wO3Jlc2VydmVk
PTAKPj4+Pj4+IHdhcyBlbm91Z2ggZm9yIG1lLiBTZWVtcyBsaWtlIHdoaWxlIGRldmljZV9yZW1v
dmVfZmlsZSBjYW4gaGFuZGxlIHRoZSB1c2UKPj4+Pj4+IGNhc2Ugd2hlcmUgdGhlIGZpbGUgYW5k
IHRoZSBwYXJlbnQgZGlyZWN0b3J5IGFscmVhZHkgZ29uZSwKPj4+Pj4+IHN5c2ZzX3JlbW92ZV9n
cm91cCBnb2VzIGRvd24gaW4gZmxhbWVzIGluIHRoYXQgY2FzZQo+Pj4+Pj4gZHVlIHRvIGtvYmot
PnNkIGJlaW5nIHVuc2V0IG9uIGRldmljZSByZW1vdmFsLgo+Pj4+PiBBIGRyaXZlciBzaG91bGRu
J3QgZXZlciBoYXZlIHRvIHJlbW92ZSBpbmRpdmlkdWFsIHN5c2ZzIGdyb3VwcywgdGhlCj4+Pj4+
IGRyaXZlciBjb3JlL2J1cyBsb2dpYyBzaG91bGQgZG8gaXQgZm9yIHRoZW0gYXV0b21hdGljYWxs
eS4KPj4+Pj4KPj4+Pj4gQW5kIHdoZW5ldmVyIGEgZHJpdmVyIGNhbGxzIGEgc3lzZnNfKiBjYWxs
LCB0aGF0J3MgYSBoaW50IHRoYXQgc29tZXRoaW5nCj4+Pj4+IGlzIG5vdCB3b3JraW5nIHByb3Bl
cmx5Lgo+Pj4+Cj4+Pj4gRG8geW91IG1lYW4gdGhhdCB3aGlsZSB0aGUgZHJpdmVyIGNyZWF0ZXMg
dGhlIGdyb3VwcyBhbmQgZmlsZXMgZXhwbGljaXRseQo+Pj4+IGZyb20gaXQncyBkaWZmZXJlbnQg
c3Vic3lzdGVtcyBpdCBzaG91bGQgbm90IGV4cGxpY2l0bHkgcmVtb3ZlIGVhY2gKPj4+PiBvbmUg
b2YgdGhlbSBiZWNhdXNlIGFsbCBvZiB0aGVtIHNob3VsZCBiZSByZW1vdmVkIGF0IG9uY2UgKGFu
ZAo+Pj4+IHJlY3Vyc2l2ZWx5KSB3aGVuIHRoZSBkZXZpY2UgaXMgYmVpbmcgcmVtb3ZlZCA/Cj4+
PiBJbmRpdmlkdWFsIGRyaXZlcnMgc2hvdWxkIG5ldmVyIGFkZCBncm91cHMvZmlsZXMgaW4gc3lz
ZnMsIHRoZSBkcml2ZXIKPj4+IGNvcmUgc2hvdWxkIGRvIGl0IHByb3Blcmx5IGZvciB5b3UgaWYg
eW91IGhhdmUgZXZlcnl0aGluZyBzZXQgdXAKPj4+IHByb3Blcmx5LiAgQW5kIHllcywgdGhlIGRy
aXZlciBjb3JlIHdpbGwgYXV0b21hdGljYWxseSByZW1vdmUgdGhlbSBhcwo+Pj4gd2VsbC4KPj4+
Cj4+PiBQbGVhc2UgdXNlIHRoZSBkZWZhdWx0IGdyb3VwcyBhdHRyaWJ1dGUgZm9yIHlvdXIgYnVz
L3N1YnN5c3RlbSBhbmQgdGhpcwo+Pj4gd2lsbCBoYXBwZW4gYXV0b21hZ2ljYWxseS4KPj4KPj4g
SGkgR3JlZywgSSB0cmllZCB5b3VyIHN1Z2dlc3Rpb24gdG8gaGFuZyBhbWRncHUncyBzeXNmcwo+
PiBhdHRyaWJ1dGVzIG9uIGRlZmF1bHQgYXR0cmlidXRlcyBpbiBzdHJ1Y3QgZGV2aWNlLmdyb3Vw
cyBidXQgdHVybnMgb3V0IGl0J3MKPj4gbm90IHVzYWJsZSBzaW5jZSBieSB0aGUKPj4gdGltZSBp
IGhhdmUgYWNjZXNzIHRvIHN0cnVjdCBkZXZpY2UgZnJvbSBhbWRncHUgY29kZSBpdCBoYXMgYWxy
ZWFkeSBiZWVuCj4+IGluaXRpYWxpemVkIGJ5IHBjaSBjb3JlCj4+IChpLmUuwqAgcGFzdCB0aGUg
cG9pbnQgd2hlcmUgZGV2aWNlX2FkZC0+ZGV2aWNlX2FkZF9hdHRycy0+ZGV2aWNlX2FkZF9ncm91
cHMKPj4gd2l0aCBkZXYtPmdyb3VwcyBpcyBjYWxsZWQpCj4+IGFuZCBzbyBpIGNhbid0IHJlYWxs
eSB1c2UgaXQuCj4gVGhhdCdzIG9kZCwgd2h5IGNhbid0IHlvdSBqdXN0IHNldCB0aGUgZ3JvdXBz
IHBvaW50ZXIgaW4geW91ciBwY2lfZHJpdmVyCj4gc3RydWN0dXJlPyAgVGhhdCdzIHdoYXQgaXQg
aXMgdGhlcmUgZm9yLCByaWdodD8KCkkgYW0gcHJvYmFibHkgbWlzc2luZyBzb21ldGhpbmcgYnV0
IGFtZGdwdSBzeXNmcyBhdHRycyBhcmUgcGVyIGRldmljZSBub3QgcGVyIApkcml2ZXIKYW5kIHRo
ZWlyIGxpZmUgY3ljbGUgaXMgYm91bmQgdG8gdGhlIGRldmljZSBhbmQgdGhlaXIgbG9jYXRpb24g
aW4gdGhlIHN5c2ZzIAp0b3BvbG9neSBpcwp1bmRlciBlYWNoIGRldmljZS4gUHV0dGluZyB0aGVt
IGFzIGRyaXZlciBkZWZhdWx0IGF0dHIgd2lsbCBub3QgcHV0IHRoZW0gaW4gCnRoZWlyIGN1cnJl
bnQgcGVyIGRldmljZSBsb2NhdGlvbgphbmQgd29uJ3QgbWFrZSB0aGVtIGF1dG9tYXRpY2FsbHkg
YmUgZGVzdHJveWVkIG9uY2UgYSBwYXJ0aWN1bGFyIGRldmljZSBnb2VzIAphd2F5LCBubyA/CgpB
bmRyZXkKCgo+Cj4+IFdoYXQgSSBjYW4gb25seSB0aGluayBvZiB1c2luZyBpcyBjcmVhdGluZyBt
eSBvd24gc3RydWN0IGF0dHJpYnV0ZV9ncm91cCAqKgo+PiBhcnJheSBpbiBhbWRncHUgd2hlcmUg
SSBhZ2dyZWdhdGUgYWxsCj4+IGFtZGdwdSBzeXNmcyBhdHRyaWJ1dGVzLCBjYWxsIGRldmljZV9h
ZGRfZ3JvdXBzIGluIHRoZSBlbmQgb2YgYW1ncHUgcGNpCj4+IHByb2JlIHdpdGggdGhhdCBhcnJh
eSBhbmQgb24gZGV2aWNlIHJlbW92ZSBjYWxsCj4+IGRldmljZV9yZW1vdmVfZ3JvdXBzIHdpdGgg
dGhlIHNhbWUgYXJyYXkuCj4gSG9ycmlkLCBubywgc2VlIGFib3ZlIDopCj4KPiB0aGFua3MsCj4K
PiBncmVnIGstaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
