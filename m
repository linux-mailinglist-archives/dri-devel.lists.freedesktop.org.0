Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4572C169A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 21:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCAF46E0B6;
	Mon, 23 Nov 2020 20:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 933BD6E0B6;
 Mon, 23 Nov 2020 20:38:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KToMHI2VqVKP5giaKa6lS4u/Jyeo3rnA8dUFhEAkHWXtnqQoIX5BSbc1nIYQCScuTcEAZLH9Y4WG8urt/WER/D5MWlkeiWlMG2f5NueC6WlndjD0nZo6mpUxhbMp5WEteD6PS9lR74+kV44CiFIdjFHbO9TSWRX+dI7kpDsRSdZTJ3g13UvpsnMVRqRzRalOakArtry52lWfr6hEz+Xor68u6SX9y6pADJzPSA0k4GbQSkuXm7oYebvYe9Ss9Bw/MCBFaG/CRYWpotxmcZjDeXUYmponDLowOEhbQjn6rbrVYxdGULZkJkrsYUXyk3dC8AglT/OOSrwKYMcxGmGdyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcC3/sF6lLrU4FU3N0/fH+Xmfg/5+PF+YXKPCC5QKtA=;
 b=Eqtdtzxn1EJEIwzv8gC6OZh8gIbIEO7DIQPZKJbuFs140j96/5gBL4ECDaUf5GXqtPOJsRBkTCFMIjxdcHEgfwmw3Z447AZFxXvHZK41FUaA/4bANsac4PvzrtkgA6u56ayWYKlikyjXkLQEnVg4Oa13YBrdTm68V3mhY3MKH322a+cHlHaL9j7xbu9x/8a9v9iDPnvAZJXGnw4BbzmSzu28BkldzTMoAHyZfoScEqlFF/Fg80xHBgL8oL+vH6HK8qCgNKjBiK7dDJzGgzHpifDWcElWZfJ3IUNZ1J/owhre/OjcZYtD0qVR3JbLbpXTo8btrXIP8z/8gDq0XJzCWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcC3/sF6lLrU4FU3N0/fH+Xmfg/5+PF+YXKPCC5QKtA=;
 b=bzLFEBEYdLveGXzir8vEPb3H7/e3hWTD31gr9aUyvAhlKKStnV2aUkXLlxOHLhqVFtr71zP5/n3Ak4p/NIe7Dtkpp6dCvyu8Xz5fB0/I5AAZUIKHIW/YDVoUfY6pQEJ3U0wp1nZ6bS38nJaiMH978eVrYRohcemiJjlW9nL7ti4=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM5PR12MB2486.namprd12.prod.outlook.com (2603:10b6:4:b2::32) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.25; Mon, 23 Nov 2020 20:38:22 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3589.022; Mon, 23 Nov 2020
 20:38:22 +0000
Subject: Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
To: christian.koenig@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch, robh@kernel.org,
 l.stach@pengutronix.de, yuq825@gmail.com, eric@anholt.net
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-6-git-send-email-andrey.grodzovsky@amd.com>
 <28332cf0-612c-10bd-c64e-fff6e1f18653@gmail.com>
 <320ff94c-78f4-b9a5-4c6f-40f7ce162bd3@amd.com>
 <41b35672-2dd6-13e2-8383-c65279fdb648@gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <e2f4f1dc-2a2a-face-87b2-6d61ed7d3305@amd.com>
