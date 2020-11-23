Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3549A2C1526
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 21:05:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5758F6E0AD;
	Mon, 23 Nov 2020 20:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA536E0AA;
 Mon, 23 Nov 2020 20:05:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3K7/XKH4sRKbJgW23MaFvf69x0fOGcH3DsjnqaoISglqYL7eYbBK1ZPXpJ+75XtV7rrWbaJw0bkuLusn1UMk7AAkjC/YhmjAD6/xfmi/zm99ssh4CWmnWVWaNtv2sI4Hs3h3zkPLcDM6RNyRUd7bLVx3OGsicGGDipZyN8JoPa1AI0l3i9wU9XebKEeosOIkAttRJ5dNxI3BTaEIdgQQWb4uDboMVGTv96D5ukb0/tn5MObzmhe5tzCv+JJPklBRZ4HxzZGqnDGwDbcEsGRLEEEpE6U6ODE9p8XkvB9bi9XlZB6ZvMWqlItEHyziaAmNZ5MlE8IvaN+i5dLHL6RZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHM0+tp2D7Gsfd/UDolx+vLPFQMV5XNE5T1d5DLM6Yk=;
 b=fMkg4oJ75aW8/eJDfY2jOZdS6F2wrQ4BBRYY9RUklZN/kTJeuqVewhbB+kle/mrsV301udmeRET6pAbOF7U2SUTyyI6DLU/hCEKMdaLdDtoX0uaL94L/wjbo2hgekQ1Hj0XrYloUCcEoSxaWb6jLQIVSWB5mWArQ8nNa9BTpPyDY2W4EoOvEAs8rjiGE4nsktQ5VSZ47/AZCy5aE6TEjFVl8yRaYTyVt16Y5ABiZGUrEZVTEHgpl+7s5XsjT9zfG8JiFf5HkOqO6pnAftaTkJ274P1KPL/YfTCEYpBrIu0s4Hy+usEspzKa35SxpaLRdPUX1XLsAbWL30qaG7H7i2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHM0+tp2D7Gsfd/UDolx+vLPFQMV5XNE5T1d5DLM6Yk=;
 b=jCwtesMFBrQiOmlmFef+YV8cSvj6Uwk3MGKMNJc8ZKvQT6/WYtv/R1EAtdJKiKTw8iKS5wOqrKTm4X0NIU5QtGq3AXmHm5JbZgS6SyMpDrFoH2g8DXYBxt3lpWGzCyIZMXDvcAGZeqfxmALhP1f6yjxo0VvaPvWpUL4XzAODVfQ=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM5PR12MB1882.namprd12.prod.outlook.com (2603:10b6:3:112::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.25; Mon, 23 Nov 2020 20:05:18 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3589.022; Mon, 23 Nov 2020
 20:05:18 +0000
Subject: Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
To: christian.koenig@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch, robh@kernel.org,
 l.stach@pengutronix.de, yuq825@gmail.com, eric@anholt.net
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-6-git-send-email-andrey.grodzovsky@amd.com>
 <28332cf0-612c-10bd-c64e-fff6e1f18653@gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <320ff94c-78f4-b9a5-4c6f-40f7ce162bd3@amd.com>
Date: Mon, 23 Nov 2020 15:05:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <28332cf0-612c-10bd-c64e-fff6e1f18653@gmail.com>
Content-Language: en-US
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: CH0PR03CA0050.namprd03.prod.outlook.com
 (2603:10b6:610:b3::25) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.231.243] (165.204.55.251) by
 CH0PR03CA0050.namprd03.prod.outlook.com (2603:10b6:610:b3::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 20:05:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e3b46af6-249b-47ae-559b-08d88feb196d
X-MS-TrafficTypeDiagnostic: DM5PR12MB1882:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB18821107F83E968715AB230BEAFC0@DM5PR12MB1882.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vhGzusHcnfAkZAfPqDUK4rLPLNXPOrLFLKv7vAmKbpcsbB6/zj8RgGmsD9GMeRoehmo0Lv5CwLIVD+keXnpLgNqpYTnaHnLf1G+MH8NPt9xwUSB7QOPOyXdCyZdx4V5Ty0e7Cc5GsAo2wvEsX77wjXdL5c7HyuKzb1WSHBGnvysWnTsXro6fkqX15tzE6WImdtCTlSpO/bVhvGKWEaPw98grhEAGy5T4qdQIN4SQpOAzOb/Lh9BkAD2fHOuZlKSjR3fiLjPhO4duvCwWRv37lAwvXmciypviuO4L43xsDVL5QrII+fc7L0Oqejgp7vso7+8TfROW1MY9uD4gNMR9blG1A93ekk8Fde80JN6uUf7O4Lj8+kMtq1yZqrt3PeZ0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(31696002)(2906002)(5660300002)(86362001)(66556008)(66946007)(66476007)(36756003)(16526019)(4326008)(2616005)(956004)(316002)(186003)(53546011)(478600001)(52116002)(6486002)(8676002)(31686004)(26005)(8936002)(16576012)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: PvXq+A4KPnEAUHRf4rfAvYGS+zWAev1Ee24iC/MHmWvgS9ViBRmzjc0qadkcDM46J/8fk+7NbW/zeVLXQROiPDcBg8CHNDVaNBQ47QZIdt9cV9dp3L/TDvwhWe2Zi5ie4j47ALBrxr4MLR2ia3iCsouNyTfokLVlJ3spK7U0Jjhu949iibSc2swm+7sze1EaFz5iAgCoZPNlBfWO5aBJryxeVi7wkACaGMXJQxf94W+7exlP9HZ8fDKqltBoJmvqPBZVIVIeKYrDdM181/3ve1nqVllppd/I1bhZDA+NTbc9sy8HBVvdz7GeI3709O+0vu7HVyCOY+5iA7Oke4BBX9aKkO3M+qQ5A94AyJ7AmTPFrNMOaaER4H6DKooQCMzYRG+5SdaTDuoVZ03baHYpHSQQYoIaOfAptM7+XVa1oOGy9BwVek8zCyM3tkUsYHApJxTPLwcKqs6LTj5aeF5UnM5OdVedkxI5RlBhrXhLC0FNyEQ4h9GgVcVgsaCIHERy3Yn+XYnZ74K+DG/UlbhEb5RsyfijPxk+cAbtQTtG2IcSzXcgMcOAXuxSH4z398kn8U4DGtHcZegDxg6oMh/yqRXMaMxKF4sOxHHrKytcyvKAB/mlRhsVWHvR3EBB0C9mnOzT7Idwq6zNI0bC5tQ/UXbqfYLCjUvcVFFWI5H3NdxKNcSnS/QZfUuBZTLJxw70zVNKWF2u82LHbGHYjKEQdZdnY0Ik8A/jvpYadQw84OYY3eztTjG4V7p3J45fDWSyjVwYN6sJSJL7SHHzkuxebr2RckRR91JhS9pHnfZ/1SP54zAEp1kMyoUy8EZbD6qVjGO/elh7fzy2V+9Cv+JVWGOc5IiVSNXxtH/6YRvSh0sqp6nEMd3LSFdf47iKY4qmFMTyC/K30gippRIBMVTcxQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b46af6-249b-47ae-559b-08d88feb196d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:05:18.0832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pb3vWAAK3M8smpkFSx1Ip/flyucRna2TPFYtWgGrDvKgT2DPnXNwPCq46+/AcbB9JKllygpGLtKDzWsxXIMTcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1882
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDExLzI1LzIwIDU6NDIgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMjEuMTEu
MjAgdW0gMDY6MjEgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4gSXQncyBuZWVkZWQgdG8g
ZHJvcCBpb21tdSBiYWNrZWQgcGFnZXMgb24gZGV2aWNlIHVucGx1Zwo+PiBiZWZvcmUgZGV2aWNl
J3MgSU9NTVUgZ3JvdXAgaXMgcmVsZWFzZWQuCj4KPiBJdCB3b3VsZCBiZSBjbGVhbmVyIGlmIHdl
IGNvdWxkIGRvIHRoZSB3aG9sZSBoYW5kbGluZyBpbiBUVE0uIEkgYWxzbyBuZWVkIHRvIAo+IGRv
dWJsZSBjaGVjayB3aGF0IHlvdSBhcmUgZG9pbmcgd2l0aCB0aGlzIGZ1bmN0aW9uLgo+Cj4gQ2hy
aXN0aWFuLgoKCkNoZWNrIHBhdGNoICJkcm0vYW1kZ3B1OiBSZWdpc3RlciBJT01NVSB0b3BvbG9n
eSBub3RpZmllciBwZXIgZGV2aWNlLiIgdG8gc2VlCmhvdyBpIHVzZSBpdC4gSSBkb24ndCBzZWUg
d2h5IHRoaXMgc2hvdWxkIGdvIGludG8gVFRNIG1pZC1sYXllciAtIHRoZSBzdHVmZiBJIGRvIApp
bnNpZGUKaXMgdmVuZG9yIHNwZWNpZmljIGFuZCBhbHNvIEkgZG9uJ3QgdGhpbmsgVFRNIGlzIGV4
cGxpY2l0bHkgYXdhcmUgb2YgSU9NTVUgPwpEbyB5b3UgbWVhbiB5b3UgcHJlZmVyIHRoZSBJT01N
VSBub3RpZmllciB0byBiZSByZWdpc3RlcmVkIGZyb20gd2l0aGluIFRUTQphbmQgdGhlbiB1c2Ug
YSBob29rIHRvIGNhbGwgaW50byB2ZW5kb3Igc3BlY2lmaWMgaGFuZGxlciA/CgpBbmRyZXkKCgo+
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNr
eUBhbWQuY29tPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYyB8IDEg
Kwo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90
dC5jCj4+IGluZGV4IDFjY2YxZWYuLjI5MjQ4YTUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX3R0LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYwo+
PiBAQCAtNDk1LDMgKzQ5NSw0IEBAIHZvaWQgdHRtX3R0X3VucG9wdWxhdGUoc3RydWN0IHR0bV90
dCAqdHRtKQo+PiDCoMKgwqDCoMKgIGVsc2UKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHR0bV9wb29s
X3VucG9wdWxhdGUodHRtKTsKPj4gwqAgfQo+PiArRVhQT1JUX1NZTUJPTCh0dG1fdHRfdW5wb3B1
bGF0ZSk7Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
