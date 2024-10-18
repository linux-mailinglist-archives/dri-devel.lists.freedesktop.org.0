Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA619A42B2
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 17:42:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F63F10E1D0;
	Fri, 18 Oct 2024 15:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="jZTjkjtu";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="prSYL7Pv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D29E10E1D0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 15:42:01 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49ICP2Fx008181;
 Fri, 18 Oct 2024 16:41:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=qHHwH7bI/YMEclJZwyZP4/j8V
 tKd3sP5jx62wQm9xJU=; b=jZTjkjtuEDzdjkOUjWntofDlAjiH7xQoUf0CdbZZa
 ki0BF1VRmJ845LxBwdVEHsG5pGACeENlojtjZlSacPI3Vx40qjhsJ3A92EY/geGf
 hBPkx0u6ZZygq3XiyYtfWNHAn/RdQS9DceS/SVNdt0Ky3o2YFcqH6YO5vhuVN0g+
 7GtKDVQG1bBxorzlGePDXR4CZo5VxxZRquYye09xNS+NHLBnGAGc+zwDueVBM3xA
 ua+xkaeh9q9ie8LF0ozdlqj4WwNDO6gmKrYwTTPNa9aYCNBwGGixuYOtG6LWBNo+
 G8PhKiHRu9zC7yrGvqS0g8sA6FFxNYLSnRAvPGgwRHlkQ==
Received: from cwxp265cu008.outbound.protection.outlook.com
 (mail-ukwestazlp17010004.outbound.protection.outlook.com [40.93.68.4])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 42a3ac2nwq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Oct 2024 16:41:41 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6BdCNbEem42cYPg5/b89wczlVWEIl4p1GFDWt0uvBXZdSLvboLyC283mNPnjVjD1YlqRvjDoajDcpVgfymFNyNfSKOkDhLn5j4pCcFdNROSQcgEhwlGrQOluL4vNEfoX4nt5u0hTU3To4BLQnvWRsoeJAPn30nVBThFBBmvVFJx3oahEeMzWOg3D5s8lIOLWRdGNb31wt7xQVl0F5p04euzU9hqcFjmEW/Vw0jjWROs/F2mKSs9EqOk7KvDY4XIS/GxOUDNKCR2QOmlWCAYc0GCGqi5Pn5FMBx5tlvdglg+6cTeDjN/Cs+Fvsdck3aOwq8431I+lvZR2hVvTXcqPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qHHwH7bI/YMEclJZwyZP4/j8VtKd3sP5jx62wQm9xJU=;
 b=kYrcFXXUYXWIyRH4m7c0oPGvwSI/70KgHzvoN7F/704R4VBgKTi2FCHZEWCX45MPW/8n4am/cMPmaEGu7hZzoq6qoI616OQ5jDArV9bjeqX5mJdrYY1NtoF6DYbQSyoW9eElpk6ltl8n1D12Seakp7n8P7nlE9IId+dJyrfAh6uvgkDLaxwgmJdRmw9+Ir6oV6yysPndAIav3lC3b6kxVQlDHPvF3QMDN6yx8CO+s3qUnOk7+WAP/yE5F0QyePXOzsRVspr5wxu8+V6fuYzfIPDgyP5oChD59VNB8xAKECKBBUD1akp76VbWqmO5hiqgnQV98P1WtY3J8uOUY+X1oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHHwH7bI/YMEclJZwyZP4/j8VtKd3sP5jx62wQm9xJU=;
 b=prSYL7Pv8KaGwGUMZMxhbQnuYEdQq+Vony4lkuMald+Ao/MrAGw7lSCVu06WuIWIgBKevScUz7bMQNh+KQrvC+nmaWU0hRMoOq/Coy3e7uY3SUzCHKWjYR4TmMgZtzsbqUtw3ek+vIbGZUwwc25UQQ+mqZnlPw8+xbb9JEXCbzA=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWLP265MB2259.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:6b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.18; Fri, 18 Oct 2024 15:41:40 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%6]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 15:41:40 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Brendan King <Brendan.King@imgtec.com>, Frank Binns
 <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/2] drm/imagination: Break an object reference loop