Date: Mon, 23 Nov 2020 15:38:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <41b35672-2dd6-13e2-8383-c65279fdb648@gmail.com>
Content-Language: en-US
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: CH2PR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:610:20::32) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.231.243] (165.204.55.251) by
 CH2PR07CA0019.namprd07.prod.outlook.com (2603:10b6:610:20::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 20:38:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e238ec19-6214-4442-ba9a-08d88fefb84b
X-MS-TrafficTypeDiagnostic: DM5PR12MB2486:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB2486C9551794E57FDBABEAEBEAFC0@DM5PR12MB2486.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o9NJt1q6T6NVxsGzPPAEkjHHrH3JTbRHoGlSaj3mYgiAYoEVT0mNSFi2ybyOhOkQqRcEVaOqGLcEW43Q+n3FdcLRKthqyAoD/MF2gllfWx64imDR9NEpfXFAO8yFW7mJLsH5m4060zy4sIt+2z+kZrVlH/I/Lsd79LXal/PALsPcUoXOFlfkIACxt2AggCuE88gwZmOBAibGbuca7tHvA2yaStUiNuMdtVx/9P2a0SGGJmWcFtxRxbe4SHY0zHS2SLhsPJVKs69A43Rqg6EF8k91HRKgVMPKM5bvmN/iNCUQQ2Vby3f4G2ACaffF+Axj4hHJSIWnoUp0hdlaBZt7F7weDRQR2dzvyHzPiTJwF6v3yBRiPtzDInFl+2q49fHBqE9iMk+lV4OBE20PgZWZEAi1N46t20kVJsN6pUoCwbM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(31696002)(36756003)(4326008)(2906002)(86362001)(66556008)(66476007)(316002)(16526019)(186003)(26005)(66946007)(16576012)(5660300002)(6486002)(2616005)(956004)(966005)(478600001)(45080400002)(8936002)(53546011)(8676002)(52116002)(31686004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Xzacc14Wo33955HKGPGypu206MyaygGDVzfBNaGq/Ql73Js62ZR2lJeo8jP7yR1c8MRrjxJhAe3XRu3zxlO2n3fxVfgZdaK4ynJvoLIqKvC/rRgEX1k7Qy0pqJopXScUBoe0O8A+gczmh5S8BEqAZH4btjMW0UG1Vq5QB4Kx71rq2ETFA24VvMGiKKvijwSPpVbAeeMBAKaxMqbE0jV+kbPgcVqSgOcRHtoLn53gihrdPk52O7F3Z4qX7FPP9+UL/3vPDXm2Lf9dJwrJDxjrFD7UlTL/sx3sKCvbfjbdZL21JX+yv+clneF7WOLY4+qERGg+M8f+96YA8ohxCUjsIRhU+veiO0P7KcwhjCU7OsUzMEkDa6e4nemt4GhAlQvJTnmREWD8Z2s/26BpedpBJIwfCJoctyvA6SeWiBeH9+5Yeh51tRK7jmlUur+gqCZDDPLAKAqBqhBeL5upi8TVn4N/esjoNtPdXmnuYvJ3JZWslRCsv6mHXM30Hk8m95tTehQYwB4oKGCqI40Qme1FpQ1HJn42yQS+CGDEVoAQWwPHvlodHlzATPlOQQOCDbFEZseWhIJfsP5pi1IjMxcVvq8BXbsq24A0TiSROGIDYxMaLRFPu45Px+diNKxp2rRAy1cR6o6p+VQeKBFMyw0C46wdvSwxEO9FRUhufoRqGiXSjRzhxDiA2Q5SE0TuMdfd1CEMQYqQzfAFl+vkHf6tCK5oZBzpy1rYSGEs45ckW5ye2Mx00XxxhHc/+pQp/tMAMN7QM7cl1hvThj/J/yFEpvXSn5xDtPb1SeOhuvXxydUegIj5PYhmr4183m46kU6kHCGCKnRX/cJ67/ip8/m4WxJH663q2GCrf/sUzzqZabjhDVV1C5NyIfT1H6gbh+AD4MRFirQLbEMAvXQUZWD0jg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e238ec19-6214-4442-ba9a-08d88fefb84b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:38:22.5697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ofE6T0tyvjvqTwDTX7rLSEvF+av7GZTpXVd/vAyo5S3cHp/Ke3B+IIpproFB7kYq5zyotoH33eau9NKDpIy/7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2486
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

Ck9uIDExLzIzLzIwIDM6MjAgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMjMuMTEu
MjAgdW0gMjE6MDUgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4KPj4gT24gMTEvMjUvMjAg
NTo0MiBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+IEFtIDIxLjExLjIwIHVtIDA2OjIx
IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4gSXQncyBuZWVkZWQgdG8gZHJvcCBpb21t
dSBiYWNrZWQgcGFnZXMgb24gZGV2aWNlIHVucGx1Zwo+Pj4+IGJlZm9yZSBkZXZpY2UncyBJT01N
VSBncm91cCBpcyByZWxlYXNlZC4KPj4+Cj4+PiBJdCB3b3VsZCBiZSBjbGVhbmVyIGlmIHdlIGNv
dWxkIGRvIHRoZSB3aG9sZSBoYW5kbGluZyBpbiBUVE0uIEkgYWxzbyBuZWVkIHRvIAo+Pj4gZG91
YmxlIGNoZWNrIHdoYXQgeW91IGFyZSBkb2luZyB3aXRoIHRoaXMgZnVuY3Rpb24uCj4+Pgo+Pj4g
Q2hyaXN0aWFuLgo+Pgo+Pgo+PiBDaGVjayBwYXRjaCAiZHJtL2FtZGdwdTogUmVnaXN0ZXIgSU9N
TVUgdG9wb2xvZ3kgbm90aWZpZXIgcGVyIGRldmljZS4iIHRvIHNlZQo+PiBob3cgaSB1c2UgaXQu
IEkgZG9uJ3Qgc2VlIHdoeSB0aGlzIHNob3VsZCBnbyBpbnRvIFRUTSBtaWQtbGF5ZXIgLSB0aGUg
c3R1ZmYgSSAKPj4gZG8gaW5zaWRlCj4+IGlzIHZlbmRvciBzcGVjaWZpYyBhbmQgYWxzbyBJIGRv
bid0IHRoaW5rIFRUTSBpcyBleHBsaWNpdGx5IGF3YXJlIG9mIElPTU1VID8KPj4gRG8geW91IG1l
YW4geW91IHByZWZlciB0aGUgSU9NTVUgbm90aWZpZXIgdG8gYmUgcmVnaXN0ZXJlZCBmcm9tIHdp
dGhpbiBUVE0KPj4gYW5kIHRoZW4gdXNlIGEgaG9vayB0byBjYWxsIGludG8gdmVuZG9yIHNwZWNp
ZmljIGhhbmRsZXIgPwo+Cj4gTm8sIHRoYXQgaXMgcmVhbGx5IHZlbmRvciBzcGVjaWZpYy4KPgo+
IFdoYXQgSSBtZWFudCBpcyB0byBoYXZlIGEgZnVuY3Rpb24gbGlrZSB0dG1fcmVzb3VyY2VfbWFu
YWdlcl9ldmljdF9hbGwoKSB3aGljaCAKPiB5b3Ugb25seSBuZWVkIHRvIGNhbGwgYW5kIGFsbCB0
dCBvYmplY3RzIGFyZSB1bnBvcHVsYXRlZC4KCgpTbyBpbnN0ZWFkIG9mIHRoaXMgQk8gbGlzdCBp
IGNyZWF0ZSBhbmQgbGF0ZXIgaXRlcmF0ZSBpbiBhbWRncHUgZnJvbSB0aGUgSU9NTVUgCnBhdGNo
IHlvdSBqdXN0IHdhbnQgdG8gZG8gaXQgd2l0aGluClRUTSB3aXRoIGEgc2luZ2xlIGZ1bmN0aW9u
ID8gTWFrZXMgbXVjaCBtb3JlIHNlbnNlLgoKQW5kcmV5CgoKPgo+IEdpdmUgbWUgYSBkYXkgb3Ig
dHdvIHRvIGxvb2sgaW50byB0aGlzLgo+Cj4gQ2hyaXN0aWFuLgo+Cj4+Cj4+IEFuZHJleQo+Pgo+
Pgo+Pj4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXku
Z3JvZHpvdnNreUBhbWQuY29tPgo+Pj4+IC0tLQo+Pj4+IMKgIGRyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX3R0LmMgfCAxICsKPj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4+
Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fdHQuYwo+Pj4+IGluZGV4IDFjY2YxZWYuLjI5MjQ4YTUgMTAwNjQ0
Cj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYwo+Pj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX3R0LmMKPj4+PiBAQCAtNDk1LDMgKzQ5NSw0IEBAIHZvaWQgdHRt
X3R0X3VucG9wdWxhdGUoc3RydWN0IHR0bV90dCAqdHRtKQo+Pj4+IMKgwqDCoMKgwqAgZWxzZQo+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB0dG1fcG9vbF91bnBvcHVsYXRlKHR0bSk7Cj4+Pj4gwqAg
fQo+Pj4+ICtFWFBPUlRfU1lNQk9MKHR0bV90dF91bnBvcHVsYXRlKTsKPj4+Cj4+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGFtZC1nZnggbWFpbGlu
ZyBsaXN0Cj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0dHBzOi8vbmFtMTEu
c2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxpc3Rz
LmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmFtZC1nZngmYW1wO2RhdGE9
MDQlN0MwMSU3Q0FuZHJleS5Hcm9kem92c2t5JTQwYW1kLmNvbSU3QzliZTAyOWYyNmE0NzQ2MzQ3
YTYxMDhkODhmZWQyOTliJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdD
MCU3QzYzNzQxNzU5NjA2NTU1OTk1NSU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1D
NHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0Ql
N0MxMDAwJmFtcDtzZGF0YT10WjNkbyUyRmVLekJ0UmxOYUZiQmpDdFJ2VUhLZHZ3RFo3U29ZaEVC
dTQlMkJUOCUzRCZhbXA7cmVzZXJ2ZWQ9MCAKPj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
