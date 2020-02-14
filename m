Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE6915D6F7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 12:53:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5F66E5C6;
	Fri, 14 Feb 2020 11:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700067.outbound.protection.outlook.com [40.107.70.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3C26E5C6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 11:53:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JkDF+uCOZ/rvk7OOi4VF+HDQVPPqhcOeomKVXH0M2EQuGx4cONp/ixVHtJddM5guMIwkOSW1ecdT5/rzQRDiAMoiGaq0MNpEzgQ3r9QZXBDqjZHmvB0IEKdRwN8k6B5HaVRl5Wi0IceJff+6C3TzMdvbuBkcssS2XVtTPWVj22cCMIGZBRhzNif/IF4D5p0j/r+STZ0AkZ408dNwnMl3AFFgQSwdgdd9dZ0uOS7UVqAYitFyo5g6nb5eq9Tg78wghhrcngr/PVjzwwyxhrLoXv+LMtsYbJ58ncddByoj+lpKu/jKm5hc0dT1kS6Q5XXPfjXuGl+9ZjQNSQtIJxVbPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBnWtSlpzwN4RaJzr8Ff6ODtdfcA73yKJI9wESQ0k7Y=;
 b=OLOhumsRs5gZxuL1pGT1qhqBYZ8/d2wIV7JrtfeJr0uZ/qVfM888MpfiJ84ni3QKSZXd3A9mxyLztWAEtBZbGN6c2jdvobNBMlejP7oY9/9Q4k1aVZr8oSbGwZuufURxfhtH6P8XrsnN8G07RyGOjk/ujii820NXMVzvpO/MZ2mkYcp+9YJoB5r6aOLSiyUWehxvQgArHixSdujfdNrZWaZ59z3B6B8unhjaBCRLa6dfz46ShMspMcnT/ifxhuKlYcBj+8jdgGi8dWWK9lakoyRatpSzJtq75X8sGCiMDPQJBC4D06u7nqaO7Nhgly12yzZs0ryYU+FuhriCQTYtRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBnWtSlpzwN4RaJzr8Ff6ODtdfcA73yKJI9wESQ0k7Y=;
 b=h7mbAnS9VBNwfLW9bBBx+b6jv43yxbsiBuciHAXZWMvSlgkQvDQweZc6bUy5Sn88wscg7zkaeOx0JugTCQaq5wyUx5kxC3g8wraBp8d8zKRuwHcOFk4nkVW39155rFYwLz753SIQfP6sI/zHtOFjOhuQcv7OTVG38W8vK0fgO/w=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nirmoy.Das@amd.com; 
Received: from DM5PR12MB2376.namprd12.prod.outlook.com (52.132.143.139) by
 DM5PR12MB2440.namprd12.prod.outlook.com (52.132.142.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Fri, 14 Feb 2020 11:53:09 +0000
Received: from DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::c06c:24da:d4c5:5ee3]) by DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::c06c:24da:d4c5:5ee3%6]) with mapi id 15.20.2729.024; Fri, 14 Feb 2020
 11:53:09 +0000
Subject: Re: [RFC PATCH 5/6] drm/qxl: don't use ttm bo->offset
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20200213120203.29368-1-nirmoy.das@amd.com>
 <20200213120203.29368-6-nirmoy.das@amd.com>
 <20200213143053.tkbfd6wr5rbspzty@sirius.home.kraxel.org>
 <013434ab-b7a0-b703-bf5a-51e2873e268a@amd.com>
 <20200214090856.46tmxbyukqwqitkx@sirius.home.kraxel.org>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <d9b1db92-7172-a55d-f04d-941f31687ecf@amd.com>
Date: Fri, 14 Feb 2020 12:55:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
In-Reply-To: <20200214090856.46tmxbyukqwqitkx@sirius.home.kraxel.org>
Content-Language: en-US
X-ClientProxiedBy: FRYP281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::18)
 To DM5PR12MB2376.namprd12.prod.outlook.com
 (2603:10b6:4:b9::11)
MIME-Version: 1.0
Received: from [IPv6:2003:c5:8f2a:a600:4a84:7cc6:5ea4:121a]
 (2003:c5:8f2a:a600:4a84:7cc6:5ea4:121a) by
 FRYP281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.24 via Frontend Transport; Fri, 14 Feb 2020 11:53:08 +0000
