Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F732ED608
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 18:51:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6286E4BB;
	Thu,  7 Jan 2021 17:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBC06E4C5
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 17:50:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I+YipzHL5ARfy68vGcgcId+cknt3XfwtLfY42afdqAfpla50tSW2UBZCXIwQmzd7BzpI0+xj82L68VaW8QsmrRWDpeIiOsMMgHFN3NLK3mnDd8efghgqEdJkFsxn70gll8EIek1OdbgXn/UyLoJQ50ROfTM05IRyGZUnzmFG/NLDEmp66MH1cliIPNPRxqCPSA5bzYpgK0rxhfXMT0N4uuKYVjJuutC7cIlmoGsoStAaroryb7z98ZV6X+tfOeLwntWo64YcrKHk33N03gi8n93befEdk5xAVGetEmrm6387qeFSQvqwIbpa5bqKF8Mj9WocEaBvrMylxI9xw6k7KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1f/85AnEGElOJ9U09MFwycRi+XzCeG5VJ58qVhGop10=;
 b=nP1EDWk8VjbE22TrsgCWaFwkPGWF1SG/TBiunTkyTZ2ndk9Pddj1zPdkFJQTNHxXoiA1U+WJiGrZuVrSFt140D0Mm3mi2PuLtE66o2+RbD5HtVJKod3QhwqbOXcwol+sdoHENO2EpxCvQ4un6TndA38/Hd6xysK9TEoTR1Snyvm7GxEoI/cX08Bq+RrQzivj5QmYPkxSRERwO6xptLYM7/hdSfMMTh7Nedc7VFe85Ju8f/+gXFWR6GHv9OJi628gH8hk3gCZzLFfiQqarAdpEl3/L+XtZHmBlvxPzRRPfc2Nr/vnXwg/zsz5gM6Qx0vKk/gYx8IuNI6cqFjezK1BUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1f/85AnEGElOJ9U09MFwycRi+XzCeG5VJ58qVhGop10=;
 b=n9wczHft+d2Af7u3XJRrF7NHtzmPXZ9QqQD06BCGorOiKHUSPeVJA+ad7dHYvUOd8oOLrVz0Wvv6sTgY6dM8BEi2FDGa64mhMGj1E1/wc+9a8h+XQ2BS9x8S9hpwszXPqi3y5D60Hq8LGWE1nTc/hqsnSXG9SlktPAbHZuFults=
