Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6013BA820
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jul 2021 11:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B629A6E1E9;
	Sat,  3 Jul 2021 09:45:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326CF6E1D3;
 Sat,  3 Jul 2021 09:45:29 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1639ZTNm015885; Sat, 3 Jul 2021 09:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2020-01-29; bh=zLHEU8iuFjwsZ/vyp00w6X1Vn25YOzwVoW/n+bstQBU=;
 b=WHZuFKatAjsPXogHuVWiTx8ESLtYxCluE033CXOQlbQSYta66DKKzNl7/7rf1Lktq4nk
 6oAEyE6bdTFs8oG/Uog/X7KP4t2xLk+CZ+6nx09/ncFxZkBPPHR3wyxj1np5e1yakzJf
 JiUiWsitm9jgtuNPGA4TO48+7l4Zh0EDTIiajR/OUpphkdYVzd470s6cwVSMUATzBPF9
 Ig9fQYmOBQZFfKzawhoao9Du7JPVps2adyrSPmZGe0VRrCY4PNpCKirW/35uaBPJ45WE
 n6NSHVcBGCfWyJI3TbrPdUth7o41CxkK8iBf8le9/beENIf2iLoJRkBP8e1Gr6XcpaEk Jg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39jeacg9y4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 03 Jul 2021 09:45:25 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1639aF2p189128;
 Sat, 3 Jul 2021 09:45:24 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2041.outbound.protection.outlook.com [104.47.73.41])
 by aserp3030.oracle.com with ESMTP id 39jdxbg4u1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 03 Jul 2021 09:45:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knJm7gn3HScOjC5E8meKRLfVYq9OF7qcr1LpkMJJ1rsEi1G8NCzTSerS5LBkIvQYtrDY0tPtFnXs1T2Xk4nvaAjtO2E6dj4v+zGldP3AhUKSbSIJz51cMBOt7hiPn2qWw0EFnF44e++mjHL9YQJOqEGOBP9hqiDlQ/IUEg4lDbhiRRQfnqAyYVHyTfn+31guhZgf01qIAC5dDOoJVwh9mKKf3CrynwqAg22eRjO3DYMgzm21QCQbOclnu71gaSjZEOZkyK//hRbxjfVNW0JiIB1PVlEA6CcpHHrrh8ypzPI2i+V4qi8yNJ7+/Z2mUX0TNHpG6o0guNBZou4bIUWqFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLHEU8iuFjwsZ/vyp00w6X1Vn25YOzwVoW/n+bstQBU=;
 b=fnCy/m27vpTvYAEx2E9wye2zYIf1M2OIYw5TW+hd4iaEQvAcLJV3YfTiWpkaQZWxGqkaxkeYOTgMYoUUmCS/BRjrJ0yE9U9f4kcvvcTy9EUI3ZmWdvynM6JXwUo3dXlsq72hNff3USCsPPlGtU9eoMYwQyM217EIEglhhH7j+trlbOFKunIHhw/0AB95SCuhvSW2deHFPZ9N4+9PjquBOfBfhxcFPCb95RlcRf9gbL2wkW1tzpo51Gqt6UB0XFOhL6PfUrsyjFc+vKFrwbMYIs7gOPYEUuD5Qr7/nxiMwOLVodKmCkBsrfW/rmElJuTT5kFs6Sh1bs7p0oCOdr3ZLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLHEU8iuFjwsZ/vyp00w6X1Vn25YOzwVoW/n+bstQBU=;
 b=EH6w1uX1eetC2XE/rTwbWnmuGOLUQ8Qb/EfVEfoJ9jtvcMpLYVPjQmMuwLh7zW0mFdfTtIOYgrOpSL6R8q2xtLYcHygMga6bFYfvOamMqmgozn1IR/HJSKZCcM8/aguZiqiCbOGcA/vxNF/kcMeGnhL6O7GghzvVMHj456CUavY=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1616.namprd10.prod.outlook.com
 (2603:10b6:301:9::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Sat, 3 Jul
 2021 09:45:23 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3413:3c61:5067:ba73]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3413:3c61:5067:ba73%5]) with mapi id 15.20.4287.030; Sat, 3 Jul 2021
 09:45:23 +0000