Thread-Topic: [PATCH v3 2/2] drm/imagination: Break an object reference loop
Thread-Index: AQHbIXQ5O6skwcFhHUq9t8DEiam/vw==
Date: Fri, 18 Oct 2024 15:41:40 +0000
Message-ID: <8a25924f-1bb7-4d9a-a346-58e871dfb1d1@imgtec.com>
References: <d35a7455-1ed7-44c2-94fe-3d211a8a5e94@imgtec.com>
In-Reply-To: <d35a7455-1ed7-44c2-94fe-3d211a8a5e94@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWLP265MB2259:EE_
x-ms-office365-filtering-correlation-id: 6ea76559-c70e-4b1c-8ee1-08dcef8b5be4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ODVLbWd2TDZGSVlPRGJLcU1KVWJhVnh1RXJIZ3QzeU5zL2Uvd3RpRGVQb0JC?=
 =?utf-8?B?WG1IeHMzcFFFQzk2U29NKy9YWVlQcXFpNXlsSXl1SGNxTFZUODBqT2FEVkho?=
 =?utf-8?B?RCtPVWJiT3JHWGU1VU5BaUE1K3hDaDRURUZ4OTA4QlVJR2NwYng2L1J6VVc0?=
 =?utf-8?B?RzlpREZnQTZIT2ovbDRUTTRERGxxN1FtcTBCZ3UvM3h0WGlhYXl0a1VpTnJO?=
 =?utf-8?B?RGhFTENUWjgrVGFqYWsrRWMvWTNVTmhBdCtwYW51R2R0UEYwUkh4Q1B2VGNw?=
 =?utf-8?B?TkFISUQ5cHE5Nmc0M3JhWlQ1a0ovRUpaMGttVGxaTFRMYUIzR1hERHBTYjh1?=
 =?utf-8?B?OWRhbWpxVHZOT29TVWRpRUJ4cE1WTEN2R0Y2Mlp3Ym9RNHBMcUc2UUFYaEZ1?=
 =?utf-8?B?VXpuQlpid1drUUlzYkxDOUlEdHJydnFmL3VlM280aG5QeEVHdWpKUkhxT3pK?=
 =?utf-8?B?MlpRMVhqSnY3NkpwN2Fkd1BYYWZZbTJyZlhMVjE1cG54dm9qdkUxc2V1eFNy?=
 =?utf-8?B?dkRjcHBVczRRTUNzNlQ3L1d1c0poeHdTa2FWaUpienArWmR1Z3I0MVpNTDBk?=
 =?utf-8?B?cTJFZ0hzeXJTS3RWcUF6RXhaSjhYMGtNMjBkQS8yaHkvQ0ZDN3BpdlhBQWxy?=
 =?utf-8?B?QkkvRUJnN1RrMWUyWUtFSzl6R1htNlh1Q21oTzhFY1RMaUVNZXNEcTc0eUhK?=
 =?utf-8?B?SVpETmk4RTAySUdXZjd6bU1yQ21hN3Jsb05pMVRMQ1ovNXA0MlVtbzlaS2F1?=
 =?utf-8?B?TkV0R01FMVdicjh0NHpKVnZLTXBiMXEwQ0M3RUtTbnRhcFB2L0tyRlRLb2hD?=
 =?utf-8?B?MktJTXpEYVBoUGJWSGtEc05Wa1ROaEpVU3V0cjZhMndNMm00YmVrNDhOcEg4?=
 =?utf-8?B?djBxSURFUjFpZnRIN2trQXdEMXRjM1BRWjNJalp0cEhWNmh5TjdjNVI5WW5U?=
 =?utf-8?B?ZCt1QTJoMTVWY091T0VnRnh4MXhtM1hIcW9HQlJvTElVV1FLbUdLMUplcGhM?=
 =?utf-8?B?Y1hKbnV1M1VGRWV4NE16QzN5QnZqZFgzZWRxamY0eFk4TGs3ek85U084NXJT?=
 =?utf-8?B?Q0JmWkRFc25uZlZMWndGMVY1NUZUQXd2QXV5c0RHMzN3RG14YmNndk56UDdQ?=
 =?utf-8?B?MTc2WWxRVEZ4NkpzTUZ5N3dwK1g1cHJyS01EMWlLNG5Ic2ZRV0hqcXZMdWJL?=
 =?utf-8?B?K1VIR1VsYUV0UENQYi9HRGs2SytFV0ZDYi9PeHFkRVYrNlFscnAyWXBhdXFZ?=
 =?utf-8?B?aHhpK1ZnSWQ4NGlCUlNrOGZpdXcxdmhJYmVMeFNSQVpKaEkvbWVySEozUWE2?=
 =?utf-8?B?NHN6WWpDQlJrL3Axd0c5TVp6ZDJydk5MOHVvOXltUjk1K1BzVTJKdXcxbTZT?=
 =?utf-8?B?dUpiRGVaVEh0VHhzNEc3UlhmdW5ndFU2alQ3RDAzR0R6azJtQlUrd0V3N0VO?=
 =?utf-8?B?RjNVU0ltTm95aUZMRTErYXlQS2JmYWd2bUkzekFqaVFQUDkxZnhVY0NlV1dq?=
 =?utf-8?B?KzhWcEgyMmVKNC94WXFjM2prVzk4ZEdMd0hQY3NWZlRjZW9QKzZESjFqeldR?=
 =?utf-8?B?SC9MNkRyQ01xbjE2b3MzMHFaNTBPNHRVcUVwWC9xd3NkbkxSRGlJa3RneDRZ?=
 =?utf-8?B?b1k1dU0xYkw2akdHSFZZQkhyU3JJSGgycXdUV0NhMi9hTmIzdFY0aWdydVFh?=
 =?utf-8?B?bkN0emtGc05ITVA3NktpSGVROGtsZjlBMktnOEhndXJlTk5UWkptelJ2OGRk?=
 =?utf-8?B?UEdPcnhwRnA1Y1lYOUhXWi96bXlEOU5UNmJHS0V3b2Z5K09zS2p2bk1GVXFl?=
 =?utf-8?B?K2psb3pXcXNTTXVoUGhzT0xlMklTVEJrdEdQcG9TNkorQkFWMm9kU0N2L2ZW?=
 =?utf-8?Q?rZzOMBeRYjLql?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2xwMnVxKzd0UEZLTmkzZXVGMFdyUzVWQjhOaE1aN1oyZTZFbFliYThQVjFT?=
 =?utf-8?B?RXUvK2lyZGhtRnJINUhGbXJmM0lJVnF5MFNPMExVaWhEWi9BQm1UMzh0UFJa?=
 =?utf-8?B?NWFxL2N3bDJRTko5Qk1YY05pSndwbXdrTnl2b0gzMUZrZTV0c3VLc3VDOHdv?=
 =?utf-8?B?VFNSclJsY0diT3BTbjZIaTUvSEpQdWpoR1UxUlNFeDFWVEhadDh6TU94aDBF?=
 =?utf-8?B?Y1MzWldYRGtWYkVudEJpSlFWVjhGTnd3TzVtT1BHMENMckp1MjZZUXU2dHMz?=
 =?utf-8?B?ZUVxR0xkdFNZbVg4MzM3UXlMVVR2MVJuVFVHTzdheTdMbEE1WWsyMDlOeWV2?=
 =?utf-8?B?eldOWEt5TitVc2hTSTZtWmk4QnpjbUhIbEo3d1BoQ1ZCRlZSdVpFSGYyQWht?=
 =?utf-8?B?dkwrVTBSNGJwbThxOVZLOGU4eEZaZ0JOSmRNd0F3VFg5VnZ1NzV2NHY4bUM4?=
 =?utf-8?B?aVYrZ082bG14L3JmczN0QXBVNkpSbVluOFg2MUo0ZGg0bHBTdXRtM0o0NlNN?=
 =?utf-8?B?dzR4UnRwd054MEhwT0c1dE5pNnFHSnhtM21mNFFsVE95RVhveEVpTHJHNDZV?=
 =?utf-8?B?TVZuVE5jRDBGS0J6QVQwYmFiaTZOYU9vMitHMVVCcHZXd0dGNnFnVUZOMS92?=
 =?utf-8?B?Y2dDRk5JVk1QSnloUllBQjJJNVVLMWV5b3ZkK2Z4S2lkR1U5OWllMDA5TjRi?=
 =?utf-8?B?NHRQZlEzWm1Fb2JNMW5MSDVTMDR6a2xVZW1DVGZ5VkNHQ3NsVzBGT1NQWmpp?=
 =?utf-8?B?cStIMjQvOXpxUUpSbHRCeDJWamk2K1ZmSTlTZG5EMHh1R3pMTDlrcTZsOUU4?=
 =?utf-8?B?YmNNUHV1TTZwMUk3U09ob1ZleVp0elk4ZVN6N1BKcmdYdERpZ25ha1hVcGxa?=
 =?utf-8?B?bWRXR3lJcVNocmV0WlhLMGp2ZHBEVlZsU0ZabkpCejlIdmtGcFhndkMxdGhv?=
 =?utf-8?B?L0l6Ymo4emgzU0lwNmFwK0lFVk9NWHpRMjBjV1Z1WkF1VTVtTU85bjEzVTBP?=
 =?utf-8?B?U1NPa1FaUWVXTDhMc2V4blo4NW1DWkxKSUVqR0NKeUpkejFaaGZzRzVqSVcv?=
 =?utf-8?B?VThLbW9DZkw5YWdib2l5VDBpQjI0THZyakJpSmRNcGNQczVFVjZoSVA3S24z?=
 =?utf-8?B?QVFHajlKU2xKUG9yN3M4bS83YVljMFpRUFUwZVI5ekJWS09NR0dtbDhzQWZB?=
 =?utf-8?B?M1NPV2hOSXExK2NVRHhJMThIY1RYdWdKTkUyNDdnb2hlNnVHSDdOQjMyUFRr?=
 =?utf-8?B?cTJ2YWpEOGxFaGRlODU3Z3pRaGVjMkFvMW1aZ052ek5zOXFRWlJBRENoVGF1?=
 =?utf-8?B?dll3b2hJR3FwRGl2UnJ5djdUOStBM25FME1Wc00ydWZ3MWR5UGFycjZUSDN2?=
 =?utf-8?B?TTdNRC9ubGd5a1o0RHFOVFZ0S24va2dLczdKUlRCK2ZEMnNyMElpWTRKRzVm?=
 =?utf-8?B?T1FOUmJSYjZ1eEZhN2F2bWpwVDU4bkdZZE1MbTFrdnlDWU9DT1J1UnFtWWZ0?=
 =?utf-8?B?NXpXcVFHT0o2cUtPVU1IZGhGL3lnQXdYQlJINkhSaGo0R0p6eU9CNStja29i?=
 =?utf-8?B?QU95bkZHNUM5TXdJUm5rQmFaQy8wV0ZSQm5jVzdGbG5lRDd1QXBQUDJraVJS?=
 =?utf-8?B?QmJRNXI3ODdQdHMrSnZESHQzOHpJVDhueCtGeUJNRFcwZUw4UnZyeU5ZZzdq?=
 =?utf-8?B?ekxyVEkxU1gwTkZsSmVPUzN5b3dZT3A3VFBtdVZITFp3WU14TTJPYURrcTZ4?=
 =?utf-8?B?Szk5ZUkxZGhwZElhek5XYjVGaG0wZ0tQQ0dDemk1WkVBdWpQSnJjZTMxZjhv?=
 =?utf-8?B?S1F2YklHWldjaXFaWmxzT3RnYWtvMjVFbjRxejNGOUJSSkFhTW5iSmdGcmhO?=
 =?utf-8?B?S3VFMnN2VmVaclFzTDM0UENYUUdiTkxIZlJraWI2d2kyVDl1K3QweUFmTmVn?=
 =?utf-8?B?TWRRd2V0YlVxS3F6NzhuVGcvQ1ArWExLQVI2djlDY244UTNYenpXdkdlQ0pW?=
 =?utf-8?B?a2tlc0h0UzBFc2ZONUc0MDVCNzF6T1BFWHJ1a3E0cmRnQjRVUndoUGx1MjZ0?=
 =?utf-8?B?dWwza3VtS1V6aUVtSWRGZ0kvd2J6Zlc5ZDNxUy9pQ2V5ckZwZi9hNDhRQjE4?=
 =?utf-8?B?Y0FnSzFVQ1hJRk5ZZkkzbStqZndRQnJualFFQkoxOTR6QjJGYlhHYU1sbGc3?=
 =?utf-8?B?OVE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------AtQ3sTLoooRJQrBV76rYfuP3"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea76559-c70e-4b1c-8ee1-08dcef8b5be4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2024 15:41:40.0837 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YK09arh/dBhVX0VFfeGQpqQYa41vv+tHMz1W66ZfhuYDQuv7URdp1xd6tK256UwlY7WeDngQLCJKFEOPQL5W0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2259