X-Originating-IP: [2003:c5:8f2a:a600:4a84:7cc6:5ea4:121a]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bdf67588-1688-46a0-15fa-08d7b1447623
X-MS-TrafficTypeDiagnostic: DM5PR12MB2440:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2440C67E643688156484F8738B150@DM5PR12MB2440.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:30;
X-Forefront-PRVS: 03137AC81E
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(136003)(366004)(396003)(376002)(346002)(189003)(199004)(16526019)(186003)(53546011)(2616005)(52116002)(8936002)(81156014)(8676002)(81166006)(316002)(66476007)(66556008)(478600001)(31696002)(6916009)(5660300002)(66946007)(4326008)(6666004)(31686004)(6486002)(2906002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2440;
 H:DM5PR12MB2376.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lEUN+GUHrJUv5/OKTEwEd2HGb60Tk/pVeHa4PfWDOFdlzhnXvDSFqgDvF1i2ootLqxf2c5PUTPL1HT/GdB/8bm6qClXLPANvz5xoU0CUoxMpm+bz6nxomZY+AqoxO6Ql8g2dYrPD86oeS8NQ219j3UDML2H9HG9mAApmgpfoGLT8ieS9bb3KCgJaSzMeOoiK+HZoBo1tIkNCBn8bEXo27jTKQgXzFSUWSmP7HhWoq1JhjKFm9m9TFkeF2XxJrXu+AiCC1NZbrTzLusDZFl5tq+KW0fiDS7H0xluiS4x+LSHkEuHbp0ow1u3dtW3IhozSRl6wxEBrN4rBlZeklVqpNup/ZIrSUeEUb+OcHd3iGHMEMzlv258NhBg3/nfCYyISmXhwIwnhqMtfktjRrP3I2FBL40LGWSvzNLPP5RT+7rGlNiIgqEeO8+3ztVXpx089
X-MS-Exchange-AntiSpam-MessageData: z/EfCNnXOgLvFPPgem5pr9hYroqvQAgCsBYA0Nkj/u9sV9/7LK3VCWkdvGnvU5SkZxyY1pJ4KmQ0DjYmS1yHHcdQYMVU/39cOz3Jqgyz2bLIubYbnHKHI2F8/BuwppjebrHpiXsVZ6CFfUIlmB5zCXxKQ0J40i4Af34AI3Ohh+EMKKXHA+1ATTATr0D/CM7wIiZTkh9vFCdsVRZTT0teXQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf67588-1688-46a0-15fa-08d7b1447623
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2020 11:53:09.6326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y7ivOmv/1PQXTeNsW/cR9Qmiy42wVLHKDsDrLFnpKqst5XLwsVWwqAhSFRAxfO+FgCe6Y4bQz5rErmGH08jhlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2440
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIvMTQvMjAgMTA6MDggQU0sIEdlcmQgSG9mZm1hbm4gd3JvdGU6Cj4+IC3CoMKgwqDCoMKg
wqAgaWYgKGJvLT5tZW0ubW1fbm9kZSkKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Ym8tPm9mZnNldCA9IChiby0+bWVtLnN0YXJ0IDw8IFBBR0VfU0hJRlQpICsKPj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiZGV2LT5tYW5bYm8tPm1lbS5tZW1fdHlwZV0u
Z3B1X29mZnNldDsKPj4gLcKgwqDCoMKgwqDCoCBlbHNlCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGJvLT5vZmZzZXQgPSAwOwo+PiAtCj4+Cj4+Cj4+IE15IGFzc3VtcHRpb24gaXMK
Pj4KPj4gICAoYm8tPnRiby5vZmZzZXQgLSBzbG90LT5ncHVfb2Zmc2V0ICsgb2Zmc2V0KSA9PSAo
Ym8tPnRiby5tZW0uc3RhcnQgPDwgUEFHRV9TSElGVCkgKyBiZGV2LT5tYW5bYm8tPm1lbS5tZW1f
dHlwZV0uZ3B1X29mZnNldCAtIHNsb3QtPmdwdV9vZmZzZXQgKyBvZmZzZXQpCj4+Cj4+IC0+ID09
IChiby0+dGJvLm1lbS5zdGFydCA8PCBQQUdFX1NISUZUKSArIG9mZnNldAo+IFRoYXQgbG9va3Mg
YmV0dGVyLgpUaGFua3MsIEkgd2lsbCB1c2UgdGhhdC4KPgo+PiBhbmQgd2UgbG9vc2XCoCBzbG90
LT5ncHVfb2Zmc2V0IHNvIEkgdGhvdWdodCBpdCBzaG91bGQgYmUKPj4KPj4gKChiby0+dGJvLm1l
bS5zdGFydCA8PCBQQUdFX1NISUZUKSArIHNsb3QtPmdwdV9vZmZzZXQgKyBvZmZzZXQpOwo+IE5v
LgoKWWVzwqAgdGhpcyBkb2Vzbid0IHdvcmssIHFlbXUgdGhyb3dzIGJ1bmNoIG9mIHdhcm5pbmdz
LiAodGVzdGVkIHdpdGhvdXQgCkdVSSwgbW9kcHJvYmUgcXhsKQoKW8KgwqAgMTAuNjkxNTA2XSBb
ZHJtXSBEZXZpY2UgVmVyc2lvbiAwLjAKW8KgwqAgMTAuNjkxNjE4XSBbZHJtXSBDb21wcmVzc2lv
biBsZXZlbCAwIGxvZyBsZXZlbCAwClvCoMKgIDEwLjY5MTc1OV0gW2RybV0gMTIyODYgaW8gcGFn
ZXMgYXQgb2Zmc2V0IDB4MTAwMDAwMApbwqDCoCAxMC42OTE4OTddIFtkcm1dIDE2Nzc3MjE2IGJ5
dGUgZHJhdyBhcmVhIGF0IG9mZnNldCAweDAKW8KgwqAgMTAuNjkyMDQzXSBbZHJtXSBSQU0gaGVh
ZGVyIG9mZnNldDogMHgzZmZlMDAwClvCoMKgIDEwLjY5NDgyM10gW1RUTV0gWm9uZcKgIGtlcm5l
bDogQXZhaWxhYmxlIGdyYXBoaWNzIG1lbW9yeTogMjQwNzU2IEtpQgpbwqDCoCAxMC42OTUwNTVd
IFtUVE1dIEluaXRpYWxpemluZyBwb29sIGFsbG9jYXRvcgpbwqDCoCAxMC42OTUyOTRdIFtUVE1d
IEluaXRpYWxpemluZyBETUEgcG9vbCBhbGxvY2F0b3IKW8KgwqAgMTAuNjk1ODA3XSBbZHJtXSBx
eGw6IDE2TSBvZiBWUkFNIG1lbW9yeSBzaXplClvCoMKgIDEwLjY5NTkzM10gW2RybV0gcXhsOiA2
M00gb2YgSU8gcGFnZXMgbWVtb3J5IHJlYWR5IChWUkFNIGRvbWFpbikKW8KgwqAgMTAuNjk2MDkz
XSBbZHJtXSBxeGw6IDY0TSBvZiBTdXJmYWNlIG1lbW9yeSBzaXplClvCoMKgIDEwLjY5OTk2OV0g
W2RybV0gc2xvdCAwIChtYWluKTogYmFzZSAweGY0MDAwMDAwLCBzaXplIDB4MDNmZmUwMDAsIApn
cHVfb2Zmc2V0IDB4MApbwqDCoCAxMC43MDAzMTldIFtkcm1dIHNsb3QgMSAoc3VyZmFjZXMpOiBi
YXNlIDB4ZjgwMDAwMDAsIHNpemUgCjB4MDQwMDAwMDAsIGdwdV9vZmZzZXQgMHgxMDAwMDAwMDAw
MApbwqDCoCAxMC43MDc4NDJdIFtkcm1dIEluaXRpYWxpemVkIHF4bCAwLjEuMCAyMDEyMDExNyBm
b3IgMDAwMDowMDowMi4wIG9uIAptaW5vciAwCmlkIDAsIGdyb3VwIDAsIHZpcnQgc3RhcnQgMCwg
dmlydCBlbmQgZmZmZmZmZmZmZmZmZmZmZiwgZ2VuZXJhdGlvbiAwLCAKZGVsdGEgMAppZCAxLCBn
cm91cCAxLCB2aXJ0IHN0YXJ0IDdmMzI5ZjQwMDAwMCwgdmlydCBlbmQgN2YzMmEzM2ZlMDAwLCAK
Z2VuZXJhdGlvbiAwLCBkZWx0YSA3ZjMyOWY0MDAwMDAKaWQgMiwgZ3JvdXAgMSwgdmlydCBzdGFy
dCA3ZjMyOWIwMDAwMDAsIHZpcnQgZW5kIDdmMzI5ZjAwMDAwMCwgCmdlbmVyYXRpb24gMCwgZGVs
dGEgN2YzMjliMDAwMDAwCnFlbXUtc3lzdGVtLXg4Nl82NDogd2FybmluZzogU3BpY2U6IG1lbXNs
b3QuYzo2NDptZW1zbG90X3ZhbGlkYXRlX3ZpcnQ6IAp2aXJ0dWFsIGFkZHJlc3Mgb3V0IG9mIHJh
bmdlwqDCoMKgIHZpcnQ9MHg4MDMyOWIzMDAwMDArMHg0MDAwIHNsb3RfaWQ9MiAKZ3JvdXBfaWQ9
MQogwqDCoMKgIHNsb3Q9MHg3ZjMyOWIwMDAwMDAtMHg3ZjMyOWYwMDAwMDAgZGVsdGE9MHg3ZjMy
OWIwMDAwMDAKcWVtdS1zeXN0ZW0teDg2XzY0OiB3YXJuaW5nOiBTcGljZTogCmRpc3BsYXktY2hh
bm5lbC5jOjI0Mzc6ZGlzcGxheV9jaGFubmVsX3ZhbGlkYXRlX3N1cmZhY2U6IGNhbnZhcyBhZGRy
ZXNzIAppcyAweDdmMzJkOTg5ZWIxOCBmb3IgMCAoYW5kIGlzIE5VTEwpCnFlbXUtc3lzdGVtLXg4
Nl82NDogd2FybmluZzogU3BpY2U6IApkaXNwbGF5LWNoYW5uZWwuYzoyNDM5OmRpc3BsYXlfY2hh
bm5lbF92YWxpZGF0ZV9zdXJmYWNlOiBmYWlsZWQgb24gMApxZW11LXN5c3RlbS14ODZfNjQ6IHdh
cm5pbmc6IFNwaWNlOiAKZGlzcGxheS1jaGFubmVsLmM6MjQzNzpkaXNwbGF5X2NoYW5uZWxfdmFs
aWRhdGVfc3VyZmFjZTogY2FudmFzIGFkZHJlc3MgCmlzIDB4N2YzMmQ5ODllYjE4IGZvciAwIChh
bmQgaXMgTlVMTCkKcWVtdS1zeXN0ZW0teDg2XzY0OiB3YXJuaW5nOiBTcGljZTogCmRpc3BsYXkt
Y2hhbm5lbC5jOjI0Mzk6ZGlzcGxheV9jaGFubmVsX3ZhbGlkYXRlX3N1cmZhY2U6IGZhaWxlZCBv
biAwCnFlbXUtc3lzdGVtLXg4Nl82NDogd2FybmluZzogU3BpY2U6IApkaXNwbGF5LWNoYW5uZWwu
YzoyNDM3OmRpc3BsYXlfY2hhbm5lbF92YWxpZGF0ZV9zdXJmYWNlOiBjYW52YXMgYWRkcmVzcyAK
aXMgMHg3ZjMyZDk4OWViMTggZm9yIDAgKGFuZCBpcyBOVUxMKQpxZW11LXN5c3RlbS14ODZfNjQ6
IHdhcm5pbmc6IFNwaWNlOiAKZGlzcGxheS1jaGFubmVsLmM6MjQzOTpkaXNwbGF5X2NoYW5uZWxf
dmFsaWRhdGVfc3VyZmFjZTogZmFpbGVkIG9uIDAKcWVtdS1zeXN0ZW0teDg2XzY0OiB3YXJuaW5n
OiBTcGljZTogCnJlZC13b3JrZXIuYzo0Njg6ZGVzdHJveV9wcmltYXJ5X3N1cmZhY2U6IGRvdWJs
ZSBkZXN0cm95IG9mIHByaW1hcnkgc3VyZmFjZQppZCAwLCBncm91cCAwLCB2aXJ0IHN0YXJ0IDAs
IHZpcnQgZW5kIGZmZmZmZmZmZmZmZmZmZmYsIGdlbmVyYXRpb24gMCwgCmRlbHRhIDAKaWQgMSwg
Z3JvdXAgMSwgdmlydCBzdGFydCA3ZjMyOWY0MDAwMDAsIHZpcnQgZW5kIDdmMzJhMzNmZTAwMCwg
CmdlbmVyYXRpb24gMCwgZGVsdGEgN2YzMjlmNDAwMDAwCmlkIDIsIGdyb3VwIDEsIHZpcnQgc3Rh
cnQgN2YzMjliMDAwMDAwLCB2aXJ0IGVuZCA3ZjMyOWYwMDAwMDAsIApnZW5lcmF0aW9uIDAsIGRl
bHRhIDdmMzI5YjAwMDAwMApxZW11LXN5c3RlbS14ODZfNjQ6IHdhcm5pbmc6IFNwaWNlOiBtZW1z
bG90LmM6NjQ6bWVtc2xvdF92YWxpZGF0ZV92aXJ0OiAKdmlydHVhbCBhZGRyZXNzIG91dCBvZiBy
YW5nZcKgwqDCoCB2aXJ0PTB4ODAzMjliMzA0MDAwKzB4MzAwMDAwIHNsb3RfaWQ9MiAKZ3JvdXBf
aWQ9MQogwqDCoMKgIHNsb3Q9MHg3ZjMyOWIwMDAwMDAtMHg3ZjMyOWYwMDAwMDAgZGVsdGE9MHg3
ZjMyOWIwMDAwMDAKcWVtdS1zeXN0ZW0teDg2XzY0OiB3YXJuaW5nOiBTcGljZTogCmRpc3BsYXkt
Y2hhbm5lbC5jOjI0Mzc6ZGlzcGxheV9jaGFubmVsX3ZhbGlkYXRlX3N1cmZhY2U6IGNhbnZhcyBh
ZGRyZXNzIAppcyAweDdmMzJkOTg5ZWIxOCBmb3IgMCAoYW5kIGlzIE5VTEwpCnFlbXUtc3lzdGVt
LXg4Nl82NDogd2FybmluZzogU3BpY2U6IApkaXNwbGF5LWNoYW5uZWwuYzoyNDM5OmRpc3BsYXlf
Y2hhbm5lbF92YWxpZGF0ZV9zdXJmYWNlOiBmYWlsZWQgb24gMApbwqDCoCAxMC43MjM5MzldIGZi
Y29uOiBxeGxkcm1mYiAoZmIwKSBpcyBwcmltYXJ5IGRldmljZQpbwqDCoCAxMC43NDkyNDVdIENv
bnNvbGU6IHN3aXRjaGluZyB0byBjb2xvdXIgZnJhbWUgYnVmZmVyIGRldmljZSAxMjh4NDgKW8Kg
wqAgMTAuNzc1MDM4XSBxeGwgMDAwMDowMDowMi4wOiBmYjA6IHF4bGRybWZiIGZyYW1lIGJ1ZmZl
ciBkZXZpY2UKcWVtdS1zeXN0ZW0teDg2XzY0OiB3YXJuaW5nOiBTcGljZTogCmRpc3BsYXktY2hh
bm5lbC5jOjI0Mzc6ZGlzcGxheV9jaGFubmVsX3ZhbGlkYXRlX3N1cmZhY2U6IGNhbnZhcyBhZGRy
ZXNzIAppcyAweDdmMzJkOTg5ZWIxOCBmb3IgMCAoYW5kIGlzIE5VTEwpCnFlbXUtc3lzdGVtLXg4
Nl82NDogd2FybmluZzogU3BpY2U6IApkaXNwbGF5LWNoYW5uZWwuYzoyNDM5OmRpc3BsYXlfY2hh
bm5lbF92YWxpZGF0ZV9zdXJmYWNlOiBmYWlsZWQgb24gMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
