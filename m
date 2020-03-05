Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC8717A5FB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 14:06:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8496E2CA;
	Thu,  5 Mar 2020 13:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D54F6E2CA
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 13:06:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DQ9+XoNLZ6yu5Whnnw4Ut2bYgzHsLSOAOiAmfM48276EKNqJ5gEQYQJx5zcu9BBPAAVd6nWbB+Of5iFlPoEucpHvQAFo+4hV/Ce/SBOF5r6ebLGkxs9EpYGwAt9e6fCpy1Fc+9UTAoyFr8Aq55IJR0MMDJLP+COx1rXfxexhIK9YpkRd+5dBJGDPHzf3BnLTXPRRkCgbfBz7N6pq3QEU+RyCcZd4x6GblTAgyOS1F2238hCUN2emslHl5g/gdPQxaZDOsF9mSJixb8J+jdqE+rwd8ECAuKeuz9dGGOK9XCziugdPG1BGbecKRrWrS+Vxm0k6456eBmJDQp/2fo7fJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqNL9FcGGcb/dfMzEIXU6J9BccTobLaTuWOTPyaNml8=;
 b=fzLjKfl0D+RGY7YBzMwap4KgrvF3foiWdL1IjjqTTawdOTZ3CVjnvdKe8Sxy0tC+JUbDLafzawAN59AG7WYTr6GPRVLCaY8/stfMorZ04hRmTDVZQmkNAArzrV5Z+CLvuqBlVjLYGPm7SH99FbVJxgndicJ4s0td8Z8T2eQLok5Ee8SsclnIYgtOU8jPAVwsr1jWCa2CYmYtJkjnVMsUnJMWRUwT/U65gqFh585DNsONhciGktqiUppTbcINURCQ2dQpSKicGmStQwZfBEOij5f7Q7nIRomyroKg0AIyVOPttzt7bHrRnjRMPpZNk8eHdhyoTrgXXfLUZaMxSxNTwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqNL9FcGGcb/dfMzEIXU6J9BccTobLaTuWOTPyaNml8=;
 b=VpeQ8+C5MLZwaAJBHYWcQy/oD2SsRDgc2GkyfTCvpG+39Xs7ZCcPtPv68KO5VuWidPzKnQgY3CLzcHa68D2lGJgMV+eOpPutoapwc/BXW+6KXbmpyTfXAUt4Z82Y5VlWHHzN3EhEUPaWsHsAsqCa//WEb3o8OgBR6wqQhTlvqbA=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
 by DM5PR12MB2550.namprd12.prod.outlook.com (2603:10b6:4:b8::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16; Thu, 5 Mar
 2020 13:06:27 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2772.019; Thu, 5 Mar 2020
 13:06:27 +0000
Subject: Re: [PATCH] RFC: dma-buf: Add an API for importing and exporting sync
 files
To: Jason Ekstrand <jason@jlekstrand.net>
References: <20200225235856.975366-1-jason@jlekstrand.net>
 <8066d8b2-dd6a-10ef-a7bb-2c18a0661912@amd.com>
 <20200226100523.GQ2363188@phenom.ffwll.local>
 <CAOFGe94O66HL212aXqhi9tdYqw---Xm-fwNSV4pxHyPmpSGpbg@mail.gmail.com>
 <CAP+8YyEUz29fXDW5kO_0ZG6c849=TuFWCK8ynT3LuM+Tn+rMzw@mail.gmail.com>
 <810a26e7-4294-a615-b7ee-18148ac70641@amd.com>
 <CAOFGe96namyeQXTvdrduM+=wkJuoWWx34CxcsJHS3fcCaKDadw@mail.gmail.com>
 <21aeacc0-f3ae-c5dd-66df-4d2f3d73f73e@amd.com>
 <CAOFGe95Gx=kX=sxwhx1FYmXQuPtGAKwt2V5YodQBwJXujE3WwA@mail.gmail.com>
 <CAOFGe97XSxgzCViOH=2+B2_d5P3vGifKmvAw-JrzRQbbRMRbcg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6fb8becf-9e6b-f59e-9c22-2b20069241a7@amd.com>
Date: Thu, 5 Mar 2020 14:06:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <CAOFGe97XSxgzCViOH=2+B2_d5P3vGifKmvAw-JrzRQbbRMRbcg@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0202CA0010.eurprd02.prod.outlook.com
 (2603:10a6:200:89::20) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0202CA0010.eurprd02.prod.outlook.com (2603:10a6:200:89::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16 via Frontend
 Transport; Thu, 5 Mar 2020 13:06:21 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 314297da-1ef0-4e62-97ed-08d7c1060376
X-MS-TrafficTypeDiagnostic: DM5PR12MB2550:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2550F6011FC5C25ABE3D75B983E20@DM5PR12MB2550.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 03333C607F
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(189003)(199004)(478600001)(2906002)(4326008)(66946007)(66556008)(66476007)(6666004)(5660300002)(2616005)(8676002)(81166006)(8936002)(81156014)(66574012)(6916009)(31686004)(186003)(16526019)(7416002)(6486002)(316002)(54906003)(36756003)(86362001)(53546011)(52116002)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2550;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1FyNnT5cwA/0hzlkj12jmaxP8X+YHX4Rd0rSPpy1EJQ8gF13lcHR0nXM+3nPfahAMOqG3eg1iek6JMdEJMeVeqSINI0oOdNUM0VWOEPMR7Q3YklTsE5gBV/PW+jIeJ2zg+Et2foec79KsFPu2k1N7qIG48iQtgTAt0bU4IgV1hdS+VA6rJj7UaGHwJqLa0jMLKxMaoxf8JESxiq8rK7rKGXlBRfFKcfA2jluX6Wfw1dKO2hpak6j94SX9R/aBiipCDviMUU4143psO30/pigxNGWFt3aV+DZdsipueP29WAUsr2f87xvWEA0SpvLaWptMvt8DIK7s/fDb3q7pAL2cCr+8w/8xVBOJYWP1HE8u572WkeiPcNYQtK2ConWVnE4tdpaWiVWJA6EWWJ/P8enoASULuIjPZxmsFJQ0py08WA6XmWeA2/nxPeMXJKw29Sl
X-MS-Exchange-AntiSpam-MessageData: 9OZ3sY85iSFvOkCuFSWTCdyWrPiaeD2YKjSIYP8i5j2674oVtWoRK8Aur47FSZ8CLZkf9/jI5K7pvTim8nO28xypNOZXVeMpqLjBAMNGoDXtTFZfPC0PSOOyWXwxSNtwteekiUnlSGdyvpCqnXF2b8xiTXfCrQ40Yedt2iDp1Hi5tpR9qlyn9xQoWbyzRb4A/TnsdkSPFLhe/5Vlo+zAXQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 314297da-1ef0-4e62-97ed-08d7c1060376
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2020 13:06:27.0351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TfLsGbjvKvZSvjf2EtAujJCw8Ei8TtWpANtCIwGKRj4zcce0iZWsgba208VU088S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2550
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
Cc: Chenbo Feng <fengc@google.com>, Daniel Stone <daniels@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, James Jones <jajones@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>, Greg Hackmann <ghackmann@google.com>,
 linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Kristian_H=c3=b8gsberg?= <hoegsberg@google.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>, Jesse Hall <jessehall@google.com>,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDQuMDMuMjAgdW0gMTc6NDEgc2NocmllYiBKYXNvbiBFa3N0cmFuZDoKPiBPbiBXZWQsIE1h
ciA0LCAyMDIwIGF0IDEwOjI3IEFNIEphc29uIEVrc3RyYW5kIDxqYXNvbkBqbGVrc3RyYW5kLm5l
dD4gd3JvdGU6Cj4+IE9uIFdlZCwgTWFyIDQsIDIwMjAgYXQgMjozNCBBTSBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Pj4gQW0gMDMuMDMuMjAgdW0g
MjA6MTAgc2NocmllYiBKYXNvbiBFa3N0cmFuZDoKPj4+PiBPbiBUaHUsIEZlYiAyNywgMjAyMCBh
dCAyOjI4IEFNIENocmlzdGlhbiBLw7ZuaWcKPj4+PiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
PiB3cm90ZToKPj4+PiBbU05JUF0KPj4+IEZvciByZWZlcmVuY2Ugc2VlIHdoYXQgZGFuY2UgaXMg
bmVjZXNzYXJ5IGluIHRoZSBkbWFfZmVuY2VfY2hhaW5fcmVsZWFzZQo+Pj4gZnVuY3Rpb24gdG8g
YXZvaWQgdGhhdDoKPj4+PiAgICAgICAgICAvKiBNYW51YWxseSB1bmxpbmsgdGhlIGNoYWluIGFz
IG11Y2ggYXMgcG9zc2libGUgdG8gYXZvaWQKPj4+PiByZWN1cnNpb24KPj4+PiAgICAgICAgICAg
KiBhbmQgcG90ZW50aWFsIHN0YWNrIG92ZXJmbG93Lgo+Pj4+ICAgICAgICAgICAqLwo+Pj4+ICAg
ICAgICAgIHdoaWxlICgocHJldiA9IHJjdV9kZXJlZmVyZW5jZV9wcm90ZWN0ZWQoY2hhaW4tPnBy
ZXYsIHRydWUpKSkgewo+Pj4gLi4uLgo+Pj4KPj4+IEl0IHRvb2sgbWUgcXVpdGUgYSB3aGlsZSB0
byBmaWd1cmUgb3V0IGhvdyB0byBkbyB0aGlzIHdpdGhvdXQgY2F1c2luZwo+Pj4gaXNzdWVzLiBC
dXQgSSBkb24ndCBzZWUgaG93IHRoaXMgd291bGQgYmUgcG9zc2libGUgZm9yIGRtYV9mZW5jZV9h
cnJheS4KPj4gQWgsIEkgc2VlIHRoZSBpc3N1ZSBub3chICBJdCBoYWRuJ3QgZXZlbiBvY2N1cnJl
ZCB0byBtZSB0aGF0IHVzZXJzcGFjZQo+PiBjb3VsZCB1c2UgdGhpcyB0byBidWlsZCB1cCBhbiBp
bmZpbml0ZSByZWN1cnNpb24gY2hhaW4uICBUaGF0J3MgbmFzdHkhCgpZZWFoLCB3aGVuIEkgZmly
c3Qgc3R1bWJsZWQgb3ZlciBpdCBpdCB3YXMgbGlrZSB3aHkgdGhlIGhlY2sgaXMgbXkgY29kZSAK
Y3Jhc2hpbmcgaW4gYW4gaW50ZXJydXB0IGhhbmRsZXI/CgpSZWFsaXppbmcgdGhhdCB0aGlzIGlz
IHN0YWNrIGNvcnJ1cHRpb24gYmVjYXVzZSBvZiB0aGUgbG9uZyBjaGFpbiB3ZSAKY29uc3RydWN0
ZWQgd2FzIHF1aXRlIGFuIGVubGlnaHRlbm1lbnQuCgpBbmQgdGhlbiBpdCB0b29rIG1lIGV2ZW4g
bG9uZ2VyIHRvIGZpeCBpdCA6KQoKPj4gICBJJ2xsIGdpdmUgdGhpcyBzb21lIG1vcmUgdGhvdWdo
dCBhbmQgc2VlIGlmIGNhbiBjb21lIHVwIHdpdGgKPj4gc29tZXRoaW5nIGNsZXZlci4KPj4KPj4g
SGVyZSdzIG9uZSB0aG91Z2h0OiAgV2UgY291bGQgbWFrZSBkbWFfZmVuY2VfYXJyYXkgYXV0b21h
dGljYWxseQo+PiBjb2xsYXBzZSBhbnkgYXJyYXlzIGl0IHJlZmVyZW5jZXMgYW5kIGluc3RlYWQg
ZGlyZWN0bHkgcmVmZXJlbmNlIHRoZWlyCj4+IGZlbmNlcy4gIFRoaXMgd2F5LCBubyBtYXR0ZXIg
aG93IG11Y2ggdGhlIGNsaWVudCBjaGFpbnMgdGhpbmdzLCB0aGV5Cj4+IHdpbGwgbmV2ZXIgZ2V0
IG1vcmUgdGhhbiBvbmUgZG1hX2ZlbmNlX2FycmF5LiAgT2YgY291cnNlLCB0aGUKPj4gZGlmZmlj
dWx0eSBoZXJlIChhbnN3ZXJpbmcgbXkgb3duIHF1ZXN0aW9uKSBjb21lcyBpZiB0aGV5IHBpbmct
cG9uZwo+PiBiYWNrLWFuZC1mb3J0aCBiZXR3ZWVuIHNvbWV0aGluZyB3aGljaCBjb25zdHJ1Y3Rz
IGEgZG1hX2ZlbmNlX2FycmF5Cj4+IGFuZCBzb21ldGhpbmcgd2hpY2ggY29uc3RydWN0cyBhIGRt
YV9mZW5jZV9jaGFpbiB0byBnZXQKPj4gYXJyYXktb2YtY2hhaW4tb2YtYXJyYXktb2YtY2hhaW4t
b2YtLi4uICBNb3JlIHRob3VnaHQgbmVlZGVkLgoKQ29uZGVuc2luZyB0aGUgZmVuY2VzIGludG8g
YSBsYXJnZXIgYXJyYXkgY2FuIGNlcnRhaW5seSB3b3JrLCB5ZXMuCgo+IEFuc3dlcmluZyBteSBv
d24gcXVlc3Rpb25zIGFnYWluLi4uICBJIHRoaW5rIHRoZQo+IGFycmF5LW9mLWNoYWluLW9mLWFy
cmF5IGNhc2UgaXMgYWxzbyBzb2x2YWJsZS4KPgo+IEZvciBhcnJheS1vZi1jaGFpbiwgd2UgY2Fu
IHNpbXBseSBhZGQgYWxsIHVuc2lnbmFsZWQgZG1hX2ZlbmNlcyBpbiB0aGUKPiBjaGFpbiB0byB0
aGUgYXJyYXkuICBUaGUgYXJyYXkgd29uJ3Qgc2lnbmFsIHVudGlsIGFsbCBvZiB0aGVtIGhhdmUK
PiB3aGljaCBpcyBleGFjdGx5IHRoZSBzYW1lIGJlaGF2aW9yIGFzIGlmIHdlJ2QgYWRkZWQgdGhl
IGNoYWluIGl0c2VsZi4KClllYWgsIHRoYXQgc2hvdWxkIHdvcmsuIFByb2JhYmx5IGJlc3QgdG8g
aW1wbGVtZW50IHNvbWV0aGluZyBsaWtlIGEgCmN1cnNvciB0byB3YWxrIGFsbCBmZW5jZXMgaW4g
dGhlIGRhdGEgc3RydWN0dXJlLgoKPiBGb3IgY2hhaW4tb2YtYXJyYXksIHdlIGNhbiBhZGQgYWxs
IHVuc2lnbmFsZWQgZG1hX2ZlbmNlcyBpbiB0aGUgYXJyYXkKPiB0byB0aGUgc2FtZSBwb2ludCBp
biB0aGUgY2hhaW4uICBUaGVyZSBtYXkgYmUgc29tZSBmaWRkbGluZyB3aXRoIHRoZQo+IGNoYWlu
IG51bWJlcmluZyByZXF1aXJlZCBoZXJlIGJ1dCBJIHRoaW5rIHdlIGNhbiBnZXQgaXQgc28gdGhl
IGNoYWluCj4gd29uJ3Qgc2lnbmFsIHVudGlsIGV2ZXJ5dGhpbmcgaW4gdGhlIGFycmF5IGhhcyBz
aWduYWxlZCBhbmQgd2UgZ2V0IHRoZQo+IHNhbWUgYmVoYXZpb3IgYXMgaWYgd2UnZCBhZGRlZCB0
aGUgZG1hX2ZlbmNlX2FycmF5IHRvIHRoZSBjaGFpbi4KCldlbGwgYXMgZmFyIGFzIEkgY2FuIHNl
ZSB0aGlzIHdvbid0IHdvcmsgYmVjYXVzZSBpdCB3b3VsZCBicmVhayB0aGUgCnNlbWFudGljcyBv
ZiB0aGUgdGltZWxpbmUgc3luYy4KCkJ1dCBJIHRoaW5rIEkga25vdyBhIGRpZmZlcmVudCB3YXkg
d2hpY2ggc2hvdWxkIHdvcms6IEEgZG1hX2ZlbmNlX2NoYWluIApjYW4gc3RpbGwgY29udGFpbiBh
IGRtYV9mZW5jZV9hcnJheSwgb25seSB0aGUgb3RoZXIgd2F5IGFyb3VuZCBpcyAKZm9yYmlkZGVu
LiBUaGVuIHdlIGNyZWF0ZSB0aGUgY3Vyc29yIGZ1bmN0aW9uYWxpdHkgaW4gc3VjaCBhIHdheSB0
aGF0IGl0IAphbGxvd3MgdXMgdG8gZGVlcCBkaXZlIGludG8gdGhlIGRhdGEgc3RydWN0dXJlIGFu
ZCByZXR1cm4gYWxsIGNvbnRhaW5pbmcgCmZlbmNlcyBvbmUgYnkgb25lLgoKSSBjYW4gcHJvdG90
eXBlIHRoYXQgaWYgeW91IHdhbnQsIHNob3VsZG4ndCBiZSBtb3JlIHRoYW4gYSBmZXcgaG91cnMg
b2YgCmhhY2tpbmcgYW55d2F5LgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKPgo+IEluIGJvdGggY2Fz
ZXMsIHdlIGVuZCB1cCB3aXRoIGVpdGhlciBhIHNpbmdsZSBhcnJheSBvciBhIHNpbmdsZSBhbmQK
PiBkZXN0cnVjdGlvbiBkb2Vzbid0IHJlcXVpcmUgcmVjdXJzaW9uLiAgVGhvdWdodHM/Cj4KPiAt
LUphc29uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
