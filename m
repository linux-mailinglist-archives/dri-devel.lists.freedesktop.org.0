Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76ACE15C0AF
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 15:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED246F5F4;
	Thu, 13 Feb 2020 14:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD5C6F5F4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 14:50:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pkm+IXRqrr6p77NIDoA+TCwx+KGDoAbLKyBXkoG8bRA3xkkObj0U1dFUe+mwp9tKgpZTVYZL9/pLN+wVZSnPIhUF5Bcg0sHYt9J9SiGCG0UfG1G/zbIXy/DiAynDGSrrcw+A+Mig7b5TLwaobvLRFZYXT52jYRTx3a3bGhTw9fKnUtALWjeZA7Ncknr8xa/wrqAke4gfdpM4xIMbKz9rIKkeSKtFUmYheW/B40Ob/bhVcqaRuFxTrPa6oy8893MKxt6hUJDbzdDF59OR1LAn0R5Eo0RvbT9n3Xm0NGKaZgvgzGhcssSGA723kyXBvHd42GhGQIveEIEWiqPhDJJUxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbO4HywrSS6vUnSyJSV3reG0uy/BId6AwSaGifO32X0=;
 b=RzHt+ewoAE5R+p7MQcoalpbadwJzpazVB3tFpRUrX02MOFEfZPn3tyk4I320JhuitoK6K8CtMRPEBVnJ+kfuUZ5XQ9zkNAzHw9wPDFUyk7enC5SKGrSi6FV4/p8Lnovc1aNzFc6fNcpSh1eX3WYI3uQqRvosOdnzIAaB8BT4aC95svqidgwB+zOTparoz7BbpWq4UPPJfBHKPG+JgmQJOXT2vKEyNWuH8CMZoidObs453Q4ldMIi1sqwwCF6SRgD7YL2qRCRyGOWpa0idF0OQ3Z14HkQ2YYb9SrGfy1RCaayio3Zvj08X+AYGRckBOAW8bqdlKI9UE47qjuRYgqnow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbO4HywrSS6vUnSyJSV3reG0uy/BId6AwSaGifO32X0=;
 b=nyJWMDoplMUi6qmindGg6tVa6n+HjOu318jC1DjgR1LaQfFfdUq8bux/IExe9q0dU2L2XldJbxsEdh39nB1OvfKLjv5+XEr7JKF9tJobqs5/+kc+EPyUvikzBJf53sN5ifpyRBvtGYuvfcomfP8VBavZHEKAjUZMvlrJGieRR9Y=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nirmoy.Das@amd.com; 
Received: from DM5PR12MB2376.namprd12.prod.outlook.com (52.132.143.139) by
 DM5PR12MB1659.namprd12.prod.outlook.com (10.172.40.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Thu, 13 Feb 2020 14:50:24 +0000
Received: from DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::c06c:24da:d4c5:5ee3]) by DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::c06c:24da:d4c5:5ee3%6]) with mapi id 15.20.2729.024; Thu, 13 Feb 2020
 14:50:24 +0000
Subject: Re: [RFC PATCH 5/6] drm/qxl: don't use ttm bo->offset
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20200213120203.29368-1-nirmoy.das@amd.com>
 <20200213120203.29368-6-nirmoy.das@amd.com>
 <20200213143053.tkbfd6wr5rbspzty@sirius.home.kraxel.org>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <013434ab-b7a0-b703-bf5a-51e2873e268a@amd.com>
Date: Thu, 13 Feb 2020 15:52:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
In-Reply-To: <20200213143053.tkbfd6wr5rbspzty@sirius.home.kraxel.org>
Content-Language: en-US
X-ClientProxiedBy: FRYP281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::28)
 To DM5PR12MB2376.namprd12.prod.outlook.com
 (2603:10b6:4:b9::11)
MIME-Version: 1.0
Received: from [IPv6:2003:c5:8f2a:5e00:4db9:9f42:976e:8a13]
 (2003:c5:8f2a:5e00:4db9:9f42:976e:8a13) by
 FRYP281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22 via Frontend Transport; Thu, 13 Feb 2020 14:50:23 +0000
