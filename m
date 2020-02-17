Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 171D016158B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 16:07:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73BD6E05C;
	Mon, 17 Feb 2020 15:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A968989E;
 Mon, 17 Feb 2020 15:06:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TldqZZZ4lXJhZM1K18bTCS0tXkdgByoSu6jvM+w6wAzSHKPui8w1cMhlI5gsfBftugq6g3GBYTUiIrrgPc7YDHpPRvhRbGJKkRecEFQzYYI5fL2MA3qv7OKjiuCwUhc8SCdRYupPhJXIrLByN6eEQF6sK55qkHFCc/cDAhxpPMQca73uBz3b4UPrwH2FgZWKJ/O44756SDSk92iuIVd1g7O3+BxvuXWTWH+0ZCzRDoE4MUgRxgvpuJAPf6EMdXHAVCd60up7NoQCEB7DI4dI/AmjzyrohqC1pmRKC8sucXqVaLpDCMmbAjzDiJOQknbalrm0tQnQnvTAdDupzPoXJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRpSc3V2BacsmYf3VYPyg+D1GNYz4GDhqfEbpmYGcPw=;
 b=cRV0nZWvuSTWkwpbaTdbpUOe1++kpUOWjImfARGwuEkz5GjZohJHLCW5UBqHisjkyeXl70onk4N8ikcwDwNL20q4ouOnTKshthIVOTKUOER0tFB/TBPYVhE8lNN0BQAVlMRfniptGAvE6fOUKCFGJLTzHOfvpUXyo0eShIuwT/tKZnLWUzemQAOGsfAZYhWSYF8ZEV7algaCyCI23xDlnGT/GSrKbYgBMEnIhBXfKtdqHsSUHIEy1yvKFUEpNcXPGTqfqXv3wFmn1kYJrfHYcC2Aa4mcsqaBK/pP9edlPllBDs/hbdWYtKSQZCi3rRDf6jOvca9SQA09o46V8apLpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRpSc3V2BacsmYf3VYPyg+D1GNYz4GDhqfEbpmYGcPw=;
 b=QDuLsfJgLvmvm+KREpkjpc8FJjSzPdiVKj7J46Cvc8K0LTGWUzL3LAk6fKRawNgyXGysgdklcnLIWJ9qwJWKziiwBVIaNP4an7BBbbAYyOyYnQbE+qxliyVqOQR43rURpK/Iuxfxo92GA/DPtHt8IM9VyZzoqkRWzi82yeTKlAE=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2549.namprd12.prod.outlook.com (52.132.208.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Mon, 17 Feb 2020 15:06:57 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2729.032; Mon, 17 Feb
 2020 15:06:57 +0000
Subject: Re: [PATCH 7/8] drm/bochs: use drm_gem_vram_offset to get bo offset
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200217150427.49994-1-nirmoy.das@amd.com>
 <20200217150427.49994-8-nirmoy.das@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <0a2c3e64-ae63-29ac-ac31-903ece7f075a@amd.com>
Date: Mon, 17 Feb 2020 16:06:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200217150427.49994-8-nirmoy.das@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM3PR07CA0097.eurprd07.prod.outlook.com
 (2603:10a6:207:6::31) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:f960:eb89:795f:e107]
 (2a02:908:1252:fb60:f960:eb89:795f:e107) by
 AM3PR07CA0097.eurprd07.prod.outlook.com (2603:10a6:207:6::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.9 via Frontend Transport; Mon, 17 Feb 2020 15:06:54 +0000
X-Originating-IP: [2a02:908:1252:fb60:f960:eb89:795f:e107]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e6f785b6-a945-4404-88a6-08d7b3bb084a
X-MS-TrafficTypeDiagnostic: DM5PR12MB2549:|DM5PR12MB2549:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB25497C2C3AF9591A79EC12B883160@DM5PR12MB2549.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-Forefront-PRVS: 0316567485
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(396003)(376002)(366004)(189003)(199004)(52116002)(86362001)(4326008)(31696002)(8936002)(478600001)(2616005)(66574012)(6666004)(2906002)(7416002)(186003)(36756003)(6486002)(316002)(31686004)(66556008)(16526019)(81166006)(66946007)(4744005)(5660300002)(8676002)(66476007)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2549;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i8CHUMTmkquRqL01QGRgYIsXv1ISyIQHbN+NgWu/YodHwLQmhg8/a7dF+iFOblgC6BlZ339nyzxt+xAK8Y+3K2GL7CiRY26hJLQuRKnA3J1o4A/U31BKDj36YGdb4YiWrKokffFs/CHeddcCAvuRXkaciJCKQ+dA8nq5h1OCd8LnN/ObG5scVL23wYpbcsyf+dCcoZDpbawpjOFYHTZXtb2lrvFiWGMH43uAGUlPYnL5pbsqzpAVxR4SkYsWyiB0N0nP7kXD2FAn037td6+pOWBfPighC3R9jdjc1kktQQMQZy2FzMZOru57XebiYVP/qVuRiG22U3/uzs8q5N7Xq3chS+oc4+nAKiHdOHbgdNOF588BdE43RmFXCr013ZIFYafJBRYJ424vIZyEOe2QeLMNWZ+L+5eLrISGe3l6MeDDBxbJnIk/LrcCylH1cq0y
X-MS-Exchange-AntiSpam-MessageData: RLIBmPEzqLiJYHT14vBNIF6wO5j+F1iFbSJtM+eeYxMhjLsPGqQX+L9LXubuXfGXuVxDf5DRK37jv+vq66aBkDWDCW6ibBGUG99IPEV+oMMSJARLf89fPVyetQy4eYGSdrRfKR2CO+8wiGzzqgSZpul+mO1vZA44SHPVVfWgf8W1Q8DYHu8B4nmPoBot9WwNlFQD7LWUrMZ7CB41X2xZcA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6f785b6-a945-4404-88a6-08d7b3bb084a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2020 15:06:57.8012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QobypBoyhH9SqvCbGnFodKZYODYsuVAXly8ffCInORDc1KBAPKSrbzvp4uRQHLlE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2549
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, kraxel@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, bskeggs@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMDIuMjAgdW0gMTY6MDQgc2NocmllYiBOaXJtb3kgRGFzOgo+IFN3aXRjaCBvdmVyIHRv
IEdFTSBWUkFNJ3MgaW1wbGVtZW50YXRpb24gdG8gcmV0cmlldmUgYm8tPm9mZnNldAo+Cj4gU2ln
bmVkLW9mZi1ieTogTmlybW95IERhcyA8bmlybW95LmRhc0BhbWQuY29tPgoKQWNrZWQtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2
ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfa21zLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYm9jaHMvYm9jaHNfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfa21z
LmMKPiBpbmRleCA4MDY2ZDdkMzcwZDUuLmI4ZTEwNzlmMDc3ZSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfa21zLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYm9j
aHMvYm9jaHNfa21zLmMKPiBAQCAtMzgsNyArMzgsNyBAQCBzdGF0aWMgdm9pZCBib2Noc19wbGFu
ZV91cGRhdGUoc3RydWN0IGJvY2hzX2RldmljZSAqYm9jaHMsCj4gICAJCQkgc3RhdGUtPmNydGNf
eCwKPiAgIAkJCSBzdGF0ZS0+Y3J0Y195LAo+ICAgCQkJIHN0YXRlLT5mYi0+cGl0Y2hlc1swXSwK
PiAtCQkJIHN0YXRlLT5mYi0+b2Zmc2V0c1swXSArIGdiby0+Ym8ub2Zmc2V0KTsKPiArCQkJIHN0
YXRlLT5mYi0+b2Zmc2V0c1swXSArIGRybV9nZW1fdnJhbV9vZmZzZXQoZ2JvKSk7Cj4gICAJYm9j
aHNfaHdfc2V0Zm9ybWF0KGJvY2hzLCBzdGF0ZS0+ZmItPmZvcm1hdCk7Cj4gICB9Cj4gICAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
