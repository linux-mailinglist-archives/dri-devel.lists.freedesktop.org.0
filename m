Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F21D1CB3E83
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 21:01:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146C510E02F;
	Wed, 10 Dec 2025 20:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=akamai.com header.i=@akamai.com header.b="HAurG7VT";
	dkim=pass (1024-bit key; unprotected) header.d=akamai365.onmicrosoft.com header.i=@akamai365.onmicrosoft.com header.b="Av1r/957";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00190b01.pphosted.com (mx0b-00190b01.pphosted.com
 [67.231.157.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E130F10E02F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 20:01:19 +0000 (UTC)
Received: from pps.filterd (m0122330.ppops.net [127.0.0.1])
 by mx0b-00190b01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BADR8A21440649; Wed, 10 Dec 2025 19:09:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=jan2016.eng;
 bh=HgEp69NhTCDItkqR20cD+aAshOiWasMoPqOlrPlnT38=; b=HAurG7VTkTvn
 kJx4DfvX9c8r9eUPzbevwVRSEbop+yuoZnxb5QEpXNnVa40VszdTmyrMepM6J1Hl
 nJStPfVIdA5GPjC8mIWsxaevNCWpgu00rTzaR9aa18bGx0SzOmc+b8KP/LZ9jhLu
 E5337BdkKBbxI1q10zgZzrZRz4m9RCWyo3zRLlrv1rxZg49W0pdgJMMreN9ppEhb
 tk5F/LE6SN7Scd0Jg1Hs+D5TtUKT+9kIDAkFXdQDfS1xhYtG+r1QxTrP6fv7gqHu
 DoM4XDpSYcobgqTbl5K6SYo/YxHLdMPDK7ykg3pQOnXPcolnlYBxjkRbESZTSSe3
 xfPXqH5+8w==
Received: from prod-mail-ppoint5 (prod-mail-ppoint5.akamai.com [184.51.33.60])
 by mx0b-00190b01.pphosted.com (PPS) with ESMTPS id 4axq7kqyxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Dec 2025 19:09:41 +0000 (GMT)
Received: from pps.filterd (prod-mail-ppoint5.akamai.com [127.0.0.1])
 by prod-mail-ppoint5.akamai.com (8.18.1.2/8.18.1.2) with ESMTP id
 5BAHFfIX029173; Wed, 10 Dec 2025 11:09:40 -0800
Received: from email.msg.corp.akamai.com ([172.27.50.221])
 by prod-mail-ppoint5.akamai.com (PPS) with ESMTPS id 4avkbe1aps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Dec 2025 11:09:40 -0800
Received: from ustx2ex-dag4mb3.msg.corp.akamai.com (172.27.50.202) by
 ustx2ex-dag5mb4.msg.corp.akamai.com (172.27.50.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 11:09:39 -0800
Received: from ustx2ex-exedge3.msg.corp.akamai.com (172.27.50.214) by
 ustx2ex-dag4mb3.msg.corp.akamai.com (172.27.50.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 10 Dec 2025 11:09:39 -0800
Received: from DM2PR0701CU001.outbound.protection.outlook.com (72.247.45.132)
 by ustx2ex-exedge3.msg.corp.akamai.com (172.27.50.214) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 10 Dec 2025 13:09:39 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsVA2R/spzoKDsBsyCcFa6M7Fk5SD/PbUwllA2IMcsuXTk9pXaty2ZE1+EL89Nihl5JQWH6FtBxQbKgghxun4Dvx7emCiUgi0GedgZsKeDjgbARiwHQBCFofEbsze3P/FK2tK8rUeFjhFmxI2O+wGB4TgC6mZN4/ajs8Ub3o46ez1Umra0tOqcJW7tcNAPhqC/GmPZ3UAobhhOBNpGm38S/AjLc60w9HOIE6huQ87lATQpSbmgUaIJtZ6pK/J37JwifkhLi6K4mUp7/xxsBZlUqHF2SMos6O3BFWi67FGiN7LWJFy7JvwUFMbezfDOn/8Ry6SARB3jOYcAM3WRKs5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgEp69NhTCDItkqR20cD+aAshOiWasMoPqOlrPlnT38=;
 b=qoU58B2RUbBYer9KxJHRajb2xTlbIXxQ2daxbT2Ac2QkjxOMJYO8fqOsuEbjkZCdUyfbMPS2x1Yhm78duytyegenIRD9ipdStlC50t4dUkBxNS443kjqOwcnQb2vtlil17JqTA6kjuISw1di3LfNuLUjpP/8MQrW64s667xXbeOTKCl5e/Dzs1YxKXarsjeAP4/sQ8IkbsiTfc9FsYFgFUnlfRqh5aZlYWmddWQR3INoXzx5FcpXJlDy9C/oIF5hck/xRtG5nwFpdCSyVdBydTHqp5xC3Fwk0CjOKEd9cyK5Xm1Vrvgssnea5ucweY0bYYnrZ4ZvG03LJDS7AOcPRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=akamai.com; dmarc=pass action=none header.from=akamai.com;
 dkim=pass header.d=akamai.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=akamai365.onmicrosoft.com; s=selector1-akamai365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgEp69NhTCDItkqR20cD+aAshOiWasMoPqOlrPlnT38=;
 b=Av1r/957nAmmgiYpt9hUC6JQLRUTleFddRUHB+EOm2gV9chDGo0/U+ETxw4rKsyHlsFHxPSpYpb2jUoMS6RESCm6bdwiILsehsi7fFGTa8CvkbkW43AENSK3d6LhFmd25jVqA6ppmRsEILDNaQpiq5FqZr8s9Vc5zJWOq3TRA9Q=
Received: from MW4PR17MB4876.namprd17.prod.outlook.com (2603:10b6:303:10d::17)
 by MN2PR17MB3840.namprd17.prod.outlook.com (2603:10b6:208:207::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Wed, 10 Dec
 2025 19:09:37 +0000
Received: from MW4PR17MB4876.namprd17.prod.outlook.com
 ([fe80::2b53:64e8:a13b:b404]) by MW4PR17MB4876.namprd17.prod.outlook.com
 ([fe80::2b53:64e8:a13b:b404%3]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 19:09:37 +0000
Message-ID: <76038c97-39ca-4672-adc0-4e8fe0e39fc8@akamai.com>
Date: Wed, 10 Dec 2025 14:09:10 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/31] drm/dyndbg: Fix dynamic debug classmap regression
To: Jim Cromie <jim.cromie@gmail.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <gregkh@linuxfoundation.org>
CC: <ukaszb@chromium.org>, <louis.chauvet@bootlin.com>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
Content-Language: en-US
From: Jason Baron <jbaron@akamai.com>
In-Reply-To: <20251118201842.1447666-1-jim.cromie@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::20) To MW4PR17MB4876.namprd17.prod.outlook.com
 (2603:10b6:303:10d::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR17MB4876:EE_|MN2PR17MB3840:EE_
X-MS-Office365-Filtering-Correlation-Id: a0b69e03-b781-4321-638f-08de381fa96f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVJicnYzNUNMeEIrYzBiN0hHeDRMbHZIa1lLSTArNXYxQjFjOU5iTmN1YjN6?=
 =?utf-8?B?WC9yRlh5VUNLdkp3cyszRS9HeExDbVU3eEpycXRoQ2hIZlIvZEhlSmQ2MXpL?=
 =?utf-8?B?YWNjUnNHVE1VbUpSL3Z4N2NIa3RiZzlLejdJTG1SZzVnMVQwUkVNYjVQOXJC?=
 =?utf-8?B?dG1MTlFycSt5VmNTa0RQbk5nS1lqTVRIb3IwMTNuVDdxbE9RNW9JL1ppcS9X?=
 =?utf-8?B?OW54aEdYRTBCUWc5enhReDRWTWxETGI0bFBqWVdGaE1ZNXpYQmo0R2RCNTEy?=
 =?utf-8?B?aEdHNkFkeFg5YTJrU2ZJOC9IeE1PQmdJaFRjM0lBWmh1RUdNZkJIYkovNjh4?=
 =?utf-8?B?YnF5MUEwZzBOMzVuTTFCSUpHZEhZaWtqWFpWNkFjUndaUjFhNk1DNk9jbzlE?=
 =?utf-8?B?QWlvdzlIMXJ1T1p1MGFqTE96MEpGUkt4aDFOY0tDNEg4T2xnUmc3VVFER0w3?=
 =?utf-8?B?RGVWNnd6K3IvTUR5SzRnWVhYL1ZuOGZsOHZpdlYyVFhzVjd2VnFHS1ExTW1m?=
 =?utf-8?B?cVRQT1VZOFp0dStqTzJjOWl1MGZ6b2FmUXRLNmhzSXhTK3NOc2lOZGxWR3M1?=
 =?utf-8?B?WHlMeUdqY0pPR2pRQXJmbXIrMEx4cTZIb1NJQldjZlp4Zld2c1Z2aklRUlo4?=
 =?utf-8?B?eDRQYTBzbVhxeUUySS8yWGMrZkRzK1BoUmJteDkwcnp5aHA3Y0wyUWZmTy9q?=
 =?utf-8?B?YVdod04xM0R2eVJ3dnF1L3NUaU1IV1Y1WnBZa1NiQmg2NkpBVXE5ZThUV0s5?=
 =?utf-8?B?ZHFNM1g1alFKcklTWmxJMUhsS1gxRGdtMVJXTGxLQTEwTTRzUWwvUjg0Tk5Y?=
 =?utf-8?B?dDlsbGtKOW96T2hNaW01cnl3czM4cXYzSFpuZUxQNE5idXZHMFM4cUF0Zk5a?=
 =?utf-8?B?OHJoMUh6QjJvOS9VYzNjWmdRbjVpWTBFcnA3SjJUVldBcVJ2dzg4MUhJSUFl?=
 =?utf-8?B?Ylo3eEUrSHlLZnRkRE5UOUFLalBiYlc1NW85ZVZweUovMHRpOEJ3dU5hNExq?=
 =?utf-8?B?dHNqeEViNlhaQVM3RW9mY3JFakVobWNDMmVKM256Vld0R3VhNDZTd3hRZllY?=
 =?utf-8?B?bVAzNkNKa3lRUDZYSktxamp1NS9iS2JoRTUxVm45S0Z5dTJOSGluQisyYkZR?=
 =?utf-8?B?YnllR08xcTErK1B6QUdrK3RpVkJPUGh1ejFhaU1rQmpFY3FKRE5LeWZtanV0?=
 =?utf-8?B?WnZHVUdDQ2lOL0hSRXpXVWdrZmZsTGdldGNZZUtIcDN5bGp4Y1lkbWd3aDc1?=
 =?utf-8?B?Q0s5a0tmY0Z1OVlONUVaZnF3R2R2eHJVWmJSYm5kVFdRK2JoS0V4MXRPOWlk?=
 =?utf-8?B?VUFrMFVLbnNrNDBxNVNMWFFvSmM4Tk1EUXFjaWV3SHp1azA0NGFBQW9TNHV3?=
 =?utf-8?B?MVZ6ZWhMOUZ0Vkt0K1FvRVN3cWd6a1d2N3dhejQxWmpta3lSQnU3alB6ZlpY?=
 =?utf-8?B?am0zaU9BY0ZHQzQ2a3VYY1Z6NEhlZEIwekRpQWRzTURwT2JZNlV4OVZkY0F0?=
 =?utf-8?B?VWN2UHgvcFJPR3d1czJZSnJORTZQVnRmSjFGWlN0T2dWYjNraHg1RnFYRU4y?=
 =?utf-8?B?bVBFbzNVSXBrRGpRc2tQY2xFdnV3elY0QjBlRUFWNmUvc3p5Wnd1UTdPNWVo?=
 =?utf-8?B?UnhPYjRQUE1yVmp4S1NSdVp2MHp3c1FUekhSRDdUeTJ1bnpma2lEdklSV0Nz?=
 =?utf-8?B?K3YwS0phRGdlTHhUSGM1YUw5M0lvaURtdXE2cWphbXdYUXBpTVRhbzFsUkFR?=
 =?utf-8?B?Sk1lQitpT1B3SVB2K1NYYU9EZlVqK2pxd1JHbHZUeWp0bjVMaW9Pd0ZVUDYx?=
 =?utf-8?B?bWVoUnFMNTZHdVJaNlhaYkxFZGVHa1diQVQyNzMwbXFiRi84UUtNS2ZObjVm?=
 =?utf-8?B?WWFwcTZEUXp6MzB1QUNIVWlSRXlZc0pYRUdvWkVMVitxSGxrQXQ5N0FOTHVO?=
 =?utf-8?Q?7FqMo7ge6Oa2t09coV1KvblMAhz1fsml?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR17MB4876.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Um0yMnBJRHRUeFV4T0kzUFV4dGQxUk5NSmUycEFJSk4rbFVtMWVMYTdraUJQ?=
 =?utf-8?B?Y21Ua0o3N0RIcHQ1azM0UE9jMUV1YytSWFJUeTBZQVk5a3ZmWFE3b1ZVRDQz?=
 =?utf-8?B?N3dFcjJXaXBJSVRIb3VyVkNkNlY0SkJCZ0E5cHR5YWJvMFlTOElYZEs2YnRX?=
 =?utf-8?B?LzhrN1hUL3RwNDk0Z2dLU2xKNElzalpsVFh3T0tXOERBc3E0UERielZhQ0pC?=
 =?utf-8?B?TldnL3NWRHNLTVhsTTRkV2EydnRLcG4wUkFkSitCVzFsdDZTY2JSOTNuajI4?=
 =?utf-8?B?WDFmL24reTB3MUY1aDVRdFl6cy9hUWthaEhuZjNNTWxsRHlYaVplM0trT0wx?=
 =?utf-8?B?WXJnQXFSN3Y0Y0pyMGozVXREYUhIRDhLYVkzSlFQdFJRNjd3Ump1K1g2SGc5?=
 =?utf-8?B?UDBoNWlWYUVEdFRGbG1hWUNFLzNyMzlKdjBSUDR1eG1DQkdwVXR0QjVGNnRE?=
 =?utf-8?B?WUM0ME82MzdRbDRldG9LS1lWR081TXJPYyt5ejVmUG5BakQ3M3VRcW1iQnIz?=
 =?utf-8?B?RVpiajF4VGZsdDZqSUlvZEw4Y2YwSXBJSkoxa3NISkJ6T0VsZHlkZ2xuYmk0?=
 =?utf-8?B?bEJSNkxiN01ZRWwrbmxNdm5SblQrKzUwa1pYcGYyUk13cFY3SHlLYnFvQU9z?=
 =?utf-8?B?Wm9BZUtUQXdxck4xaXRaSU00eThvVEdHelJEYzFSbjVCMHBzMGx5WmFYSDVw?=
 =?utf-8?B?dTFTeG9pcG1TaVV1Szh5WkZNbHVnMWlhSThUUzMrZEpIODBLODVyU2RNL1dV?=
 =?utf-8?B?WXduSkl2cmR5RnRLbnFtUC83Qy9wa3NzTjRBYWRrWmhZNjNVbjJ3eHJuZWsy?=
 =?utf-8?B?a0xlb25EK3huN0dOSXVNeWx6S3daMjVpRkNIY2l5Q2IyUUNudklhUXphR1VN?=
 =?utf-8?B?MllwNExsemh3UURvMGFLQ1l5Q3lrQklBOXhRbGZVZDZvNmZUUURnZE52Unh4?=
 =?utf-8?B?RUxMdjBLVVBTVWg3Uy9RU3ZUdDdJMy9vZXBlODlPQksvMHVSblpvTmRRWWJm?=
 =?utf-8?B?Y2tYTU1GU1VCWnlXMWtydTFSQUFkUllZL3BBakdTQ2dEOWcxWlRlM0FhK0xk?=
 =?utf-8?B?RGdvZm5IQ1hLdlowRDkyU3NaYUxmc1E4UEt5STBqUmR2QUFzS3N6cFN5d0ZP?=
 =?utf-8?B?OVc5SGFFVFlGQ0NJMTNXUUx0akl1eVh5aXB3SUk0cUoraUdNV3FSc0dFeEJi?=
 =?utf-8?B?eEJUWllhRllzUk05aFZjaUFBeW9vTVFvcElwamNFaUE0RmFqaGdSNGNFOEVh?=
 =?utf-8?B?QzQwWlM4b0thY1QzSXhGWHlVaDR6SlE4SitkTEJna3IwYThRZEx2RmJ2Zzk5?=
 =?utf-8?B?aWpKN2JPM0N1NUNBZjkvZ1duOEY3U2dTZGlqUU1ZbjJBdENzTXlxVTJvUFZr?=
 =?utf-8?B?bzA1VW80R0ZVbTJXdHg0bUlrWlBxSjdsQ2pMZTdLMnc4Wmc5N0JCVWZZWXBS?=
 =?utf-8?B?d1duY0svWkIxL1VsMFFBdy8zM2xrekpkTW5yQ2hDaVZCbHByVHhINjZnMDhM?=
 =?utf-8?B?UVZtNjZZWmRpaTE3ellnYThXV0dGV3N5WE1VMCtRaUJaT1BLQWpiM1FnWEQ4?=
 =?utf-8?B?NGgvU0JkN1RxTk9zUDQyL1BRWWxnQ2g5ZE9QdFRQbUh5Z1pSNjFZUWNwb2dr?=
 =?utf-8?B?bEk3SWVXTW54WWNLdSt4Wm8vTG5DRTdzS1EwUGdJaTFSdDZFTFpRYWhRNjhJ?=
 =?utf-8?B?VHhmWEJ1cG4zbUxsR1BZZjh3VDNUQWdJN1gvMGZ0ZFZFMDFjSUZtRjQ3RnZh?=
 =?utf-8?B?bmZtdzNoTktXdDBOUG44UHo5VHBXOTVsRldUYWlsNFB6Z1Rud1FSOGR5TjlX?=
 =?utf-8?B?eFh6YTFjRDZPd0pUVW1sNlBoR04wZUNBUUJpU29SSXZWSDNVTmkwc3dLQ21U?=
 =?utf-8?B?dUNlNGZGbEljRGdmMHRPQ1ViTHJmTVM0Zm1ZUVlGWlNuSVo4YmtSdXA3Rzdr?=
 =?utf-8?B?UXJEZ3I5bjBXeWtST2JacHc1WmVKTVIxRlVHTTA0TzFxV1dTZXRwYTlBNklv?=
 =?utf-8?B?T0hCcVZBeEVnOHVGZnkvVVpRL2N1S0pPNEdPOHFiT09SK0V6WWJ3akdnTG1n?=
 =?utf-8?B?ejdCSEszVGFaS3ZyWjZxTmdCQVZRSStXbEFVN1hpaGxkR00zWXRadnBFSXpC?=
 =?utf-8?Q?E0x0cA4CA03VP6bZCLvOrWJUi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b69e03-b781-4321-638f-08de381fa96f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR17MB4876.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 19:09:37.3050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 514876bd-5965-4b40-b0c8-e336cf72c743
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08oV2kJ7P1lG4xDZh8w+JZmo6lyofYePqYeWLjUXYRsSa4wXKwaL88OdefCqhPmAqiCcpaNx7bdyZT7YxUmFZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR17MB3840
X-OriginatorOrg: akamai.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510240000 definitions=main-2512100156
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE1NyBTYWx0ZWRfXxW3cUSqguHKG
 WL53yv8PcG3E148e8LVQycRKbxgxJ4LTMTvLpak1Z+HIAGJoehZKvqzCis7z46JbY6RmHlnYzwx
 V5R/a/vTUI/q09c13fSJ1acY4pUV5Rqb7ju98eeHYdbFB9S+Z9jPW21V6rtaPLBpo0gWIJAg5Uw
 msDdmzqtYSZK+9N5K5U5K/o4vLlmisw75wBs+2qWhciTHYyNF7YArUWlHqrNEQ8mQzuSc1EUv8c
 cA2z2clflqRSREy2SnQ8zK5ag5HWRjgd+/L11zrjrucdQiIrieWF8MDUZHIoTjhK4kZoa+20LDL
 AcEp+ZnYsIuu5Gfa73UFECIWv4AWj4vbWOur08VcY/49GPPtgFgRWk6Q6E5Xy6lMcZ8nQPAxMfL
 5tXQ3o018f98G3M4ARiVqXdpF8H3yg==
X-Proofpoint-GUID: QTBjSxRgfdkSZQjBu0X7VUNEkG8PGRT7
X-Authority-Analysis: v=2.4 cv=CKQnnBrD c=1 sm=1 tr=0 ts=6939c575 cx=c_pps
 a=NpDlK6FjLPvvy7XAFEyJFw==:117 a=NpDlK6FjLPvvy7XAFEyJFw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=g1y_e2JewP0A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=SHsv-2qgsRACRmc5FC8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: QTBjSxRgfdkSZQjBu0X7VUNEkG8PGRT7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 impostorscore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100157
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



On 11/18/25 3:18 PM, Jim Cromie wrote:
> !-------------------------------------------------------------------|
>    This Message Is From an External Sender
>    This message came from outside your organization.
> |-------------------------------------------------------------------!
> 
> hello all,
> 
> commit aad0214f3026 ("dyndbg: add DECLARE_DYNDBG_CLASSMAP macro")
> 
> added dyndbg's "classmaps" feature, which brought dyndbg's 0-off-cost
> debug to DRM.  Dyndbg wired to /sys/module/drm/parameters/debug,
> mapped its bits to classes named "DRM_UT_*", and effected the callsite
> enablements only on updates to the sys-node (and underlying >control).
> 
> Sadly, it hit a CI failure, resulting in:
> commit bb2ff6c27bc9 ("drm: Disable dynamic debug as broken")
> 
> The regression was that drivers, when modprobed, did not get the
> drm.debug=0xff turn-on action, because that had already been done for
> drm.ko itself.
> 
> The core design bug is in the DECLARE_DYNDBG_CLASSMAP macro.  Its use
> in both drm.ko (ie core) and all drivers.ko meant that they couldn't
> fundamentally distinguish their respective roles.  They each
> "re-defined" the classmap separately, breaking K&R-101.
> 
> My ad-hoc test scripting helped to hide the error from me, by 1st
> testing various combos of boot-time module.dyndbg=... and
> drm.debug=... configurations, and then inadvertently relying upon
> those initializations.
> 
> This series addresses both failings:
> 
> It replaces DECLARE_DYNDBG_CLASSMAP with
> 
> - `DYNAMIC_DEBUG_CLASSMAP_DEFINE`: Used by core modules (e.g.,
>    `drm.ko`) to define their classmaps.  Based upon DECLARE, it exports
>    the classmap so USE can use it.
> 
> - `DYNAMIC_DEBUG_CLASSMAP_USE`: this lets other "subsystem" users
>    create a linkage to the classmap defined elsewhere (ie drm.ko).
>    These users can then find their "parent" and apply its settings.
> 
> It adds a selftest script, and a 2nd "sub-module" to recapitulate
> DRM's multi-module "subsystem" use-case, including the specific
> failure scenario.
> 
> It also adds minor parsing enhancements, allowing easier construction
> of multi-part debug configurations.  These enhancements are used to
> test classmaps in particular, but are not otherwize required.
> 
> Thank you for your review.
> 
> P.S. Id also like to "tease" some other work:
> 
> 1. patchset to send pr_debugs to tracefs on +T flag
> 
>     allows 63 "private" tracebufs, 1 "common" one (at 0)
>     "drm.debug_2trace=0x1ff" is possible
>     from Lukas Bartoski
> 
> 2. patchset to save 40% of DATA_DATA footprint
> 
>     move (modname,filename,function) to struct _ddebug_site
>     save their descriptor intervals to 3 maple-trees
>     3 accessors fetch on descriptor, from trees
>     move __dyndbg_sites __section to INIT_DATA
> 
> 3. patchset to cache dynamic-prefixes
>     should hide 2.s cost increase.
> 
> 

Hi Jim,

I just wanted to confirm my understanding that the class names here are 
'global'. That is if say two different modules both used say the name 
"core" in their DYNAMIC_DEBUG_CLASSMAP_DEFINE() name array, then if the 
user did: echo "class core +p > control", then that would enable all the 
sites that had the class name "core" in both modules. One could add the 
"module" modifier to the request if needed.

One could prepend the module name to the class names to make them unique 
but it's not much different from adding a separate 'module blah' in the 
request. So probably fine as is, but maybe worth calling out in the docs 
a bit?

Thanks,

-Jason