X-Authority-Analysis: v=2.4 cv=AcbjHGXG c=1 sm=1 tr=0 ts=671281b6 cx=c_pps
 a=tbUAc5YXJZE2aXMCunvlBA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=r_1tXGB3AAAA:8 a=VwQbUJbxAAAA:8
 a=2vpGiOW3mguWqdhXNEEA:9 a=QEXdDO2ut3YA:10 a=FQAv6l16WG0gR8wUSMMA:9
 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: oXZFUJlsOVUzBZYpeOXfONpDufMa_C5d
X-Proofpoint-GUID: oXZFUJlsOVUzBZYpeOXfONpDufMa_C5d
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------AtQ3sTLoooRJQrBV76rYfuP3
Content-Type: multipart/mixed; boundary="------------4Ex0tgkJ9HdK0AfC9K0JG9FX";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: dri-devel@lists.freedesktop.org
Cc: Brendan King <brendan.king@imgtec.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org
Message-ID: <8a25924f-1bb7-4d9a-a346-58e871dfb1d1@imgtec.com>
Subject: [PATCH v3 2/2] drm/imagination: Break an object reference loop
References: <d35a7455-1ed7-44c2-94fe-3d211a8a5e94@imgtec.com>
In-Reply-To: <d35a7455-1ed7-44c2-94fe-3d211a8a5e94@imgtec.com>

