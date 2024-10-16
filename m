Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7319A0C1E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 15:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394B010E711;
	Wed, 16 Oct 2024 13:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="n1qLLM5K";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="L8MJUbOs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1669 seconds by postgrey-1.36 at gabe;
 Wed, 16 Oct 2024 13:59:44 UTC
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A4710E710
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 13:59:44 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G5hh7c018155;
 Wed, 16 Oct 2024 14:32:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=FyUi40stkQDjfff75WGMr//7LmbQT7G214fMT/sJPOc=; b=n1q
 LLM5KccYYxqjay5yU14zQzXtTJnLxBJcoh+0RI67ttGPoU+VmKtBGz2Plx6vVdLM
 kK+onlXlKW8L04ep6mWaM0PrLS1nnLyeaG5yaGfs44QMaGNEH493m284+511o4Qk
 ZID+kXwF3wjQgRRbCC6aI9FgyUbNr4SPF6ooe0pjcQ6pgssDhDZjTTt3vyHVf0Hn
 SzOi5TCEr46P2hXGj3E2B+Y17syWiNLIQ9n0bTWzKslf+F/SgRlCGLZzmiYxMn+c
 zz1bZqM8RLacA0z0SjtnoAleeHbnPgoyP7l73l1PpfghvTzIiVHLJj8EOOk7ZDbw
 cvopBInVwOQlOdDy4xw==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazlp17011028.outbound.protection.outlook.com [40.93.67.28])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 42a37v8mbp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2024 14:32:01 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPFEdp5yX1PqpQzA8GUqK2uzBNDzlEhM6PhQ10GwBeLBgJUMBHe+RZeZoIW0wyG/5K3jBRxKHkKDhLZRT+M2dBQoZVkTsi1VDofO/4gY+VYMMwxkHbP90Pu1VXXk3+hQUUDt2OkMTIjgv+l4OxU4chR3oNFcXI92Dk9hnUl3c4rgaAq1Ifvgnto/R9uSWk++3PwAuhxqS3N6dPESEiFPu3fSoy4t3wjkFzhGZ1T4VyKCqvKSHoWU/eIU6nwesr6rym5n1XZ0cepiFf0+uTm1aqV2PU6Nic3Hmcj+RMbXPDqcUlEIorKyEhGO08wvqHDrjR3SitZQzuiJXVDE5htFDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FyUi40stkQDjfff75WGMr//7LmbQT7G214fMT/sJPOc=;
 b=NGi/Ylb2iVlE9IUc7DkP/D/LRwzoAPQdqmIgc7UiHVbdVofL9oM+ynKnDqWKt6AxJBJYRfS6OZvXy4MMgfdcWHtD0SY9qCeQ99y6F+EIaCuon0hSwj7Y1DIcBI/M7Y9hj0GXNh29sUlVz3ddHXPuphr1mnvHXjBioFOtt7p87xSH5EWm0g6KQ8Nao6wvaM0Nb6fa7IyMsUtBMxFj61C+hOQwZnzDNL08FBGxj4u7oyhsQfgXJvpTDxYIPPqPrVFnFrwdEs1G/Ngz8oyUMMz5Y8qe4F39m8J6SqHMw7f9XkL6GUzyDOASwdXUa67+/AAc2axj4GPe4d76TgzVe5QWpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyUi40stkQDjfff75WGMr//7LmbQT7G214fMT/sJPOc=;
 b=L8MJUbOsClp8oN0LwVfFlOgnTt1ZA3qIuGMpCC/HhjLw/15AJC5x7bG2WJr/B27Z2cHt4rqupyy7mkM1hwzgs4bKgBVUacM0pyArB9lowGLUJJZ2VacV9svEAWH0hthHRlT9egKyJR0l1CBi2RBCFgg9TMl96G/vmNX+aOSgfDM=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by LOYP265MB2175.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:121::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 13:31:59 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::db1a:5e96:699f:8757]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::db1a:5e96:699f:8757%4]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 13:31:59 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Matt
 Coster <Matt.Coster@imgtec.com>
CC: Brendan King <Brendan.King@imgtec.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Subject: Re: [PATCH v2 2/2] drm/imagination: Break an object reference loop
Thread-Topic: [PATCH v2 2/2] drm/imagination: Break an object reference loop
Thread-Index: AQHbHkSoxbEuRxbSg0yVD0nVOaLtobKJYvGA
Date: Wed, 16 Oct 2024 13:31:59 +0000
Message-ID: <b75e658cc5ce9ac24df2c31c1a6fd798a5f3a87f.camel@imgtec.com>
References: <bf5cdfa3-5196-485a-b5ed-5a0e698dfc40@imgtec.com>
 <48476abf-2def-4d83-87a3-8cbd8eb9db3b@imgtec.com>
