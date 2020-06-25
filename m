Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBDD20A26C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 17:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870146EBE4;
	Thu, 25 Jun 2020 15:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784026EBE4
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 15:53:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcsCbf7yoZ2u8Rt1nvRg3m4YeVzsRxgYh/0n/Ld44E3xN9+80xdSf9jc4/1RXCprTgyQ3/OAxSQZ5WFEo7CulVhYBORm+BPTpo4lb2I5wEO1PZ4uraUlEdbxc6r78o22j2ZrZXDcYmoxusZfCSht9/KoDli6KodExzFJBfjkDralcMN4oVpfTonfhtecAk3D0RTAvgeljHcLhKitoJJTO2caQRl3yVUAMjO1QjYc9udXxarKYUrES6qKOBaYWzJ+7MANj0eyFGZZIGepanXgZ5vBxQiRCSWOPtvJ42Jx042b7B/Rb6sCH52HyQ5XRnevvtDs4eNmIevAsFIswRXaFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+771EHrfnCbVq6giz4tc1c6RLbRhx5LLBytTH6pU+0=;
 b=hXGeC/cKeDcfoweJ3wzEb+vnYXM0iAd/bKhMrGtCgK+qBwMj2W3UF88U+gg3XmqXfW8aK9GSUlvQNhw+espBpIf2YmPimw3CNq98OtOZjezFeJaB78kpfbIjxzmBIBaiWp83A4aCP4lR4KQv7c247Q1WlGWizmJtrsQOW9SrVT43uuRmGYjm7aSZbZP3dnhlx8cVK6pT0IRDXRdSaj3m1rLiZm7gXGq2c94iNk3g9GnHJad43q5rIaT9RGEiy+ezRNpZYm5pg5p5YnMFE6XrmQYtGcKZC29+E25xZo3HwpIq3J/EID0H6wAm891XYMvayrd3Djw8jotKZihF3UyqXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+771EHrfnCbVq6giz4tc1c6RLbRhx5LLBytTH6pU+0=;
 b=0NGeTjR1D/dwKSTKdoeoGxYJ5tvne9kkcOvmx/Ym80UO9Fsf3u4gnXBKNtWKCOrGASfE4G+kfMbRdovmt3GPKSn+jwXTJLow7d/BCD2wqpp1UJ3hCL47mB+eALKY8Y9ds9qPQcP+iR1W3Lf5l02GY89E07Rf4CTG8BTJKbjEizg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3708.namprd12.prod.outlook.com (2603:10b6:5:1c5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Thu, 25 Jun
 2020 15:53:06 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::a045:f8c0:8edb:1ef1]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::a045:f8c0:8edb:1ef1%9]) with mapi id 15.20.3131.020; Thu, 25 Jun 2020
 15:53:06 +0000
Subject: Re: [RESEND] [PATCH v6 0/8] do not store GPU address in TTM
To: Daniel Vetter <daniel@ffwll.ch>,
 "Nikula, Jani" <jani.nikula@linux.intel.com>
References: <20200624182648.6976-1-nirmoy.das@amd.com>
 <b5629fcc-ba5e-4882-bafb-d88ef0ef144e@amd.com>
 <CAKMK7uGQCttt-X3eoftdO6aHRtS0RQE6P=yRQK97Hp9N2jLLYQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <803bcaee-3773-ed9d-2b55-74961d693c05@amd.com>