--------------4Ex0tgkJ9HdK0AfC9K0JG9FX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Brendan King <brendan.king@imgtec.com>

When remaining resources are being cleaned up on driver close,
outstanding VM mappings may result in resources being leaked, due
to an object reference loop, as shown below, with each object (or
set of objects) referencing the object below it:

    PVR GEM Object
    GPU scheduler "finished" fence
    GPU scheduler =E2=80=9Cscheduled=E2=80=9D fence
    PVR driver =E2=80=9Cdone=E2=80=9D fence
    PVR Context
    PVR VM Context
    PVR VM Mappings
    PVR GEM Object

The reference that the PVR VM Context has on the VM mappings is a
soft one, in the sense that the freeing of outstanding VM mappings
is done as part of VM context destruction; no reference counts are
involved, as is the case for all the other references in the loop.

To break the reference loop during cleanup, free the outstanding
VM mappings before destroying the PVR Context associated with the
VM context.

Signed-off-by: Brendan King <brendan.king@imgtec.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Reviewed-by: Frank Binns <frank.binns@imgtec.com>
Cc: stable@vger.kernel.org
---
Changes in v1 -> v2:
 - None

Changes in v2 -> v3:
 - Add Frank's Rb [1]
 - Add Cc: stable tag

[1]: https://lore.kernel.org/dri-devel/b75e658cc5ce9ac24df2c31c1a6fd798a5=
f3a87f.camel@imgtec.com/
---
 drivers/gpu/drm/imagination/pvr_context.c | 19 +++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_context.h | 18 ++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_vm.c      | 22 ++++++++++++++++++----
 drivers/gpu/drm/imagination/pvr_vm.h      |  1 +
 4 files changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_context.c b/drivers/gpu/drm/=