X-Originating-IP: [2003:c5:8f2a:5e00:4db9:9f42:976e:8a13]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3d0265d1-b8f2-4bf9-fc51-08d7b0940ead
X-MS-TrafficTypeDiagnostic: DM5PR12MB1659:
X-Microsoft-Antispam-PRVS: <DM5PR12MB165954E306C8475DBE3AFCE08B1A0@DM5PR12MB1659.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 031257FE13
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(199004)(189003)(66476007)(66556008)(66946007)(6916009)(31686004)(316002)(36756003)(53546011)(5660300002)(6486002)(8936002)(478600001)(2906002)(6666004)(8676002)(186003)(81156014)(2616005)(16526019)(81166006)(4326008)(31696002)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1659;
 H:DM5PR12MB2376.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1TZ4EUQ0TxbpqzU1LkKiu/Ko/0YwipqSgRpjj/O2sNuUiqf6lkMA0RmjJkvj3Ms1rzyZhyBZeE5sJhQdsL359ui+OBsWb5wH1pgdyhLGyBQyHEGxcXpkAjFAu4IC8iMRfQF21MCydo+rkQRHl67p+MTWB7LBmeLFZlwB8UlGUuwUMQHXCf2+vDZziUyPmmZhgzwzZ4acUmvAN/wP8zm6bWioxQC57ke/oPVrGpakDDPwcaifK5lLd2eyIO4V4l3EdNgm38ALN41pPOEVnkJFy3nOH5hni+Kf3f04o5wf3SlVIl/8vlm3SaIGR3HG2/uyfZtMsedRW5LZWkNvhbZhkCv3Nk9PCkFn/Y4ZLzGa43oxXQnRuarpEYfx2uQlK74EbXkJ5dK2A3O20PpbbpinwNeZQ2G2b/OyP2pzFd6Ar7rqgvDc8CXNK9HMwkDOZ++p
X-MS-Exchange-AntiSpam-MessageData: PSl3IZHQDW7BDrpnE6IB8wi8KTw+/vcQAwTUcio7dlgzXVyaQL4TDjSRKaCQlmZgBP+Xz3JVNdNY8iTH//fUY2d0g5BdC+2+V23hrTHLejX8bCiuBtBRbP6xxON/Ob5qZJoq/S7aLlexa9zkj7p7OLnHQX9168Y0cik6i/4XpP64oTpaYqVvJK8tpzQUIfL4tJcaDw+KiDucTnPu7FOfiw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d0265d1-b8f2-4bf9-fc51-08d7b0940ead
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2020 14:50:24.5355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kBtmzAlqD7SlkzCSz1QWdZAMzZJLbE0c8rWY91nAspINpjdM79j9PmC/dR2nD7eeR9rDPWAYZvcKmmk7v5JO7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1659
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