In-Reply-To: <48476abf-2def-4d83-87a3-8cbd8eb9db3b@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|LOYP265MB2175:EE_
x-ms-office365-filtering-correlation-id: 4474c8c3-94da-4105-1151-08dcede6e9ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?R3Bzak9vclZLNlROYXlhUlA1bDdJVmllU1JtVWhXNWpTWGNIOXk4VnUvc01X?=
 =?utf-8?B?N01IS3BnNGRRelJlQk1XUHRqU3ZwbWtJQ2NEVWhXS2REejFFKzJNUGx1cG5H?=
 =?utf-8?B?WndoZkw3SzYxWWtPZU9BbDBuUjRIZTVmSnN2R3dGMEpyUVVJL1BPL3RNeGtj?=
 =?utf-8?B?Zk04Vm5tUFVOMkNlME45SGdpN0UveHpEdDdwdW9ydjZMYjQyVkxHQXZoYlJO?=
 =?utf-8?B?NzVKVHpDeU1oYnV3VEJZb1N6Z1pFQmtEL01hUWlxRzNpYVIxRExybDdadWxY?=
 =?utf-8?B?aGZOZTVYMXJ2Uk1KdjdEWERQU2lHdzJsTlZXNTN0NXZFQ2NITXZDVzVqRzI1?=
 =?utf-8?B?VjVrRGYyYVdSWjN2VHowcGZ1SnkwQUdOTHliNnFWNkxzck8vOWl0eGZuMFdv?=
 =?utf-8?B?b0k1VUoxeXVrSXdrY0tiT2NsOEdlRTdhMUlIdjE0WlJwc3BvL2p3OVRybGdZ?=
 =?utf-8?B?bkJabWRBWDU1VU5VQ3IxUXdjNFAxK1oyQ1hQWTFpSVllR29zN2puUnFodzZB?=
 =?utf-8?B?eC9wa3VDSGNPM1E5em1DcTFOOFFDNWIwakdyNFN0U2l1YzFDSllNS3lkSDVF?=
 =?utf-8?B?NmVVMm0vc0hvd3ZPMVVBTjBNNjQzSHFjNlM2VEdrRUk2bkNza2lTSGVVOUgx?=
 =?utf-8?B?dUo5OWo1S3VsNG04U1hhNlovbEVBcGQwQm1odmdpcnhHUEZXQjIxeHdiaGZY?=
 =?utf-8?B?Ri9OVDVGN2lYWE9XOGNsbjZEUDg1MnU2TENCRytNYVNwbitxY1VHK2wyQkkr?=
 =?utf-8?B?YzRlL2dueFFWRndPTXUwMHM4djhPdGVyRlNyRit2K21QV0NBOEpqQ2l2ckk0?=
 =?utf-8?B?NW1hOUFUUzV6d081RHZVRW9wK0Y3c3FxaUZHUDA5MlQ1Vk5oUXhUNWQ3WHQy?=
 =?utf-8?B?WUYyaXU4RUFPT29TZzhrcTV0YzR5ZXpUQ1VWai9LRE1QRnhMQ3ZjVk90N3ht?=
 =?utf-8?B?K3dyaEF5VVNhWGVMYmo0MENVRktaQi9HbFFBU3pwQVpWTlFBWnRNTXdOdE1B?=
 =?utf-8?B?clNqUUJ5bi82QnkwRXRxZWswT2V6d2ZkQ1h5dzVidW11TTAycTdBdHZGSnVT?=
 =?utf-8?B?Rkt6WUEvNjE4VGFHellaOElIVER4MW9iV3F3b2VOTnYrN3diMG90ZzE5WlZF?=
 =?utf-8?B?OXcwMnZhcHI0VFBSWnRDVXFtYmloaHVpVkVwYWRWeW9EVkNRVk1sNUw1M1Iv?=
 =?utf-8?B?RFhBZXRHTEVWdHhlT2xKSG1HVXRKUDNXc3RocEtBR28wdm9vbjJBT2hEaUE1?=
 =?utf-8?B?L2NBUXBDM2w1RlJFV3l2cyt4TGZwR2ZyRm10T0NzVGwyRW9icEpWTFM5eXVP?=
 =?utf-8?B?S1pCRjF0eUt2QXM0M1dsb1lDS2doWFBPckVVMUFRRzkrZWhxOXNBekdYZjBk?=
 =?utf-8?B?RlRNYjZuYmtPd0Nsb3Y0WEsvTkdDRnNMT3BTQTZ1K2NmUHdaNTFqRnFjUGJE?=
 =?utf-8?B?NjR5VjNNWWRTVVpWUDNKdVpLeWVZdEpTOVpXK1NSVEVzNUVvMmVpYnJYVjZh?=
 =?utf-8?B?NU9mdnFSUmxwVmRRNWFXTjlWVFBrUVNxMGxUMU43ejVNRnFYWXVxZTVrSXZ1?=
 =?utf-8?B?UmllV0I0Yk83U21iUGNLem1tdStqbG9aL0NodHRBU1hsSVh2TXJSVGNMT3Nj?=
 =?utf-8?B?NVdXZ3djY1NYSVNpZUF4N3NDMGdWeWt4aGg1d2JSc0xmeDBTanVFRXJDeStn?=
 =?utf-8?B?ejBoZU0xb3I1cDVmSFNaczlzVDhYNExEK1UwL3dLM2FpUjBvZ3lQQmh6aWZF?=
 =?utf-8?B?eUQ4UG11TEo2VUY3UlZsWnJPNFk3aHF0L3V0YlpPWTRNTEIvSmQvd0RCaGVE?=
 =?utf-8?B?RFhRNHVHTjFtM0J0dzBxZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WVEyNTRia29nZHFjTGJ3aU8ydjh5cVNYNmREQm1zYXRuUEFkaVlrYzEwS3M1?=
 =?utf-8?B?SWZPelliZWFCNUtIZm1CRDRWdjd1YklkZUEzdm5OalFvaGw2OFBsRXg2bGJj?=
 =?utf-8?B?dGUvY2MxSXpyTy9LSHRHY1k5bUFXTGw3TkZ5TDYzUThaeUt4RzBBNTkxdjMx?=
 =?utf-8?B?RXJtRTRwR1lSVGhIVFhXMy90ak1TQ3pYVEJpUXlzcEkrT0djY3ZpQ3FFUWo3?=
 =?utf-8?B?UnlHZnFGZWZ5Umo3VDVNbmQybzVoQS9ZRHBBNEYvdzFrKzFiZktYVTdwUlVj?=
 =?utf-8?B?bE1IaCtWZWpBZk4za0ladmltTzM5aXJVYmE4NWhsS1hFdWZIa0pVU0kwNkdL?=
 =?utf-8?B?TjdzemVJSUU5M1FCQ2VqQU05V2RidFlVOWc4ZWsvQktleXkzOTFZbFhhNEVm?=
 =?utf-8?B?ZExsQXFvV0pHa3pZUXdKOGhwTXF1b1lvUDV1R2pGWVZVZnh3NXJzL2hXdWo1?=
 =?utf-8?B?WkI5ZktWRDA4QmUrc09PMVpLWFh5TnJhME9uZTZROWRwMy9xbmp4MUFVMDZF?=
 =?utf-8?B?QUZ6ZU4zWGVSU2UyMkxRNzA5czRoYXJEdGNoZEdpLzFORnduUmFvSktMeWFs?=
 =?utf-8?B?MzBlZEN1bTVUbWE4M205ano2bTdFUUFWZ1gyRW56U1BoQ0I4UTlrS0lPQkdI?=
 =?utf-8?B?TnBIcm5qSWtBWlZVZG90YTdPY0poSURtSHhKZWRNdTF3YWtWbW1rNEVtYVFk?=
 =?utf-8?B?Vkl1aGtyZ1Z4cTRYUUxtMGlVeVpDWDN5eXRSakJFWDBrS285aHBEUUhOcmFU?=
 =?utf-8?B?SWhqamtoYThXZk84cGNuOWpLMkxLeEV4SU1YSVBveGdvSUUwWlZUQm93SUZD?=
 =?utf-8?B?Q0cvT0Z0ZG5DRHdDelFCZmxocjFtdW1XRVQ4YjZReVJTTzlJN3BDeTZ4b2xE?=
 =?utf-8?B?L29pN1g5bnUyR1A3b3JoMDYwV050Z2NyN1d2dC9ncFBKcHBuc2E4QTFBZnRR?=
 =?utf-8?B?enBYcWlVMnNqOEVHNytKTTVDRlFRV0QzZm11eTZFcGFyOTFLZGtJRnRraWph?=
 =?utf-8?B?bTB5SlZKUVdtbDg4djJzOVlOWFkxU1lTQjBpVlBKVkdhTTA2MkczaUcrc0pW?=
 =?utf-8?B?Mko4NVliYTVBZ2ZXN0R1NGFCNEhCeXR5aFlFQnNseW1pMmx1N1ZqNHl6YzNV?=
 =?utf-8?B?QVhrRkI5UHFLNTB2bVVJSVRQR3BMUld6VlUzalJsbWNweWRUWXFmV0ZvS2Vm?=
 =?utf-8?B?dnNheFlQdkRIUkRkZ0pXT3VVR2tKSndhSWc0Uy9uSjN2QkJ5QWltZzl0cGpT?=
 =?utf-8?B?d1pmMS9NOGY2UFg2bnFUWDY3bHd0dW9FT0M4WEtPNkkxczdjakZDNXRWU29E?=
 =?utf-8?B?NkZkcUhtbXFPQ3hWVUZSZXI2SUhPVm0zUnhxc1dpZU9Fd2ZqTVB5bllKblJm?=
 =?utf-8?B?a2tRcU80U1ovYjd1SXFmMDZkZTNrM1g2ZmhvdlU2aDlFUTV0WllRUVFQR1lh?=
 =?utf-8?B?QnlPVm42cnJxOGpMOUptSnE5UldRR1NpQVErYm9yRGhWRHpLUm9oaCtGWmYw?=
 =?utf-8?B?R25FMTRmZC9NUVNXenFBWnlkNTlGUjZ6WjF2UURnMklDUFRkNVFYcWxvS3Ur?=
 =?utf-8?B?ZGdDWE1kY1BNQ0VTWGQxcVFjN1ZsZDNDSk81RUlxZEl1Tkh1T3B0M0t2RGMx?=
 =?utf-8?B?UGlldXdaaHd0OENubkIvem93SE04RnU5eHMyenYvdHQ5Nit2YXJOYzdjdjZW?=
 =?utf-8?B?bGhvMHJYaW15MjBUeEk2eWRYVUM0VUZvSVpML09GSEt4ZXN3Ynd0aVdJRlcv?=
 =?utf-8?B?MTVzSHVYWFFIWlJLYk1XZXFpa3ZqZHp4M0I2VVI0SmxQZ2VMVEVqZCtDR3Vx?=
 =?utf-8?B?Z0RFUEFYVTVqTjBsRGJMSHVDajh6ZnZXbURDR0k2WlhRVTFRQnE2ajVSWlBQ?=
 =?utf-8?B?WjlsNlV5a29tZ3FGZXNLaWRHUTZBbmJNblZ1R1RMUjBBTUNDYThoLzVaaG5Y?=
 =?utf-8?B?WFFnSHZVdG1GM3FZRG04WDBzV3I1TUhBWU4zUjFLdTgzL0g4Z201KytoelpI?=
 =?utf-8?B?SUhhUHpHcXFIbU9udmxTblRnVjh3R1d3YjIvTHZ0bENVeVBwY3FEb09CS0hq?=
 =?utf-8?B?b0RwMFQwS0ozbU1VWjJwTEJENFpvaXZaRkdqOTlRcS9CZXhsTTBKUmdObGJr?=
 =?utf-8?B?SkVaMVhnOWM3YUhNTktPdzRkTWRsemlhQklYZXNKaC9HNEpyWjRQOWdmNDZu?=
 =?utf-8?B?eWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3B9361FDC33677499C9144D53876875F@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4474c8c3-94da-4105-1151-08dcede6e9ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2024 13:31:59.8117 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bx1HfamuKW4xFqGYIbaCklnRbfy5CgJTxU6lsW9rsM5HGXpSEnwTr/YG4V3JI616K47LDQLQ28kCEpGVtw4Tjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2175