imagination/pvr_context.c
index 255c93582734..4cb3494c0bb2 100644
--- a/drivers/gpu/drm/imagination/pvr_context.c
+++ b/drivers/gpu/drm/imagination/pvr_context.c
@@ -450,11 +450,30 @@ pvr_context_destroy(struct pvr_file *pvr_file, u32 =
handle)
  */
 void pvr_destroy_contexts_for_file(struct pvr_file *pvr_file)
 {
+	struct pvr_device *pvr_dev =3D pvr_file->pvr_dev;
 	struct pvr_context *ctx;
 	unsigned long handle;
=20
 	xa_for_each(&pvr_file->ctx_handles, handle, ctx)
 		pvr_context_destroy(pvr_file, handle);
+
+	spin_lock(&pvr_dev->ctx_list_lock);
+	ctx =3D list_first_entry(&pvr_file->contexts, struct pvr_context, file_=
link);
+
+	while (!list_entry_is_head(ctx, &pvr_file->contexts, file_link)) {
+		list_del_init(&ctx->file_link);
+
+		if (pvr_context_get_if_referenced(ctx)) {
+			spin_unlock(&pvr_dev->ctx_list_lock);
+
+			pvr_vm_unmap_all(ctx->vm_ctx);
+
+			pvr_context_put(ctx);
+			spin_lock(&pvr_dev->ctx_list_lock);
+		}
+		ctx =3D list_first_entry(&pvr_file->contexts, struct pvr_context, file=
_link);
+	}
+	spin_unlock(&pvr_dev->ctx_list_lock);
 }