Date: Sat, 3 Jul 2021 12:44:57 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>
Subject: [PATCH 2/4] drm/amdgpu: Fix signedness bug in __amdgpu_eeprom_xfer()
Message-ID: <YOAxmdgHju990Wbd@mwanda>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YOAsdyWeZAHF0oll@mwanda>
X-Mailer: git-send-email haha only kidding
X-Originating-IP: [102.222.70.252]
X-ClientProxiedBy: JNAP275CA0011.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::16)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mwanda (102.222.70.252) by
 JNAP275CA0011.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.21 via Frontend Transport; Sat, 3 Jul 2021 09:45:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e40d6057-6c7e-47cc-18d6-08d93e07470a
X-MS-TrafficTypeDiagnostic: MWHPR10MB1616:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB16167B92AE919D3F495BE5648E1E9@MWHPR10MB1616.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BXU8Itkxhe+bYp4F01+hpJdrNSQ7sfds2zHly0amgFM7kizbsV8o7fAP38ldNnxxnH9JpW3eXKfRuPDLnT52he7Y0MwTmf+0y+daTgYws0pc8uH1t+OmvJOB6ylR78wOs/y3FYUVGiGKVk+TN1/9KVHQm/4l1rhdLBhZVbIg3gD6uLC/SMD0RVwvRNy3U+42h9UhqzKYE18NfVGGW23eqsvrvTzXtRkVtH+CZFVxkrAbnsZtJZsRDlH0CCyvaSjOR67kVEKhXZq8eGUhTWFW51V5VwAD4jm/wtNVYjOxyyTmjTUSw+ZwwX9rvDyJnRIy5BZjlXI6BKDKQJCuLN3swHNL7qRv4Ojnpr6OfNeVWdAXFXms2EBGk018oPpGJ3CS+qDcl7+k0wjmkbjFwaPxFVWeGQChStsP9zpMBtTwOBeti/nBlbNeLDDFH3LxLsquWeVPL4turZ2g9ZUfr1qE3205T8Ffiw1FWfi2TQHyXIGYfdS40Pe/StJLlDEMSTQ/d+gFFDIqdm6N+M19mfieouOb9VHsAgnb6yF/DPklp1BnTzuWbTMwXY2gP9qy4OPXicROYM6nivzLvd5YD98zzfgggE1zWmbQ7sYvv5aqsfsiU28AP+SDgfb8cPx17sUjlmR3LBX+GS9A9H/CiPxwvquaR0SQsMQw4+YbXULd6c8Dg/+bTioix89gTnVXXcbNb/x7QLwKF/6zw5GiphEoWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(396003)(366004)(39860400002)(136003)(52116002)(6496006)(66556008)(66476007)(8676002)(2906002)(6666004)(33716001)(38350700002)(4326008)(7416002)(66946007)(38100700002)(44832011)(26005)(83380400001)(316002)(86362001)(110136005)(5660300002)(9576002)(54906003)(956004)(478600001)(186003)(55016002)(8936002)(9686003)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4d5KcguEoHxuDpL4ccyktC+cLZ0GmYa5GrgOuucnb0DKBWYXOR/cDNMI8sGX?=
 =?us-ascii?Q?k8Zy1thbFGSULxZit2GzgXi1FZEFMZobmX2/wJk2xttWK/R12tHZ/RJL2uf0?=
 =?us-ascii?Q?yyOZZbXGMqOyl2jMJkqhhS8vm/YhDWUDxm+nAmBxJGzhUDKOBLiKKR9cSLPu?=
 =?us-ascii?Q?6F15LE8nqlr+XuQUUmsdnEs/jcx5zv/IlQQPKHEnQjnie1abssNzAhKinH5t?=
 =?us-ascii?Q?c4BgZ7UFgJRwlZK6vZ0Jvies6kadjb38+FGX/OLm2otW/bio7ObBTUZDtbAu?=
 =?us-ascii?Q?Iw/6ZSW/gTCkmcK/c02uiQtshBBHxcJ0an4xQLOuf5iPDvpvM1CedstiabL7?=
 =?us-ascii?Q?++fiRyPtrKYlSGliCHxOyGK/4h/elyWwsrqVV5nSTh0snMbLnz1P1K0qDpCd?=
 =?us-ascii?Q?X5kZJGssptlpeRJnBgGlbJXRezqixANPawZhLuC5l6Gy9zO0f9Hv85o8z6N1?=
 =?us-ascii?Q?6mwJh6i/AEX9DTiui4nBUE13f+xj+aiPs8pGVEypbXWam8sYq81EYbk1XRrN?=
 =?us-ascii?Q?dR6P8zEZ6YiCMInmrNiS1k5qN8F9lQqM29kPm8RUDQTLsrmBLd3+fSMnNLJX?=
 =?us-ascii?Q?8Q6rAAZ6S5u21db1OA5/z18N9FqhOsvXINH0ivsRbRaZN2j5cJDw7eV1YKgx?=
 =?us-ascii?Q?npPwoGjGx7jWxSpYumj1Ti67JpDNm/IXls0vGpxJZ0fta38jN5p6ewjnw3B4?=
 =?us-ascii?Q?EtAecfUENFCUP1ooYgkl6szLNqOIocAqtUL2MxlqinUrd2dCVNNGYzktt7FB?=
 =?us-ascii?Q?ABsa9SHG/ki6V5YuL1NBCPsXF0r2XKKggKV2SnUw+s5OaqhPe21rnqLGT53i?=
 =?us-ascii?Q?Ay9n1REnJG/MfqzJXJCYXjULE6VuNInbU0zFP2LBcu8JDz8UgKxt9cDgQlJ9?=
 =?us-ascii?Q?aWjqZ1SuVlugvQu0UoPJKRl4SANPRmRNoVYwTr7MHOR6jfq3D3fDWuz7AJ0S?=
 =?us-ascii?Q?UWstAIOAKeZphD5CB4KlBIFTMw+eAT4+dOzyoJDUo2RyoMdPWp8fFxi8vRBF?=
 =?us-ascii?Q?H5e5O+ZLhHPzV0IGVh/FpYzgSWMPzaTInJyocqqrhm12H+aSPkOtBkKmZ+0z?=
 =?us-ascii?Q?EfjRuGl94EwuZq+IJ2Hvoe8g037SM+07PiVdVJjninrGnWirY47UCCdELQ6+?=
 =?us-ascii?Q?EnxKG6lvwEfFZoS/xp6CJKYQJ7S0+71qS8VZBvorcUGw7VY2HeYzVLaAScZr?=
 =?us-ascii?Q?lnxBh7UAKPaBust5cEn60z0ZFQChk7d9/0taY/XafyBWG+PmElLRQ5uiz8dS?=
 =?us-ascii?Q?Rry44AY8BCDNDP1etwe3EJDbQdISPhgOPXLWTAagVR/+q3PgL6tVhJkAeusp?=
 =?us-ascii?Q?XcY2QZ5rEb49Vx23glH2WMV3?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e40d6057-6c7e-47cc-18d6-08d93e07470a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2021 09:45:22.8652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mCJIa/dJbQpOPOTHEKMKPrmGrCIaT90/voz7W6+AgGcs3joq74DibHPM0TXfafGI6Iurlr4jMPbJlp8gJBTfqcI19CgEALc8Dik2PMdhKBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1616
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10033
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 spamscore=0 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107030059
X-Proofpoint-GUID: xIAlsBPnwupXfzUu7RgVsHAMr4ekrWM3
X-Proofpoint-ORIG-GUID: xIAlsBPnwupXfzUu7RgVsHAMr4ekrWM3
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 kernel-janitors@vger.kernel.org, Roman Li <roman.li@amd.com>,
 amd-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 Bindu Ramamurthy <bindu.r@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The i2c_transfer() function returns negatives or else the number of
messages transferred.  This code does not work because ARRAY_SIZE()
is type size_t and so that means negative values of "r" are type
promoted to high positive values which are greater than the ARRAY_SIZE().

Fix this by changing the < to != which works regardless of type
promotion.

Fixes: 6cda0af81a50 ("drm/amdgpu: Fixes to the AMDGPU EEPROM driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c
index 4c3c65a5acae..4d9eb0137f8c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c
@@ -147,7 +147,7 @@ static int __amdgpu_eeprom_xfer(struct i2c_adapter *i2c_adap, u32 eeprom_addr,
 		/* This constitutes a START-STOP transaction.
 		 */
 		r = i2c_transfer(i2c_adap, msgs, ARRAY_SIZE(msgs));
-		if (r < ARRAY_SIZE(msgs))
+		if (r != ARRAY_SIZE(msgs))
 			break;
 
 		if (!read) {
-- 
2.30.2