Authentication-Results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3916.namprd12.prod.outlook.com (2603:10b6:5:1ca::21)
 by DM6PR12MB3066.namprd12.prod.outlook.com (2603:10b6:5:11a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 17:50:52 +0000
Received: from DM6PR12MB3916.namprd12.prod.outlook.com
 ([fe80::f872:3677:28c3:660b]) by DM6PR12MB3916.namprd12.prod.outlook.com
 ([fe80::f872:3677:28c3:660b%5]) with mapi id 15.20.3721.024; Thu, 7 Jan 2021
 17:50:51 +0000
From: Nirmoy Das <nirmoy.das@amd.com>
To: bhelgaas@google.com
Subject: [PATCH 3/4] drm/amdgpu: Resize BAR0 to the maximum available size,
 even if it doesn't cover VRAM
Date: Thu,  7 Jan 2021 18:50:16 +0100
Message-Id: <20210107175017.15893-4-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107175017.15893-1-nirmoy.das@amd.com>
References: <20210107175017.15893-1-nirmoy.das@amd.com>
X-Originating-IP: [217.86.111.165]
X-ClientProxiedBy: AM0PR03CA0093.eurprd03.prod.outlook.com
 (2603:10a6:208:69::34) To DM6PR12MB3916.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brihaspati.fritz.box (217.86.111.165) by
 AM0PR03CA0093.eurprd03.prod.outlook.com (2603:10a6:208:69::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 17:50:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: edd9db93-ea7f-48f5-006a-08d8b334c650
X-MS-TrafficTypeDiagnostic: DM6PR12MB3066:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3066AA7DD69BEB69C642E18E8BAF0@DM6PR12MB3066.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6qN7Tt43VL5Hu2uXoCtC1Pzb73+y4vOQgZSOExDawJ9fsEUsIcfFMpZsalHcqo5br5PFHOrAcpdGv5ZXQ2QuEBvpXNNIRGy+yvTiN9LtWkaTz/u7QHQRv7TFGRk5o5tIuiCgux8GXxR3nQrmUALhjs+g9aN1xucCMxsoFWNZu/BfsZz4nLCqjx2f0HIMkrHypB0DpRaDQ67zMnTRaF/Ofrf8eW1FUna/mtmS5YUoksAVVq0OSTyt3deRyZPP+B904ZUnbJv9tuhixptrwGN7SwLw45dmcEtyyPNXtULdiaIEvQE0ltQDe+F2wGHrfAD8rCyWuqpO56jhntm9DrI+sKJPf8yL21MFLUXCQVRhktvlgFZtEe/wojN2Ghxrkd2R8ilDECinvfL+Uos60OW7lA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3916.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(4326008)(6916009)(316002)(1076003)(66574015)(83380400001)(478600001)(6486002)(54906003)(36756003)(26005)(66476007)(66556008)(5660300002)(8936002)(66946007)(2616005)(16526019)(44832011)(2906002)(52116002)(6506007)(8676002)(86362001)(6666004)(956004)(6512007)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aFJaWXR0TlN0aStrcFovZ3ZPUmpqclIxT25mVHFNbjRPOEVKM0JOUXd4cDc3?=
 =?utf-8?B?RDlMU1VIVDJSNnM5MDRlM1JqK0FqOTdGeUovTEJZWFUzeUpUZU5rclQyajVS?=
 =?utf-8?B?Z2daUUZxYW1tV0JvNWZJemxnUkMwb2owQU5qZVNYQ2lUcWlJMlpqRmJRcHR1?=
 =?utf-8?B?NjN0OHhLMy9oWEhNSEJ5eEpEN0JlNW94L1ZLT0tLQ20vV0RHdHpxV2UwWWJV?=
 =?utf-8?B?RGRHSG5xdEROb0poTXZ5ZEpnMmNFdmhDOHJuNXdEMkdjWTEwZ2tJRW4rY21l?=
 =?utf-8?B?Skp5VnNFMGNMS0dSMFpzRVB1Ry9HeitjcGRkUVVobElobHhUL3pBTzBaK0Jh?=
 =?utf-8?B?ZHNkWlY4NkRabDYzekZYVWREWFR4ckpFWXpjNjdNbnFzN0o2VDI1bm5IV2FS?=
 =?utf-8?B?RC9aamJkSDRnY044cWhSNWpidHpCQnkrTlFnNGdvcDJMTDRjR1Fhdnd0S05w?=
 =?utf-8?B?cDlQMEJlWTZiNlBVR29XM2U3Q3h5eHlhY1FITWV3dWE3TU54bW5iY2xuVkZx?=
 =?utf-8?B?MmtmUVVFbnM0VHMzcFg4ZzBLQytQSXphNStSYWJiQ0x2Z3ZTSFJ5UEJEMnNu?=
 =?utf-8?B?RDUyNWNwcDBBWnJJM2gyOEx6MW5ubVdyeDhwOHRvbzRHanlRSU5vTlQwZWlp?=
 =?utf-8?B?WjNjTXhDUGZCQllpRWtRbHdsWFJ2dnF2dWNZUnZtb2M1VFg1WlJvVkQrdUZ6?=
 =?utf-8?B?N2pvL2k5Q25wNlI2TVl1ekM0citJMkFsNTVBdWtGcTZoTTd6NExWUm95dUNK?=
 =?utf-8?B?T0xXbWdPWU9MQ3FZM29VWWpqa3crMW4xSHhwbFNDMEYxNjB1YWRZa2oreTFY?=
 =?utf-8?B?eUhWK1ArUTRlb2JhQU9ycXgrQkhPeG5na1orSlJmSVV1T0JDek5sTHUyS1hp?=
 =?utf-8?B?cmwrbkNSRnlkUjZBWktFRzZtQ2REVjNrNnM2SHhRUkozVWFRZ3Zoa0pUN3FQ?=
 =?utf-8?B?RHYvVEI1Y1BQT0hEK2x1THJ5WmxLUzUyd0wxQ0s3bHhRZXViV2lwK01rU3cy?=
 =?utf-8?B?YS9XaVd3VGcrMVFiV1ptOEd3dU43QXBLM0FjTjF2MG0zaFFIWjNmSUl1SWli?=
 =?utf-8?B?NFI2OTQySlVhd2tFaFdlbkk0Qkc0eWNpYVdhRDJoZzdhUGpSaFhqaFdvQ2FK?=
 =?utf-8?B?Q0V5NGJpRGt3WGltZS9GVGk4K2lUREM3alo4ZGFsc2VjdE94T3lrNXNKOG1a?=
 =?utf-8?B?Zmo1M08vTGVoNUZKT2grWWVaME9nMHdpb2tDR0hlbWhJWlFJYzBXaWpBNnh5?=
 =?utf-8?B?dEsrQXQ2bk43blNic0FDMGFVRTJ4Q1N6UmJFdDJDNVRiQmNZTjRjZDJoVE92?=
 =?utf-8?Q?dXQzCxY2Ve6lV8jvwapAZFhwLf3dtvBT2b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3916.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 17:50:51.8968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: edd9db93-ea7f-48f5-006a-08d8b334c650
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bew4ubldRdVU+id4hHT2Au74SXWOgCtWFXOPm3SUVmGl6sMGIkmboWDIM43IWFqhFvm/yo210wQLUEkaS70c2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3066
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
Cc: ckoenig.leichtzumerken@gmail.com, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@amd.com>, linux-pci@vger.kernel.org,
 devspam@moreofthesa.me.uk,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhbGxvd3MgQkFSMCByZXNpemluZyB0byBiZSBkb25lIGZvciBjYXJkcyB3aGljaCBkb24n
dCBhZHZlcnRpc2UKc3VwcG9ydCBmb3IgYSBzaXplIGxhcmdlIGVub3VnaCB0byBjb3ZlciB0aGUg
VlJBTSBidXQgd2hpY2ggZG8KYWR2ZXJ0aXNlIGF0IGxlYXN0IG9uZSBzaXplIGxhcmdlciB0aGFu
IHRoZSBkZWZhdWx0LiBGb3IgZXhhbXBsZSwKbXkgUlggNTYwMCBYVCwgd2hpY2ggYWR2ZXJ0aXNl
cyAyNTZNQiwgNTEyTUIgYW5kIDFHQi4KClNpZ25lZC1vZmYtYnk6IERhcnJlbiBTYWx0IDxkZXZz
cGFtQG1vcmVvZnRoZXNhLm1lLnVrPgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IE5pcm1veSBEYXMgPG5pcm1v
eS5kYXNAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2
aWNlLmMgfCA2ICsrKysrLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
ZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwppbmRl
eCBkY2UwZTY2YjIzNjQuLjM5MGYyY2MxM2RmNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UuYwpAQCAtMTA5MCw3ICsxMDkwLDcgQEAgdm9pZCBhbWRncHVfZGV2
aWNlX3diX2ZyZWUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHUzMiB3YikKIGludCBhbWRn
cHVfZGV2aWNlX3Jlc2l6ZV9mYl9iYXIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7CiAJ
dTY0IHNwYWNlX25lZWRlZCA9IHJvdW5kdXBfcG93X29mX3R3byhhZGV2LT5nbWMucmVhbF92cmFt
X3NpemUpOwotCXUzMiByYmFyX3NpemUgPSBvcmRlcl9iYXNlXzIoKChzcGFjZV9uZWVkZWQgPj4g
MjApIHwgMSkpIC0gMTsKKwlpbnQgcmJhcl9zaXplID0gcGNpX3JlYmFyX2J5dGVzX3RvX3NpemUo
YWRldi0+Z21jLnJlYWxfdnJhbV9zaXplKTsKIAlzdHJ1Y3QgcGNpX2J1cyAqcm9vdDsKIAlzdHJ1
Y3QgcmVzb3VyY2UgKnJlczsKIAl1bnNpZ25lZCBpOwpAQCAtMTEyMSw2ICsxMTIxLDEwIEBAIGlu
dCBhbWRncHVfZGV2aWNlX3Jlc2l6ZV9mYl9iYXIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
CiAJaWYgKCFyZXMpCiAJCXJldHVybiAwOwogCisJLyogTGltaXQgdGhlIEJBUiBzaXplIHRvIHdo
YXQgaXMgYXZhaWxhYmxlICovCisJcmJhcl9zaXplID0gbWluKGZscyhwY2lfcmViYXJfZ2V0X3Bv
c3NpYmxlX3NpemVzKGFkZXYtPnBkZXYsIDApKSAtIDEsCisJCQlyYmFyX3NpemUpOworCiAJLyog
RGlzYWJsZSBtZW1vcnkgZGVjb2Rpbmcgd2hpbGUgd2UgY2hhbmdlIHRoZSBCQVIgYWRkcmVzc2Vz
IGFuZCBzaXplICovCiAJcGNpX3JlYWRfY29uZmlnX3dvcmQoYWRldi0+cGRldiwgUENJX0NPTU1B
TkQsICZjbWQpOwogCXBjaV93cml0ZV9jb25maWdfd29yZChhZGV2LT5wZGV2LCBQQ0lfQ09NTUFO
RCwKLS0gCjIuMjkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