=20
 /**
diff --git a/drivers/gpu/drm/imagination/pvr_context.h b/drivers/gpu/drm/=
imagination/pvr_context.h
index a5b0a82a54a1..07afa179cdf4 100644
--- a/drivers/gpu/drm/imagination/pvr_context.h
+++ b/drivers/gpu/drm/imagination/pvr_context.h
@@ -126,6 +126,24 @@ pvr_context_get(struct pvr_context *ctx)
 	return ctx;
 }
=20
+/**
+ * pvr_context_get_if_referenced() - Take an additional reference on a s=
till
+ * referenced context.
+ * @ctx: Context pointer.
+ *
+ * Call pvr_context_put() to release.
+ *
+ * Returns:
+ *  * True on success, or
+ *  * false if no context pointer passed, or the context wasn't still
+ *  * referenced.
+ */
+static __always_inline bool
+pvr_context_get_if_referenced(struct pvr_context *ctx)
+{
+	return ctx !=3D NULL && kref_get_unless_zero(&ctx->ref_count) !=3D 0;
+}
+
 /**
  * pvr_context_lookup() - Lookup context pointer from handle and file.
  * @pvr_file: Pointer to pvr_file structure.
diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagi=
nation/pvr_vm.c
index 97c0f772ed65..7bd6ba4c6e8a 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -14,6 +14,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gpuvm.h>
=20
+#include <linux/bug.h>
 #include <linux/container_of.h>
 #include <linux/err.h>
 #include <linux/errno.h>
@@ -597,12 +598,26 @@ pvr_vm_create_context(struct pvr_device *pvr_dev, b=
ool is_userspace_context)
 }
=20
 /**
- * pvr_vm_context_release() - Teardown a VM context.
- * @ref_count: Pointer to reference counter of the VM context.
+ * pvr_vm_unmap_all() - Unmap all mappings associated with a VM context.=

+ * @vm_ctx: Target VM context.
  *
  * This function ensures that no mappings are left dangling by unmapping=
 them
  * all in order of ascending device-virtual address.
  */
+void
+pvr_vm_unmap_all(struct pvr_vm_context *vm_ctx)
+{
+	WARN_ON(pvr_vm_unmap(vm_ctx, vm_ctx->gpuvm_mgr.mm_start,
+			     vm_ctx->gpuvm_mgr.mm_range));
+}
+
+/**
+ * pvr_vm_context_release() - Teardown a VM context.
+ * @ref_count: Pointer to reference counter of the VM context.
+ *
+ * This function also ensures that no mappings are left dangling by call=
ing
+ * pvr_vm_unmap_all.
+ */
 static void
 pvr_vm_context_release(struct kref *ref_count)
 {
@@ -612,8 +627,7 @@ pvr_vm_context_release(struct kref *ref_count)
 	if (vm_ctx->fw_mem_ctx_obj)
 		pvr_fw_object_destroy(vm_ctx->fw_mem_ctx_obj);
=20
-	WARN_ON(pvr_vm_unmap(vm_ctx, vm_ctx->gpuvm_mgr.mm_start,
-			     vm_ctx->gpuvm_mgr.mm_range));
+	pvr_vm_unmap_all(vm_ctx);
=20
 	pvr_mmu_context_destroy(vm_ctx->mmu_ctx);
 	drm_gem_private_object_fini(&vm_ctx->dummy_gem);
diff --git a/drivers/gpu/drm/imagination/pvr_vm.h b/drivers/gpu/drm/imagi=
nation/pvr_vm.h
index f2a6463f2b05..79406243617c 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.h
+++ b/drivers/gpu/drm/imagination/pvr_vm.h
@@ -39,6 +39,7 @@ int pvr_vm_map(struct pvr_vm_context *vm_ctx,
 	       struct pvr_gem_object *pvr_obj, u64 pvr_obj_offset,
 	       u64 device_addr, u64 size);
 int pvr_vm_unmap(struct pvr_vm_context *vm_ctx, u64 device_addr, u64 siz=
e);
+void pvr_vm_unmap_all(struct pvr_vm_context *vm_ctx);
=20
 dma_addr_t pvr_vm_get_page_table_root_addr(struct pvr_vm_context *vm_ctx=
);
 struct dma_resv *pvr_vm_get_dma_resv(struct pvr_vm_context *vm_ctx);
--=20
2.47.0



--------------4Ex0tgkJ9HdK0AfC9K0JG9FX--

--------------AtQ3sTLoooRJQrBV76rYfuP3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZxKBswUDAAAAAAAKCRB5vBnz2d5qsIE6
AP93dvlO/G/K1kOPz+isg4v/U8tjScJCPLNpDATkZz1axQD/ZrVEkiKukUUVQykSU14jlMPz/cgJ
K+JmSBa2iMzeTAE=
=Ikxd
-----END PGP SIGNATURE-----

--------------AtQ3sTLoooRJQrBV76rYfuP3--