X-Proofpoint-GUID: Kt9enS7zVD5NPDsiCfhpMxSVsphf8_vQ
X-Authority-Analysis: v=2.4 cv=N5V7FH9B c=1 sm=1 tr=0 ts=670fc051 cx=c_pps
 a=ZtDQTGtOy2YOIGqCdxPGBA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=WnR_qW7rlZcA:10
 a=NgoYpvdbvlAA:10 a=r_1tXGB3AAAA:8
 a=3IbXFLT-nbE9uVjRAGYA:9 a=QEXdDO2ut3YA:10 a=Yfubz3HjuUhqnU44vIix:22
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: Kt9enS7zVD5NPDsiCfhpMxSVsphf8_vQ
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

T24gTW9uLCAyMDI0LTEwLTE0IGF0IDE0OjIzICswMDAwLCBNYXR0IENvc3RlciB3cm90ZToNCj4g
RnJvbTogQnJlbmRhbiBLaW5nIDxicmVuZGFuLmtpbmdAaW1ndGVjLmNvbT4NCj4gDQo+IFdoZW4g
cmVtYWluaW5nIHJlc291cmNlcyBhcmUgYmVpbmcgY2xlYW5lZCB1cCBvbiBkcml2ZXIgY2xvc2Us
DQo+IG91dHN0YW5kaW5nIFZNIG1hcHBpbmdzIG1heSByZXN1bHQgaW4gcmVzb3VyY2VzIGJlaW5n
IGxlYWtlZCwgZHVlDQo+IHRvIGFuIG9iamVjdCByZWZlcmVuY2UgbG9vcCwgYXMgc2hvd24gYmVs
b3csIHdpdGggZWFjaCBvYmplY3QgKG9yDQo+IHNldCBvZiBvYmplY3RzKSByZWZlcmVuY2luZyB0
aGUgb2JqZWN0IGJlbG93IGl0Og0KPiANCj4gICAgIFBWUiBHRU0gT2JqZWN0DQo+ICAgICBHUFUg
c2NoZWR1bGVyICJmaW5pc2hlZCIgZmVuY2UNCj4gICAgIEdQVSBzY2hlZHVsZXIg4oCcc2NoZWR1
bGVk4oCdIGZlbmNlDQo+ICAgICBQVlIgZHJpdmVyIOKAnGRvbmXigJ0gZmVuY2UNCj4gICAgIFBW
UiBDb250ZXh0DQo+ICAgICBQVlIgVk0gQ29udGV4dA0KPiAgICAgUFZSIFZNIE1hcHBpbmdzDQo+
ICAgICBQVlIgR0VNIE9iamVjdA0KPiANCj4gVGhlIHJlZmVyZW5jZSB0aGF0IHRoZSBQVlIgVk0g
Q29udGV4dCBoYXMgb24gdGhlIFZNIG1hcHBpbmdzIGlzIGENCj4gc29mdCBvbmUsIGluIHRoZSBz
ZW5zZSB0aGF0IHRoZSBmcmVlaW5nIG9mIG91dHN0YW5kaW5nIFZNIG1hcHBpbmdzDQo+IGlzIGRv
bmUgYXMgcGFydCBvZiBWTSBjb250ZXh0IGRlc3RydWN0aW9uOyBubyByZWZlcmVuY2UgY291bnRz
IGFyZQ0KPiBpbnZvbHZlZCwgYXMgaXMgdGhlIGNhc2UgZm9yIGFsbCB0aGUgb3RoZXIgcmVmZXJl
bmNlcyBpbiB0aGUgbG9vcC4NCj4gDQo+IFRvIGJyZWFrIHRoZSByZWZlcmVuY2UgbG9vcCBkdXJp
bmcgY2xlYW51cCwgZnJlZSB0aGUgb3V0c3RhbmRpbmcNCj4gVk0gbWFwcGluZ3MgYmVmb3JlIGRl
c3Ryb3lpbmcgdGhlIFBWUiBDb250ZXh0IGFzc29jaWF0ZWQgd2l0aCB0aGUNCj4gVk0gY29udGV4
dC4NCj4gDQoNClJldmlld2VkLWJ5OiBGcmFuayBCaW5ucyA8ZnJhbmsuYmlubnNAaW1ndGVjLmNv
bT4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBCcmVuZGFuIEtpbmcgPGJyZW5kYW4ua2luZ0BpbWd0ZWMu
Y29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0IENvc3RlciA8bWF0dC5jb3N0ZXJAaW1ndGVjLmNv
bT4NCj4gLS0tDQo+IENoYW5nZXMgaW4gdjEgLT4gdjI6DQo+ICAtIE5vbmUNCj4gLS0tDQo+ICBk
cml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX2NvbnRleHQuYyB8IDE5ICsrKysrKysrKysr
KysrKysrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfY29udGV4dC5oIHwg
MTggKysrKysrKysrKysrKysrKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZy
X3ZtLmMgICAgICB8IDIyICsrKysrKysrKysrKysrKysrKy0tLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9pbWFnaW5hdGlvbi9wdnJfdm0uaCAgICAgIHwgIDEgKw0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA1
NiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfY29udGV4dC5jIGIvZHJpdmVycy9ncHUvZHJtL2lt
YWdpbmF0aW9uL3B2cl9jb250ZXh0LmMNCj4gaW5kZXggMjU1YzkzNTgyNzM0Li40Y2IzNDk0YzBi
YjIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfY29udGV4
dC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfY29udGV4dC5jDQo+
IEBAIC00NTAsMTEgKzQ1MCwzMCBAQCBwdnJfY29udGV4dF9kZXN0cm95KHN0cnVjdCBwdnJfZmls
ZSAqcHZyX2ZpbGUsIHUzMiBoYW5kbGUpDQo+ICAgKi8NCj4gIHZvaWQgcHZyX2Rlc3Ryb3lfY29u
dGV4dHNfZm9yX2ZpbGUoc3RydWN0IHB2cl9maWxlICpwdnJfZmlsZSkNCj4gIHsNCj4gKwlzdHJ1
Y3QgcHZyX2RldmljZSAqcHZyX2RldiA9IHB2cl9maWxlLT5wdnJfZGV2Ow0KPiAgCXN0cnVjdCBw
dnJfY29udGV4dCAqY3R4Ow0KPiAgCXVuc2lnbmVkIGxvbmcgaGFuZGxlOw0KPiAgDQo+ICAJeGFf
Zm9yX2VhY2goJnB2cl9maWxlLT5jdHhfaGFuZGxlcywgaGFuZGxlLCBjdHgpDQo+ICAJCXB2cl9j
b250ZXh0X2Rlc3Ryb3kocHZyX2ZpbGUsIGhhbmRsZSk7DQo+ICsNCj4gKwlzcGluX2xvY2soJnB2
cl9kZXYtPmN0eF9saXN0X2xvY2spOw0KPiArCWN0eCA9IGxpc3RfZmlyc3RfZW50cnkoJnB2cl9m
aWxlLT5jb250ZXh0cywgc3RydWN0IHB2cl9jb250ZXh0LCBmaWxlX2xpbmspOw0KPiArDQo+ICsJ
d2hpbGUgKCFsaXN0X2VudHJ5X2lzX2hlYWQoY3R4LCAmcHZyX2ZpbGUtPmNvbnRleHRzLCBmaWxl
X2xpbmspKSB7DQo+ICsJCWxpc3RfZGVsX2luaXQoJmN0eC0+ZmlsZV9saW5rKTsNCj4gKw0KPiAr
CQlpZiAocHZyX2NvbnRleHRfZ2V0X2lmX3JlZmVyZW5jZWQoY3R4KSkgew0KPiArCQkJc3Bpbl91
bmxvY2soJnB2cl9kZXYtPmN0eF9saXN0X2xvY2spOw0KPiArDQo+ICsJCQlwdnJfdm1fdW5tYXBf
YWxsKGN0eC0+dm1fY3R4KTsNCj4gKw0KPiArCQkJcHZyX2NvbnRleHRfcHV0KGN0eCk7DQo+ICsJ
CQlzcGluX2xvY2soJnB2cl9kZXYtPmN0eF9saXN0X2xvY2spOw0KPiArCQl9DQo+ICsJCWN0eCA9
IGxpc3RfZmlyc3RfZW50cnkoJnB2cl9maWxlLT5jb250ZXh0cywgc3RydWN0IHB2cl9jb250ZXh0
LCBmaWxlX2xpbmspOw0KPiArCX0NCj4gKwlzcGluX3VubG9jaygmcHZyX2Rldi0+Y3R4X2xpc3Rf
bG9jayk7DQo+ICB9DQo+ICANCj4gIC8qKg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2ltYWdpbmF0aW9uL3B2cl9jb250ZXh0LmggYi9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24v
cHZyX2NvbnRleHQuaA0KPiBpbmRleCBhNWIwYTgyYTU0YTEuLjA3YWZhMTc5Y2RmNCAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9jb250ZXh0LmgNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9jb250ZXh0LmgNCj4gQEAgLTEyNiw2
ICsxMjYsMjQgQEAgcHZyX2NvbnRleHRfZ2V0KHN0cnVjdCBwdnJfY29udGV4dCAqY3R4KQ0KPiAg
CXJldHVybiBjdHg7DQo+ICB9DQo+ICANCj4gKy8qKg0KPiArICogcHZyX2NvbnRleHRfZ2V0X2lm
X3JlZmVyZW5jZWQoKSAtIFRha2UgYW4gYWRkaXRpb25hbCByZWZlcmVuY2Ugb24gYSBzdGlsbA0K
PiArICogcmVmZXJlbmNlZCBjb250ZXh0Lg0KPiArICogQGN0eDogQ29udGV4dCBwb2ludGVyLg0K
PiArICoNCj4gKyAqIENhbGwgcHZyX2NvbnRleHRfcHV0KCkgdG8gcmVsZWFzZS4NCj4gKyAqDQo+
ICsgKiBSZXR1cm5zOg0KPiArICogICogVHJ1ZSBvbiBzdWNjZXNzLCBvcg0KPiArICogICogZmFs
c2UgaWYgbm8gY29udGV4dCBwb2ludGVyIHBhc3NlZCwgb3IgdGhlIGNvbnRleHQgd2Fzbid0IHN0
aWxsDQo+ICsgKiAgKiByZWZlcmVuY2VkLg0KPiArICovDQo+ICtzdGF0aWMgX19hbHdheXNfaW5s
aW5lIGJvb2wNCj4gK3B2cl9jb250ZXh0X2dldF9pZl9yZWZlcmVuY2VkKHN0cnVjdCBwdnJfY29u
dGV4dCAqY3R4KQ0KPiArew0KPiArCXJldHVybiBjdHggIT0gTlVMTCAmJiBrcmVmX2dldF91bmxl
c3NfemVybygmY3R4LT5yZWZfY291bnQpICE9IDA7DQo+ICt9DQo+ICsNCj4gIC8qKg0KPiAgICog
cHZyX2NvbnRleHRfbG9va3VwKCkgLSBMb29rdXAgY29udGV4dCBwb2ludGVyIGZyb20gaGFuZGxl
IGFuZCBmaWxlLg0KPiAgICogQHB2cl9maWxlOiBQb2ludGVyIHRvIHB2cl9maWxlIHN0cnVjdHVy
ZS4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfdm0uYyBi
L2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfdm0uYw0KPiBpbmRleCA5N2MwZjc3MmVk
NjUuLjdiZDZiYTRjNmU4YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0
aW9uL3B2cl92bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfdm0u
Yw0KPiBAQCAtMTQsNiArMTQsNyBAQA0KPiAgI2luY2x1ZGUgPGRybS9kcm1fZ2VtLmg+DQo+ICAj
aW5jbHVkZSA8ZHJtL2RybV9ncHV2bS5oPg0KPiAgDQo+ICsjaW5jbHVkZSA8bGludXgvYnVnLmg+
DQo+ICAjaW5jbHVkZSA8bGludXgvY29udGFpbmVyX29mLmg+DQo+ICAjaW5jbHVkZSA8bGludXgv
ZXJyLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvZXJybm8uaD4NCj4gQEAgLTU5NywxMiArNTk4LDI2
IEBAIHB2cl92bV9jcmVhdGVfY29udGV4dChzdHJ1Y3QgcHZyX2RldmljZSAqcHZyX2RldiwgYm9v
bCBpc191c2Vyc3BhY2VfY29udGV4dCkNCj4gIH0NCj4gIA0KPiAgLyoqDQo+IC0gKiBwdnJfdm1f
Y29udGV4dF9yZWxlYXNlKCkgLSBUZWFyZG93biBhIFZNIGNvbnRleHQuDQo+IC0gKiBAcmVmX2Nv
dW50OiBQb2ludGVyIHRvIHJlZmVyZW5jZSBjb3VudGVyIG9mIHRoZSBWTSBjb250ZXh0Lg0KPiAr
ICogcHZyX3ZtX3VubWFwX2FsbCgpIC0gVW5tYXAgYWxsIG1hcHBpbmdzIGFzc29jaWF0ZWQgd2l0
aCBhIFZNIGNvbnRleHQuDQo+ICsgKiBAdm1fY3R4OiBUYXJnZXQgVk0gY29udGV4dC4NCj4gICAq
DQo+ICAgKiBUaGlzIGZ1bmN0aW9uIGVuc3VyZXMgdGhhdCBubyBtYXBwaW5ncyBhcmUgbGVmdCBk
YW5nbGluZyBieSB1bm1hcHBpbmcgdGhlbQ0KPiAgICogYWxsIGluIG9yZGVyIG9mIGFzY2VuZGlu
ZyBkZXZpY2UtdmlydHVhbCBhZGRyZXNzLg0KPiAgICovDQo+ICt2b2lkDQo+ICtwdnJfdm1fdW5t
YXBfYWxsKHN0cnVjdCBwdnJfdm1fY29udGV4dCAqdm1fY3R4KQ0KPiArew0KPiArCVdBUk5fT04o
cHZyX3ZtX3VubWFwKHZtX2N0eCwgdm1fY3R4LT5ncHV2bV9tZ3IubW1fc3RhcnQsDQo+ICsJCQkg
ICAgIHZtX2N0eC0+Z3B1dm1fbWdyLm1tX3JhbmdlKSk7DQo+ICt9DQo+ICsNCj4gKy8qKg0KPiAr
ICogcHZyX3ZtX2NvbnRleHRfcmVsZWFzZSgpIC0gVGVhcmRvd24gYSBWTSBjb250ZXh0Lg0KPiAr
ICogQHJlZl9jb3VudDogUG9pbnRlciB0byByZWZlcmVuY2UgY291bnRlciBvZiB0aGUgVk0gY29u
dGV4dC4NCj4gKyAqDQo+ICsgKiBUaGlzIGZ1bmN0aW9uIGFsc28gZW5zdXJlcyB0aGF0IG5vIG1h
cHBpbmdzIGFyZSBsZWZ0IGRhbmdsaW5nIGJ5IGNhbGxpbmcNCj4gKyAqIHB2cl92bV91bm1hcF9h
bGwuDQo+ICsgKi8NCj4gIHN0YXRpYyB2b2lkDQo+ICBwdnJfdm1fY29udGV4dF9yZWxlYXNlKHN0
cnVjdCBrcmVmICpyZWZfY291bnQpDQo+ICB7DQo+IEBAIC02MTIsOCArNjI3LDcgQEAgcHZyX3Zt
X2NvbnRleHRfcmVsZWFzZShzdHJ1Y3Qga3JlZiAqcmVmX2NvdW50KQ0KPiAgCWlmICh2bV9jdHgt
PmZ3X21lbV9jdHhfb2JqKQ0KPiAgCQlwdnJfZndfb2JqZWN0X2Rlc3Ryb3kodm1fY3R4LT5md19t
ZW1fY3R4X29iaik7DQo+ICANCj4gLQlXQVJOX09OKHB2cl92bV91bm1hcCh2bV9jdHgsIHZtX2N0
eC0+Z3B1dm1fbWdyLm1tX3N0YXJ0LA0KPiAtCQkJICAgICB2bV9jdHgtPmdwdXZtX21nci5tbV9y
YW5nZSkpOw0KPiArCXB2cl92bV91bm1hcF9hbGwodm1fY3R4KTsNCj4gIA0KPiAgCXB2cl9tbXVf
Y29udGV4dF9kZXN0cm95KHZtX2N0eC0+bW11X2N0eCk7DQo+ICAJZHJtX2dlbV9wcml2YXRlX29i
amVjdF9maW5pKCZ2bV9jdHgtPmR1bW15X2dlbSk7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaW1hZ2luYXRpb24vcHZyX3ZtLmggYi9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24v
cHZyX3ZtLmgNCj4gaW5kZXggZjJhNjQ2M2YyYjA1Li43OTQwNjI0MzYxN2MgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfdm0uaA0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX3ZtLmgNCj4gQEAgLTM5LDYgKzM5LDcgQEAgaW50IHB2
cl92bV9tYXAoc3RydWN0IHB2cl92bV9jb250ZXh0ICp2bV9jdHgsDQo+ICAJICAgICAgIHN0cnVj
dCBwdnJfZ2VtX29iamVjdCAqcHZyX29iaiwgdTY0IHB2cl9vYmpfb2Zmc2V0LA0KPiAgCSAgICAg
ICB1NjQgZGV2aWNlX2FkZHIsIHU2NCBzaXplKTsNCj4gIGludCBwdnJfdm1fdW5tYXAoc3RydWN0
IHB2cl92bV9jb250ZXh0ICp2bV9jdHgsIHU2NCBkZXZpY2VfYWRkciwgdTY0IHNpemUpOw0KPiAr
dm9pZCBwdnJfdm1fdW5tYXBfYWxsKHN0cnVjdCBwdnJfdm1fY29udGV4dCAqdm1fY3R4KTsNCj4g
IA0KPiAgZG1hX2FkZHJfdCBwdnJfdm1fZ2V0X3BhZ2VfdGFibGVfcm9vdF9hZGRyKHN0cnVjdCBw
dnJfdm1fY29udGV4dCAqdm1fY3R4KTsNCj4gIHN0cnVjdCBkbWFfcmVzdiAqcHZyX3ZtX2dldF9k
bWFfcmVzdihzdHJ1Y3QgcHZyX3ZtX2NvbnRleHQgKnZtX2N0eCk7DQo=
