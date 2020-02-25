Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABF316EEC0
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 20:12:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A4E6EB9D;
	Tue, 25 Feb 2020 19:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CA66EB9C;
 Tue, 25 Feb 2020 19:12:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MgdrX2yZ3wre+eRGCbz37MG0fBwc3j13sL8yfuO/tgWpkQnK/LO/REhyIAr5CQev1Pv7dn7ToSEJAsOA1hngFbVOM+w3FYTGHB2Fh+GgJdJnPuVxqiFNuB3F+oz/NX98U+DY1zrXcKk7ruV0BRe/pS5asxabJPfWPxRc6m48WO3O0R7y8+JBAWEog+1GGw3kYl4eb9XZo/1gVkeMj33JF79qODSNaNIJmh/YUzpTx0ohts26yWu5/bjjvWUrQHcfo4asO6EY+EHFMo2RaJtRHpu7ACUsEMuJQOX5EZA2w00XRXcFbXUTpliQZ2Sodiwuj0rt7uS6kswBUIrfN+/v6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onrucHLfRUKVotzdVIG2r+hTqS1MqyAhgNomrcdfzQQ=;
 b=GmzG6HIRQfmjaAzVucovnKrqbKHA6bQ3+MNSPfTuOCvAvdu6cb45AW7CdjI4mCvSqpxBXgHqwNKXYOCOZlIH5uIEvPIi45LUKAHiwd3wJHcBwMuwvbNc5WFyh0vSw5o/shDlHORvvRZvHSCQCcqzy3ZlO1WB2XpYfUnX3pyqeHLaJ9f9FJWOJ0P5TQ2vYWLNTfZaSsarbg8DoLg5J9LwiD9o7FeReWIptl6E0grJ6R8vko8EjAtlxFP8x+TflbChXdBOGHavKM623v5FulUcc55ZNwRbg0te96bjysaA7x6XN6j6Ws+fdm5UmppHyyCxqmkiboUU4PK+2IMYDap3aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onrucHLfRUKVotzdVIG2r+hTqS1MqyAhgNomrcdfzQQ=;
 b=qn+p+Y3CZlF8026WoGZ9qSQwL35sKz0Mm5PhgAixIGEPPoKx+m9pzDQyXRJr/LdF+/mMdSMAfNZMc3yCD2Git353Q2fa8Z4gOr/V1p1OF2hW+R3ShmSfqtmhGDFBmVjq5ZYt9wZE6zzT5CwWaf19Om+CURoulCmJXc54SRBfd98=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
 by DM5PR12MB1593.namprd12.prod.outlook.com (2603:10b6:4:10::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Tue, 25 Feb
 2020 19:12:35 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2750.021; Tue, 25 Feb
 2020 19:12:35 +0000
Subject: Re: [PATCH] drm/ttm: fix leaking fences via ttm_buffer_object_transfer
To: Alex Deucher <alexdeucher@gmail.com>
References: <20200225185614.1058688-1-alexander.deucher@amd.com>
 <0e6fa597-62c4-3dd3-27bf-fa5ddd6ec1a4@gmail.com>
 <CADnq5_Ox=8+drn8TKSYoo6iCF9fQK6rCtD+uRQSFH3qqGQgO9A@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <42760da2-ad4f-4bc1-ca25-d176fb94a52d@amd.com>
Date: Tue, 25 Feb 2020 20:12:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <CADnq5_Ox=8+drn8TKSYoo6iCF9fQK6rCtD+uRQSFH3qqGQgO9A@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0701CA0003.eurprd07.prod.outlook.com
 (2603:10a6:200:42::13) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0701CA0003.eurprd07.prod.outlook.com (2603:10a6:200:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.13 via Frontend
 Transport; Tue, 25 Feb 2020 19:12:33 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2221e143-d4a0-4a87-e321-08d7ba26abb6
X-MS-TrafficTypeDiagnostic: DM5PR12MB1593:|DM5PR12MB1593:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB15939D14B4DBAD7C269E11FA83ED0@DM5PR12MB1593.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0324C2C0E2
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(189003)(199004)(8676002)(6916009)(53546011)(16526019)(54906003)(4326008)(5660300002)(186003)(86362001)(66476007)(8936002)(45080400002)(2906002)(31696002)(66946007)(36756003)(52116002)(66574012)(966005)(498600001)(2616005)(66556008)(81156014)(6486002)(31686004)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1593;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ykHDqQyUCTu6l75epYq8fCfzmMVSNbmNYBw3uT1IZAPEqR+QzKK2jcyDtGy1OiHo2+twEXsV2DFVrb4xYbTVVw696J2CdYRazWoqGO3S47hkSwTQvflX/i56WpcOKsZwNMtnlsaFDAeV+JtUq4uIc7vz/Zd1kMbZBLNZAhRH7VSrPFJEnRvXu3naTNJKPxBLwuYKcO+yYj17WZnLwWZbVZmhbAGs8if7exwhlcPCtcwJvAEkVus4XpfpwXK8d0A8b4bC9nmAJ2BhdqcFCIKwqg/prRmGP/2wVPWqFMvWhYV3P3HWTS17K8X7Se2q5DBWSopDgL6O24Ih5izQBjXrOufmkQ03/5DROOsYWS18gmMRMAYU0RGOsQDpCz4Y0gQBTzgMUhjsavYzkYSTUIHsyRAvqjcl6YPVxP0UEcd1Z/L2+rmfOVq8bHsb/Ef77v9VEAkDA90PXmOD5rWiPhTDejJrWv6ZQ6y2axSUE+zbx9kBua34Y4rdGkxF8yPrdR99LLberkj10qe2kER9VW3Uaw==
X-MS-Exchange-AntiSpam-MessageData: gKOfOxbT0gEGUqOV6wpBt4x4xzwUoE52Kx6lQpR1jO+Z5ZenHi5sjOH1wdK9zbKW7XAbU1qNtRB4xJypxhTVscqUDor/hTrsB0Kj2t2Nj7bcLHFlbl0W9PZ4uhcsI2y6I6QC2OVTSzYmQIsEMmRIVx3a5zU3aFw8C8roF2oMk87O8dEPBUPw0e9LjuV1s9AKk8qYkIgJzpQf9GV8uWs2ZQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2221e143-d4a0-4a87-e321-08d7ba26abb6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2020 19:12:35.1316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lx51sdT+Lhk9nBK2YrXAOdqbOe6dT/5m9Z5Ih9+XYFZIc0pwcDJcRkypaE3V+V58
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1593
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Ahzo <Ahzo@tutanota.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMDIuMjAgdW0gMjA6MTEgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gT24gVHVlLCBGZWIg
MjUsIDIwMjAgYXQgMjowOSBQTSBDaHJpc3RpYW4gS8O2bmlnCj4gPGNrb2VuaWcubGVpY2h0enVt
ZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPj4gQW0gMjUuMDIuMjAgdW0gMTk6NTYgc2NocmllYiBB
bGV4IERldWNoZXI6Cj4+PiBGcm9tOiBBaHpvIDxBaHpvQHR1dGFub3RhLmNvbT4KPj4+Cj4+PiBT
ZXQgdGhlIGRybV9kZXZpY2UgdG8gTlVMTCwgc28gdGhhdCB0aGUgbmV3bHkgY3JlYXRlZCBidWZm
ZXIgb2JqZWN0Cj4+PiBkb2Vzbid0IGFwcGVhciB0byB1c2UgdGhlIGVtYmVkZGVkIGdlbSBvYmpl
Y3QuCj4+Pgo+Pj4gVGhpcyBpcyBuZWNlc3NhcnksIGJlY2F1c2Ugb3RoZXJ3aXNlIG5vIGNvcnJl
c3BvbmRpbmcgZG1hX3Jlc3ZfZmluaSBmb3IKPj4+IHRoZSBkbWFfcmVzdl9pbml0IGlzIGNhbGxl
ZCwgcmVzdWx0aW5nIGluIGEgbWVtb3J5IGxlYWsuCj4+Pgo+Pj4gVGhlIGRtYV9yZXN2X2Zpbmkg
aW4gdHRtX2JvX3JlbGVhc2VfbGlzdCBpcyBvbmx5IGNhbGxlZCBpZiB0aGUgZW1iZWRkZWQKPj4+
IGdlbSBvYmplY3QgaXMgbm90IHVzZWQsIHdoaWNoIGlzIGRldGVybWluZWQgYnkgY2hlY2tpbmcg
aWYgdGhlCj4+PiBkcm1fZGV2aWNlIGlzIE5VTEwuCj4+Pgo+Pj4gQnVnOiBodHRwczovL25hbTEx
LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXRs
YWIuZnJlZWRlc2t0b3Aub3JnJTJGZHJtJTJGYW1kJTJGaXNzdWVzJTJGOTU4JmFtcDtkYXRhPTAy
JTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3Q2FhM2Y3NzRkYTAzZTRkZmNjMDlh
MDhkN2JhMjY4MzA1JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3
QzYzNzE4MjU0Njg3OTE0NDAzMCZhbXA7c2RhdGE9TjhXeFlaWlJqNW9iTVU1U0x2MGdpb2cwYTFz
Q1lpJTJGb3V4U3VXTm9tMGd3JTNEJmFtcDtyZXNlcnZlZD0wCj4+PiBGaXhlczogMWUwNTNiMTBi
YTYwICgiZHJtL3R0bTogdXNlIGdlbSByZXNlcnZhdGlvbiBvYmplY3QiKQo+Pj4gU2lnbmVkLW9m
Zi1ieTogQWh6byA8QWh6b0B0dXRhbm90YS5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4+IEdvb2QgY2F0Y2ggSSB3YXMgdHJ5
aW5nIHRvIGh1bnQgdGhhdCBvbmUgZG93biBhcyB3ZWxsLgo+Pgo+PiBSZXZpZXdlZC1ieTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENhbiB5b3UgYXBwbHkg
aXQgdG8gZHJtLW1pc2M/CgpTdXJlLCBidXQgbm90IHRvZGF5LiBOZWVkIHRvIGdldCB0aGUga2lk
cyB0byBiZWQuCgpDaHJpc3RpYW4uCgo+Cj4gVGhhbmtzLAo+Cj4gQWxleAo+Cj4+PiAtLS0KPj4+
ICAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYyB8IDEgKwo+Pj4gICAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2JvX3V0aWwuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwu
Ywo+Pj4gaW5kZXggYzhlMzU5ZGVkMWRmLi40NGMxZTdhZGZiN2MgMTAwNjQ0Cj4+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvX3V0aWwuYwo+Pj4gQEAgLTUxNCw2ICs1MTQsNyBAQCBzdGF0aWMgaW50IHR0
bV9idWZmZXJfb2JqZWN0X3RyYW5zZmVyKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4+
PiAgICAgICAgICAgICAgICBmYm8tPmJhc2UuYmFzZS5yZXN2ID0gJmZiby0+YmFzZS5iYXNlLl9y
ZXN2Owo+Pj4KPj4+ICAgICAgICBkbWFfcmVzdl9pbml0KCZmYm8tPmJhc2UuYmFzZS5fcmVzdik7
Cj4+PiArICAgICBmYm8tPmJhc2UuYmFzZS5kZXYgPSBOVUxMOwo+Pj4gICAgICAgIHJldCA9IGRt
YV9yZXN2X3RyeWxvY2soJmZiby0+YmFzZS5iYXNlLl9yZXN2KTsKPj4+ICAgICAgICBXQVJOX09O
KCFyZXQpOwo+Pj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