Date: Thu, 25 Jun 2020 17:52:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <CAKMK7uGQCttt-X3eoftdO6aHRtS0RQE6P=yRQK97Hp9N2jLLYQ@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0082.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::35) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0082.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.21 via Frontend Transport; Thu, 25 Jun 2020 15:53:04 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 82c26a1d-bf43-450f-ab4b-08d8191fda04
X-MS-TrafficTypeDiagnostic: DM6PR12MB3708:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3708973599412C18BFC212BD83920@DM6PR12MB3708.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aDOgyyDECYJ3uQsxHvDHfBsZ1ziYzKwObK/Io9Rw22O33UYn+3OBmSkpnlSJ+nyeaFrvA29TCykYIIZenhomUCT3N/qDom0NQgd543SfbaIKdtJkk/DGNY0Jiz9nQfgh+4CdL1lrJwHy1Aqpkq0nqDtDI+dkBcfViCoNpZO+tTwI+6LJg+nYgCKzwv/03HDhZ7Jkg9ZEqCjDklglKyaCxIoXn5I/2W1xE8QcGGprKMLs6CPLWZAnlCWvZG1UNaFc28zP0BzHtxggYUjNZs9wvmSCwsR6JcIuHWctzNYp/1+wHHgm2gqEXV4E2GjTF/QG7WvSepzL+AQdtuJzec3fiyE+OuN0pZi7hFGliHCYF/S7+2gnq3jJLSRryEIh1J/NtSZAPz68Nd75Avz9iz9Zm3+jlQWgEWi5FJh3W5Tg8pw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(396003)(366004)(376002)(136003)(478600001)(66946007)(66556008)(36756003)(66476007)(2906002)(45080400002)(6666004)(4326008)(6486002)(16526019)(86362001)(186003)(31696002)(2616005)(316002)(66574015)(5660300002)(83380400001)(7416002)(31686004)(52116002)(8676002)(53546011)(8936002)(966005)(110136005)(54906003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: dq0fADOCKC7GNZ4pEcqcO2oBxlp9QEdvtyMNhqgfL0BzDDj5OLqkUD9OLAyBn5erX41kYUIPilflLmB+xECAViu4CpyBL3qrsSE0AYkfA/w96CgTb91bvLWrhbwDJ4KuUMdOWlBtafzUM0Ld6G3KusFhzelBvRezbPf04KhNrodBGwEACy0hFpXKVnXYE8fGhFRDtbUmXPDhAKXHebw0CdOS54gdDAdIo39NC6iFQts6DMwNDndm2scw8MRwtLmkCCVzyg5zxyVMgRBGOrYdRsWyLED/+OJXZOiE0D/+guxXWXOghLYsTypfW9Y6bB+vnk1jahJBSG5e9xbCcYRJ4aNfu11HqWuhfTnO1gk66uyqrlODih4PiznjkHRBb713fPl9RgxGz1MeF9aT+vPrDbQn3YxcMA5jk1wrHRDAc3Rvzv56Vf+0eF4DQJ/wIuLhwgb/K8VoP9hD3k6QdZKbyoHSa1suZFJFQqkoI69MRIAPeBfdvKwTUSvXCTVk+aWgHDfjzIIul4hOI+3QIxsXcAnKFt8rbdsUj2fWo4DtFiuL+fuVZmC2cJpwftiPBVGm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c26a1d-bf43-450f-ab4b-08d8191fda04
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4401.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 15:53:06.6947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8C/jsbkmbR98kiF31eM0XtkRldbamr2SsD4tYagAxu1pXAvPWU92ND4JbvggG9a0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3708
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
Cc: Sasha Levin <sashal@kernel.org>, Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Airlie <airlied@linux.ie>, "Ho, Kenny" <kenny.ho@amd.com>,
 Brian Welty <brian.welty@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Nirmoy Das <nirmoy.das@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sean Paul <sean@poorly.run>, Nirmoy Das <nirmoy.aiemd@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMDYuMjAgdW0gMTc6NDQgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFRodSwgSnVu
IDI1LCAyMDIwIGF0IDExOjUwIEFNIENocmlzdGlhbiBLw7ZuaWcKPiA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPiB3cm90ZToKPj4gSSd2ZSBwdXNoZWQgcGF0Y2hlcyAjMSwgIzIgYW5kICM1LSM4
IG9mIHRoaXMgc2VyaWVzIHRvIGRybS1taXNjLW5leHQuCj4gSSB0aGluayB5b3UgbGVmdCBhbiB1
bnJlc29sdmVkIGNvbmZsaWN0IGJlaGluZCBpbiBkcm0tdGlwLCBwbGVhc2UgcmVzb2x2ZSBwZXIK
Pgo+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1o
dHRwcyUzQSUyRiUyRmRybS5wYWdlcy5mcmVlZGVza3RvcC5vcmclMkZtYWludGFpbmVyLXRvb2xz
JTJGZHJtLXRpcC5odG1sJTIzcmVzb2x2aW5nLWNvbmZsaWN0cy13aGVuLXJlYnVpbGRpbmctZHJt
LXRpcCZhbXA7ZGF0YT0wMiU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0NjMTQ0
MWE4MWU5ZGM0ZmE0NTA3MjA4ZDgxOTFlYTBmNiU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5
NGUxODNkJTdDMCU3QzAlN0M2MzcyODY5NjY2MzE1OTUzMDAmYW1wO3NkYXRhPXBmV1M0VmdEdlU4
SXNSMjYzOE1EcjdmWVdFMG5lZmEzYjZYeHlQQ0NzT1UlM0QmYW1wO3Jlc2VydmVkPTAKPgo+IFRo
ZSBzY3JpcHQgc2hvdWxkIGhhdmUgdG9sZCB5b3UgdGhhdCBhbHJlYWR5LCBzbyBtYXliZSByZWlu
dmVudCB0aGF0Cj4gaW4gd2hhdGV2ZXIgdGhpbmcgeW91J3JlIHVzaW5nIDotKSBKYW5pIGhhcyBy
ZXBvcnRlZCB0aGlzIG9uCj4gI2RyaS1kZXZlbCwgdGhpcyBhbHNvIGhvbGRzIHVwIENJIHRlc3Rp
bmcgc2luY2Ugd2UncmUgcnVubmluZyBvbiB0b3AKPiBvZiBkcm0tdGlwLgoKV2VsbCBJIHVzZWQg
ZGltIHB1c2gtYnJhbmNoLiBJIGV2ZW4gaGFkIHRvIHJlYmFzZSBvbmNlIG1vcmUgYmVjYXVzZSBJ
IApmb3Jnb3QgYSBzaWduZWQtb2Ygb24gb25lIG9mIHRoZSBwYXRjaGVzLCBzbyBJJ20gcHJldHR5
IHN1cmUgb2YgdGhhdC4KCkhhdmVuJ3Qgc2VlbiBhbnl0aGluZyBwcm9ibGVtYXRpYyBleGNlcHQg
Zm9yIHRoYXQgd2hpbGUgZG9pbmcgc28uCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+IC1EYW5pZWwK
Pgo+Cj4KPj4gT25seSBWTUdGWCBhbmQgTm91dmVhdSBhcmUgbWlzc2luZyBhbmQgSSdtIHByZXR0
eSBjbG9zZSB0byBqdXN0IHB1c2gKPj4gdGhlbSB3aXRoIG15IEFja2VkLWJ5IHNpbmNlIHRoZXkg
c2hvdWxkIG5vdCBjb250YWluIGFueSBmdW5jdGlvbmFsIGNoYW5nZS4KPj4KPj4gQW55IG9iamVj
dGlvbnM/Cj4+Cj4+IFRoYW5rcywKPj4gQ2hyaXN0aWFuLgo+Pgo+PiBBbSAyNC4wNi4yMCB1bSAy
MDoyNiBzY2hyaWViIE5pcm1veSBEYXM6Cj4+PiBXaXRoIHRoaXMgcGF0Y2ggc2VyaWVzIEkgYW0g
dHJ5aW5nIHRvIHJlbW92ZSBHUFUgYWRkcmVzcyBkZXBlbmRlbmN5IGluCj4+PiBUVE0gYW5kIG1v
dmluZyBHUFUgYWRkcmVzcyBjYWxjdWxhdGlvbiB0byBpbmRpdmlkdWFsIGRybSBkcml2ZXJzLiBU
aGlzCj4+PiBjbGVhbnVwIHdpbGwgc2ltcGxpZnkgaW50cm9kdWN0aW9uIG9mIGRybV9tZW1fcmVn
aW9uL2RvbWFpbiB3b3JrIHN0YXJ0ZWQKPj4+IGJ5IEJyaWFuIFdlbHR5WzFdLgo+Pj4KPj4+Cj4+
PiBJdCB3b3VsZCBiZSBuaWNlIGlmIHNvbWVvbmUgdGVzdCB0aGlzIGZvciBub3V2ZWF1LiBSZXN0
IG9mIHRoZSBkcml2ZXJzCj4+PiBhcmUgYWxyZWFkeSB0ZXN0ZWQuCj4+Pgo+Pj4gdjI6Cj4+PiAq
IHNldCBiby0+b2Zmc2V0ID0gMCBmb3IgZHJtL25vdXZlYXUgaWYgYm8tPm1lbS5tbV9ub2RlID09
IE5VTEwKPj4+Cj4+PiB2MzoKPj4+ICogY2F0Y2ggcmV0dXJuIHZhbHVlIG9mIGRybV9nZW1fdnJh
bV9vZmZzZXQoKSBpbiBkcm0vYm9jaHMKPj4+ICogaW50cm9kdWNlIGRybV9nZW1fdnJhbV9wZ19v
ZmZzZXQoKSBpbiB2cmFtIGhlbHBlcgo+Pj4gKiBpbXByb3ZlIG5iby0+b2Zmc2V0IGNhbGN1bGF0
aW9uIGZvciBub3V2ZWF1Cj4+Pgo+Pj4gdjQ6Cj4+PiAqIG1pbm9yIGNvZGluZyBzdHlsZSBmaXhl
cyBpbiBhbWRncHUgYW5kIHJhZGVvbgo+Pj4gKiByZW1vdmUgdW5uZWNlc3Nhcnkga2VybmVsZG9j
IGZvciBpbnRlcm5hbCBmdW5jdGlvbgo+Pj4KPj4+IHY1Ogo+Pj4gKiByZWJhc2Ugb24gdG9wIG9m
IGRybS1taXNjLW5leHQKPj4+ICogZml4IHJldHVybiB2YWx1ZSBvZiBkcm1fZ2VtX3ZyYW1fcGdf
b2Zmc2V0KCkKPj4+ICogYWRkIGEgY29tbWVudCBpbiBkcm1fZ2VtX3ZyYW1fcGdfb2Zmc2V0KCkg
dG8gY2xlYXJpZnkgd2h5IHdlIHJldHVybiAwLgo+Pj4KPj4+IHY2Ogo+Pj4gKiByZWJhc2UgdG8g
ZHJtLW1pc2MtbmV4dAo+Pj4gKiByZW1vdmVkIGFja2VkIGZvciB2bXdnZnggYXMgdGhlcmUgd2Fz
IGEgc21hbGwgY29uZmxpY3QKPj4+Cj4+PiBOaXJtb3kgRGFzICg4KToKPj4+ICAgICBkcm0vYW1k
Z3B1OiBtb3ZlIHR0bSBiby0+b2Zmc2V0IHRvIGFtZGdwdV9ibwo+Pj4gICAgIGRybS9yYWRlb246
IGRvbid0IHVzZSB0dG0gYm8tPm9mZnNldAo+Pj4gICAgIGRybS92bXdnZng6IGRvbid0IHVzZSB0
dG0gYm8tPm9mZnNldAo+Pj4gICAgIGRybS9ub3V2ZWF1OiBkb24ndCB1c2UgdHRtIGJvLT5vZmZz
ZXQgdjMKPj4+ICAgICBkcm0vcXhsOiBkb24ndCB1c2UgdHRtIGJvLT5vZmZzZXQKPj4+ICAgICBk
cm0vdnJhbS1oZWxwZXI6IGRvbid0IHVzZSB0dG0gYm8tPm9mZnNldCB2NAo+Pj4gICAgIGRybS9i
b2NoczogdXNlIGRybV9nZW1fdnJhbV9vZmZzZXQgdG8gZ2V0IGJvIG9mZnNldCB2Mgo+Pj4gICAg
IGRybS90dG06IGRvIG5vdCBrZWVwIEdQVSBkZXBlbmRlbnQgYWRkcmVzc2VzCj4+Pgo+Pj4gICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jICB8IDIzICsrKysrKysr
KysrKysrLS0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3Qu
aCAgfCAgMSArCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMg
ICAgIHwgMzAgKysrKysrKysrKysrKysrKy0tLS0tCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdHRtLmggICAgIHwgIDEgKwo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3ZtX3NkbWEuYyB8ICA0ICstLQo+Pj4gICAgZHJpdmVycy9ncHUvZHJt
L2JvY2hzL2JvY2hzX2ttcy5jICAgICAgICAgICB8ICA3ICsrKystCj4+PiAgICBkcml2ZXJzL2dw
dS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jICAgICAgIHwgMTEgKysrKysrKy0KPj4+ICAgIGRy
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjA0L2NydGMuYyAgICAgfCAgNiArKy0tLQo+Pj4g
ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvZGlzcC5jICAgICB8ICAzICsrLQo+
Pj4gICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvb3ZlcmxheS5jICB8ICA2ICsr
LS0tCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9iYXNlNTA3Yy5jIHwg
IDIgKy0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2NvcmU1MDdkLmMg
fCAgMiArLQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvb3ZseTUwN2Uu
YyB8ICAyICstCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC93bmR3LmMg
ICAgIHwgIDIgKy0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL3duZHdj
MzdlLmMgfCAgMiArLQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9hYmkx
Ni5jICAgICB8ICA4ICsrKy0tLQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVh
dV9iby5jICAgICAgICB8ICA4ICsrKysrKwo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9iby5oICAgICAgICB8ICAzICsrKwo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV9jaGFuLmMgICAgICB8ICAyICstCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X2RtZW0uYyAgICAgIHwgIDIgKy0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L25vdXZlYXVfZmJjb24uYyAgICAgfCAgMiArLQo+Pj4gICAgZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV9nZW0uYyAgICAgICB8IDEwICsrKy0tLS0KPj4+ICAgIGRyaXZlcnMv
Z3B1L2RybS9xeGwvcXhsX2Rydi5oICAgICAgICAgICAgICAgfCAgNiArKy0tLQo+Pj4gICAgZHJp
dmVycy9ncHUvZHJtL3F4bC9xeGxfa21zLmMgICAgICAgICAgICAgICB8ICA1ICsrLS0KPj4+ICAg
IGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5oICAgICAgICAgICAgfCAgNSAtLS0tCj4+
PiAgICBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF90dG0uYyAgICAgICAgICAgICAgIHwgIDkgLS0t
LS0tLQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb24uaCAgICAgICAgICAgICB8
ICAxICsKPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX29iamVjdC5oICAgICAg
fCAxNiArKysrKysrKysrLQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRt
LmMgICAgICAgICB8ICA0ICstLQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyAg
ICAgICAgICAgICAgICB8ICA3IC0tLS0tCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF9iby5jICAgICAgICAgIHwgIDQgKy0tCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF9leGVjYnVmLmMgICAgIHwgIDIgKy0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS92bXdn
Zngvdm13Z2Z4X2ZpZm8uYyAgICAgICAgfCAgMiArLQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3Zt
d2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jICB8ICAyIC0tCj4+PiAgICBpbmNsdWRlL2RybS90dG0v
dHRtX2JvX2FwaS5oICAgICAgICAgICAgICAgIHwgIDIgLS0KPj4+ICAgIGluY2x1ZGUvZHJtL3R0
bS90dG1fYm9fZHJpdmVyLmggICAgICAgICAgICAgfCAgMSAtCj4+PiAgICAzNiBmaWxlcyBjaGFu
Z2VkLCAxMjUgaW5zZXJ0aW9ucygrKSwgNzggZGVsZXRpb25zKC0pCj4+Pgo+Pj4gLS0KPj4+IDIu
MjcuMAo+Pj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