Ck9uIDIvMTMvMjAgMzozMCBQTSwgR2VyZCBIb2ZmbWFubiB3cm90ZToKPj4gQEAgLTMxMSwxMCAr
MzExLDggQEAgcXhsX2JvX3BoeXNpY2FsX2FkZHJlc3Moc3RydWN0IHF4bF9kZXZpY2UgKnFkZXYs
IHN0cnVjdCBxeGxfYm8gKmJvLAo+PiAgIAkJKGJvLT50Ym8ubWVtLm1lbV90eXBlID09IFRUTV9Q
TF9WUkFNKQo+PiAgIAkJPyAmcWRldi0+bWFpbl9zbG90IDogJnFkZXYtPnN1cmZhY2VzX3Nsb3Q7
Cj4+ICAgCj4+IC0JV0FSTl9PTl9PTkNFKChiby0+dGJvLm9mZnNldCAmIHNsb3QtPmdwdV9vZmZz
ZXQpICE9IHNsb3QtPmdwdV9vZmZzZXQpOwo+PiAtCj4+IC0JLyogVE9ETyAtIG5lZWQgdG8gaG9s
ZCBvbmUgb2YgdGhlIGxvY2tzIHRvIHJlYWQgdGJvLm9mZnNldCAqLwo+PiAtCXJldHVybiBzbG90
LT5oaWdoX2JpdHMgfCAoYm8tPnRiby5vZmZzZXQgLSBzbG90LT5ncHVfb2Zmc2V0ICsgb2Zmc2V0
KTsKPj4gKwlyZXR1cm4gc2xvdC0+aGlnaF9iaXRzIHwgKChiby0+dGJvLm1lbS5zdGFydCA8PCBQ
QUdFX1NISUZUKSArCj4+ICsJCQkJICBzbG90LT5ncHVfb2Zmc2V0ICsgb2Zmc2V0KTsKPj4gICB9
Cj4gLS12ZXJib3NlIHBsZWFzZS4KPgo+IEkgZG9uJ3QgZ2V0IHRoZSBsb2dpYyBiZWhpbmQgdGhp
cyBjaGFuZ2UuCgpIaSBHZXJkLAoKSSBib3Jyb3dlZCB0aGUgbG9naWMgZm9yIHJlbW92ZWQgdHRt
IHBhcnQKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYwppbmRleCAyMjkyMDVlNDk5ZGIuLjJjY2ZlYmMzYzlhMiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jCkBAIC0zODIsMTIgKzM4MSw2IEBAIHN0YXRpYyBpbnQgdHRtX2Jv
X2hhbmRsZV9tb3ZlX21lbShzdHJ1Y3QgCnR0bV9idWZmZXJfb2JqZWN0ICpibywKIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiby0+ZXZpY3RlZCA9IGZhbHNlOwogwqDCoMKgwqDCoMKg
wqAgfQoKLcKgwqDCoMKgwqDCoCBpZiAoYm8tPm1lbS5tbV9ub2RlKQotwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBiby0+b2Zmc2V0ID0gKGJvLT5tZW0uc3RhcnQgPDwgUEFHRV9TSElGVCkg
KwotwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJkZXYtPm1hbltiby0+bWVt
Lm1lbV90eXBlXS5ncHVfb2Zmc2V0OwotwqDCoMKgwqDCoMKgIGVsc2UKLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgYm8tPm9mZnNldCA9IDA7Ci0KCgpNeSBhc3N1bXB0aW9uIGlzCgogIChi
by0+dGJvLm9mZnNldCAtIHNsb3QtPmdwdV9vZmZzZXQgKyBvZmZzZXQpID09IChiby0+dGJvLm1l
bS5zdGFydCA8PCBQQUdFX1NISUZUKSArIGJkZXYtPm1hbltiby0+bWVtLm1lbV90eXBlXS5ncHVf
b2Zmc2V0IC0gc2xvdC0+Z3B1X29mZnNldCArIG9mZnNldCkKCi0+ID09IChiby0+dGJvLm1lbS5z
dGFydCA8PCBQQUdFX1NISUZUKSArIG9mZnNldAoKYW5kIHdlIGxvb3NlwqAgc2xvdC0+Z3B1X29m
ZnNldCBzbyBJIHRob3VnaHQgaXQgc2hvdWxkIGJlCgooKGJvLT50Ym8ubWVtLnN0YXJ0IDw8IFBB
R0VfU0hJRlQpICsgc2xvdC0+Z3B1X29mZnNldCArIG9mZnNldCk7CgpDYW4geW91IHBsZWFzZSBz
dWdnZXN0IG1lIGhvdyB0byBjYWxjdWxhdGUgdGhlIG9mZnNldMKgIGNvcnJlY3RseSBoZXJlLgoK
ClJlZ2FyZHMsCgpOaXJtbwoKPgo+IFRoZSBvdGhlciBjaHVua3MgbG9vayBzYW5lLCBjYWxjdWxh
dGluZyBzbG90LT5ncHVfb2Zmc2V0Cj4gaW4gc2V0dXBfc2xvdCgpIGNlcnRhaW5seSBtYWtlcyBz
ZW5zZS4KPgo+IGNoZWVycywKPiAgICBHZXJkCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
