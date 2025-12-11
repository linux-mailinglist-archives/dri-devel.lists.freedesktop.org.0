Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA606CB7366
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 22:26:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DFD10E251;
	Thu, 11 Dec 2025 21:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=akamai.com header.i=@akamai.com header.b="Mv5Pr63G";
	dkim=pass (1024-bit key; unprotected) header.d=akamai365.onmicrosoft.com header.i=@akamai365.onmicrosoft.com header.b="gHYArd39";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00190b01.pphosted.com (mx0a-00190b01.pphosted.com
 [67.231.149.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FA610E251
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 21:26:07 +0000 (UTC)
Received: from pps.filterd (m0122332.ppops.net [127.0.0.1])
 by mx0a-00190b01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BBBYYKd718392; Thu, 11 Dec 2025 21:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=jan2016.eng;
 bh=nagqxEIRf3WRTOZ6nz3PYB6ySDNRO7HCWu+K4SX6D6g=; b=Mv5Pr63GMh6o
 3dcJIODYHo8MRe1ONdmPWTZC2krPOabjV1s8AFt5AI9hCUFA6qlHcUDzLZ3vz9Fc
 wAjtgziNTeRGZi/9zht2EHtGQpAOMu+lKZ2nb/R4OVtN5VYCVfiKloVOZvjTWLQd
 CcJFCjQ5PLDkiRbFtGlIKs5h5Ho2aFJjjuuyu78Ao9JXn/cJCeQMMChsDGr3eIU7
 WH8gtnnVsVjSY+VBnxucVAZiQ7GqYDxb54ChoWeBjOctVJRzOj9M3TojFrWzm753
 WPb53o+fhEVfY61HI4+4ClAibnKd37PZi2MXcT5PeTnG/qV+UgYBoVlJyXgv50cz
 Dt2x2cESDQ==
Received: from prod-mail-ppoint8
 (a72-247-45-34.deploy.static.akamaitechnologies.com [72.247.45.34] (may be
 forged))
 by mx0a-00190b01.pphosted.com (PPS) with ESMTPS id 4ayw6r7ur3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Dec 2025 21:26:02 +0000 (GMT)
Received: from pps.filterd (prod-mail-ppoint8.akamai.com [127.0.0.1])
 by prod-mail-ppoint8.akamai.com (8.18.1.2/8.18.1.2) with ESMTP id
 5BBK0u3l010502; Thu, 11 Dec 2025 16:26:01 -0500
Received: from email.msg.corp.akamai.com ([172.27.50.220])
 by prod-mail-ppoint8.akamai.com (PPS) with ESMTPS id 4avgq22ppg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Dec 2025 16:26:01 -0500
Received: from ustx2ex-dag4mb3.msg.corp.akamai.com (172.27.50.202) by
 ustx2ex-dag5mb3.msg.corp.akamai.com (172.27.50.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 13:26:00 -0800
Received: from ustx2ex-exedge3.msg.corp.akamai.com (172.27.50.214) by
 ustx2ex-dag4mb3.msg.corp.akamai.com (172.27.50.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 11 Dec 2025 13:26:00 -0800
Received: from PH0PR07CU006.outbound.protection.outlook.com (72.247.45.132) by
 ustx2ex-exedge3.msg.corp.akamai.com (172.27.50.214) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 11 Dec 2025 15:26:00 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iModLozbpbHAxchaknbtHLtJ6qFoLKj4L5zkN70wq2LTzVFbjQKEg5ol45bqof0rhpsqULiz2+BMSiVm2wd788mxApQ28g3V7oOwHtYivqqrWLJiiETMVdKBQxHrcNhpn89SPwCsmQGWzvRyoAu0+F05O4ywioUAmA6eIvdcdrubWQGfkgMRov9WWzKds9V0tEvcB50TdNk/3v+otHjt/OqwZEZ7+1tYg4iCdFMRaSjLdnzOAWhitkN4nrNTJUxkT5E6FM6bu0S4smHJ5yLm6/I9y1jA20rLhxdkEuOG1q08Erv7VfWOIz1atl02Vr9wn3et2m5Fv633QxxLCfH9bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nagqxEIRf3WRTOZ6nz3PYB6ySDNRO7HCWu+K4SX6D6g=;
 b=K40PWvj4JeND6fW+EVK4xCV6pmUJJHsjHuXht+ll2zda8cqpU7zGnpapI4YXWebGify+TD4eZGeabS5VpS4LknmKlXeoK4U88+1k8sv9/dP6064IhBhjGj2BkHdCYLTaSM2itEL67AylnrX8QuSREnPgBLoDyGXCiucLxn5vUE4xUIC7C0DyigAMXf8eXRpmbmKIXm5YVsPDFOEqFcsXZyGzZ17lPV2AE42+KDggAtA2Co8nR7a1bgo5W3srCyXjROWM8n3bSX4yzSJujNQNvtleVWxzJ/7ub0GKEl58fo66Hvhy8TOxSTYGQnYsxDhsBXnSzkeuiwXGgFseUYRafQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=akamai.com; dmarc=pass action=none header.from=akamai.com;
 dkim=pass header.d=akamai.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=akamai365.onmicrosoft.com; s=selector1-akamai365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nagqxEIRf3WRTOZ6nz3PYB6ySDNRO7HCWu+K4SX6D6g=;
 b=gHYArd39ytyLIgIRac6xDalK/yMp2HAdCDss4yMoA+L6DhgdhJ5L6oChGVXhhY/oV7EH0KUn7x5RPwO9imqRxYS1KasoyzWyMpn4CxagsQ1GR/OkBDaP+H0ARIWwhNpGZYmCtSK/o0qGH/bpWUvVoPaIhmoUlSIkkbbHJMJrQYU=
Received: from SJ0PR17MB4870.namprd17.prod.outlook.com (2603:10b6:a03:37b::13)
 by MN6PR17MB6970.namprd17.prod.outlook.com (2603:10b6:208:477::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Thu, 11 Dec
 2025 21:25:56 +0000
Received: from SJ0PR17MB4870.namprd17.prod.outlook.com
 ([fe80::ff21:c3fa:86eb:2f36]) by SJ0PR17MB4870.namprd17.prod.outlook.com
 ([fe80::ff21:c3fa:86eb:2f36%3]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 21:25:56 +0000
Message-ID: <ec20defe-8559-482e-8643-b69a4279cec1@akamai.com>
Date: Thu, 11 Dec 2025 16:25:29 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 29/31] dyndbg: resolve "protection" of class'd pr_debug
To: Jim Cromie <jim.cromie@gmail.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <gregkh@linuxfoundation.org>
CC: <ukaszb@chromium.org>, <louis.chauvet@bootlin.com>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
 <20251118201842.1447666-30-jim.cromie@gmail.com>
Content-Language: en-US
From: Jason Baron <jbaron@akamai.com>
In-Reply-To: <20251118201842.1447666-30-jim.cromie@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR11CA0009.namprd11.prod.outlook.com
 (2603:10b6:208:23b::14) To SJ0PR17MB4870.namprd17.prod.outlook.com
 (2603:10b6:a03:37b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR17MB4870:EE_|MN6PR17MB6970:EE_
X-MS-Office365-Filtering-Correlation-Id: 11130f97-1d9a-47c2-69f1-08de38fbdf28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXFKZnVWbnVIN3dHRllPWmlYVnNEVkZnbUIzY282b3BmZ2t1TExncWhTSVd6?=
 =?utf-8?B?STJYOHRNZEpQRUJhQTZwc01Jc2xTbGtHL3NheXZnL2t4VGhOcnVUWE9KQTNQ?=
 =?utf-8?B?Uk10NFozZnVMOE02QXFKLytVTlpsOVBQK0hjTUdyc1FTWVBONWgwZGJQZXlB?=
 =?utf-8?B?L1NpZ1FWRk9iTUhZcnJiQ0RJRVhrc1pNZHhSaGM5bmhZK0VWdFFlWUZMNHdu?=
 =?utf-8?B?Z1R3amY1aVc2LzZYbHY3TDIyM0lsNGlOVlJDL1ptaUd6a29DU0l3VXNDcXlP?=
 =?utf-8?B?L0RmcklqZGN6V3JlYkFZRnlFd3lEelF1SjQrQm9sRFpsajRyV1ZwVzBoTndX?=
 =?utf-8?B?d3RLYjlHUGdnLyt1MHBTU3pSMTV2Mjc4WWl3TWhoQzVOazRkOEZDMFpxSlBp?=
 =?utf-8?B?SXRsWitLOG5BeW4vOUJ3VjdQUkFvRVZQdi9MT3pydmp5NnNnMEZ6K1dkcTZF?=
 =?utf-8?B?aENVb1VycFFBM2FCc1pQOFlEc0JxN0ZoY21BVUpNSUxrbG40QTdlcnhJQWRX?=
 =?utf-8?B?NUwrSzAxeUVOL3IzTjNFbjJvOVVOblNQb3Q4SG9SYURSVUNXQ2h2cGNLd0pz?=
 =?utf-8?B?QkRueVYvTWYvOGJmdVBlajd5SUhWWEQ5bFJwd1RQeEk0NmhoRWZtUmxYZFhs?=
 =?utf-8?B?dGdXRDRPcWQ2K2JoVm13bW55dVVRU0c5Nm9tcm1iMnVQRDk1YzJlcldkcTBZ?=
 =?utf-8?B?bFcvNjlscHVEc1R0bDIrOU9qSHphaUR6T2E5MTU3NUZlcWhlNGRVTGI0NUR3?=
 =?utf-8?B?RGo3NkJYTjZDa0k1b1FmZlhla1A4SzBFT2F1SFpsMXNiejJzMFhENHIxTjRl?=
 =?utf-8?B?Y2VkSXF1WGxUQnQwRWgyN2xZbGhhcXU3WkdPRVBwT2xhQTdXOS94S0lrY0pp?=
 =?utf-8?B?YVN6eFB5MEcwWG5sOWRSbHJXK1JZRjMwU2hZUGppdG05Z3pLN1VySGN3c1pp?=
 =?utf-8?B?MlArUkdTbnk5WEFNbis1cktuN2xxYkt4UzFWMlh1cytJRjAzUHBVZXhlOWs4?=
 =?utf-8?B?cXh0MSsxcEFSTjlLbUJFQ1ZWa0RMN2JIRlR4NVQ2REVSZVpyR2U5ckFVd0hx?=
 =?utf-8?B?eWk3cTl4dXo0L1lpNjRpNnd6Zi90WXZQMFVOYUgxTW9zMzRzY1cwWjBHMDR0?=
 =?utf-8?B?OWxVTE9nd3hzTEdBOVpBUU9YR01nQ0M4RGlrK3M4TS9kdkY1ZWo2NHNMRWlH?=
 =?utf-8?B?RXMxRHRaL2p6aXEzSENXaEpKVEdhL1dlTUh2MW5tYVNEeWpjcTRyMER2RDRZ?=
 =?utf-8?B?ZHdlRFNpMGhWcmJrMEhOSFdDZ2NhSUhRMXU4T3NYV2I1dWNHZEdBcEt3Ukwv?=
 =?utf-8?B?a1Q4V2ZncXlTdzNKRUsxdmZQZW9hSzMvNERBWmllVWJhWjFIVHkzbjB0bENz?=
 =?utf-8?B?VUtkVmFlbU96T1FZYnY1dm5KVlU0QTBOTGhQa09ycWYrd1FvbGVva2pvNVph?=
 =?utf-8?B?SFdWQk5zcTRMNnRRUThaQ2FqdmljUWZOb0hJZnk2SUVrTmNGbWp0dWVtMXNB?=
 =?utf-8?B?aG90c3RpKzM3TzlNb1NJeGN6REw3d3BDS25PQlR3a2x0aFZXM0lEZWw3bm1J?=
 =?utf-8?B?Nkt2Y0dNWEFBVzBTR3hsMFJhR0x1MzZyeGsva0MwL3dZeGUvMXZoRDkveVVM?=
 =?utf-8?B?TDB4RmlLTllZV1h3M0FmZWpJaWxiS014ZHgweHhaRmVSSGNyMmxYczRXUHlM?=
 =?utf-8?B?aGY3SG9QUGRNTDZwUHJld3FQbFNLTlkxcmxmdVVQYy9ySy85UUpuZWMzWjZ2?=
 =?utf-8?B?WTZ1Tzd6SnMwbU9qYnNrZW4vcXgvVEtab1Vvek5yZmkvN0lwSm13d1pWdGxB?=
 =?utf-8?B?VjRocm1CWkN1aytuWjFxT2NnRUFNcm45MU5SNzY4UVk3VGJQZmdqWlZEWnAv?=
 =?utf-8?B?WnlXUjRSdHpnTGVSbzBKcUc0T2Vzc1pkWG14ZEdpM2tRaEpmTm94dk4vTkZG?=
 =?utf-8?Q?EVldWTD/ilGm1s3IlGupNJ2E614zM/Iy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR17MB4870.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGI5NEFnWFlEejhuWHVQRk53SXhpc1FFNDJ4dU54N01QZmdabWJ0cmZqdmtQ?=
 =?utf-8?B?ZlBWUWJONCtKbjNrRHRSVHBNelozUTJibFFQanlVK3QxNWo5QndLRDFCQVV6?=
 =?utf-8?B?M1pyREpWQ1crZFpMY20rTHRxSllJRFpIMk5VcUNTTWpDVElGU3cxR0FIS2gz?=
 =?utf-8?B?SlFiSlZIUXY5V3pjbXAxM0dRUkFkYnFIQW5KNkVrdFlGOFBTcE5SaXFBcG1h?=
 =?utf-8?B?NGJtRytYWnZZTVI5MTBNSXYwNXNxdDMwVGJWbVRnbnVNWVJPcHV6UU15Mll4?=
 =?utf-8?B?bGM1MVRvZkU4a1pseGJQMnB4Zk9TTk94cFZSdm4vZkswREFHK0tvQzRuQ3NO?=
 =?utf-8?B?Vkt0RzMyMXFWK0wrTzBFTFhHa0NhU3VEUnJBaEFpNkd2dm1OY3BLM2dLZGMw?=
 =?utf-8?B?TnN2em8zWnlVWFdoMU9LSXM4TVFDQnhqUHpycGRhR1lIbXBNalp6MXgvajdj?=
 =?utf-8?B?RkVVKzVxUmFFYkVmSDB2RmZybUo4ajFrb1ZMUkZHWUlFRSt5WHBxVVhOSEVK?=
 =?utf-8?B?ZGNBeEE3THdBZFh4Ym93elhMN0tNVUhYMDFuTDVkYjZORjdnZk50dy85U2Y2?=
 =?utf-8?B?YmZ4Q0hyRjVIRm1od3h6TFFZd0J2a3F3am0xdzk2UGFFK2lzbXloaHVVcXhH?=
 =?utf-8?B?NFNzM0Q0ZG1NS2QrOFBvUDdyeUFrdzZyOFh5TFdTbXBxSDFocmh0OHRXb3l4?=
 =?utf-8?B?aFlNb3lVbXZqSitxNlpZczBPa0tLSkFQK2ZNRzhxWXFkUlZsWFR4MDJMRHBw?=
 =?utf-8?B?NXVWRWh3Sk9yRE5nSmdCNXp1YUU3YTlHMER4Q3c2WUZOSzRIWDBhK1VqWVl2?=
 =?utf-8?B?VE1FTUU1NktLbG5CM3M1cTRua2pRRGNJdnlwaXlsemFGUVRyMU9tNCtoM1JM?=
 =?utf-8?B?MURJVUdyNjYxY21uRUZJbE9kUzNhMnpidzdKZnZaajk0Mk54TjNaNkhSZjh2?=
 =?utf-8?B?QnB1Y2dOSXBaU2t1VkJGWHhFTVV0N3lDaFBobzBUYUl5eEQ2NVMzNjFTSUNS?=
 =?utf-8?B?Tm9TZk5WYTBGRk1aR1ZCVW56RXpJVW0wdk1adW1PbWxiZHh0ZXpSbEMwMDli?=
 =?utf-8?B?czRLYVI2a1VlNU9PNjFkU2JDcUsxWDNVaDh6QnNvWHNWTENWM0F3aCsvWDBW?=
 =?utf-8?B?THdmVzg4NTRsY0dpdnZjdHFKdWxNUzFJNGw0dzVtWTF5dEdYcnJCcVBaUTFZ?=
 =?utf-8?B?SHlZWWZsTUZqUWo4SnZGY2NWMEFnM2VJTFJISGhqbEQ1bDNWcjNCbWpNWmFI?=
 =?utf-8?B?Z2xmc2JXRFRndW5Hcis3dUt4d28xNHErSXAvSlBMYWdIZCtpYTlrcVhZdlV0?=
 =?utf-8?B?Nmlzb0FkL2l4d0RHYmZyOUdGb2lhYTdDaFBYYUUxdnovNG5XUndpMVI5eUpw?=
 =?utf-8?B?b2FlMHoxOU15bkZKMGlOVkVxRXJXT1FoRlNpT0t3L01tMkhwWHZBMzBmK0ls?=
 =?utf-8?B?ZXRxaUY1NTBBM045RktMNDBhVk41c1NhQmpSUjV4U2lyRVZkN0huekJTQmln?=
 =?utf-8?B?aEtrT2xlQUxCeitiaGx3KzRMaWV4YmttVUdtQjk4NElXZVNwWkl2OFhOQUJp?=
 =?utf-8?B?OFdoN1I4bVM3cngybG5CYisvT2dUbmtCKzloRlZpa09FL1M0OVNmbi9jd296?=
 =?utf-8?B?S21IbkFQdUJnNTVuVjhxeTQvQk1BbTE1K0FGaTAzdlRleTIvRkxKYmdhZ3JT?=
 =?utf-8?B?VWpWaEZhZm5udE8zeThUMWV0d0QrU3Q0UG5oTnRuekFLdHZtSUsyWVZOQVlT?=
 =?utf-8?B?TzgrWVFPOUIwVXVRVUZXR1l0U1BRbXVFKzJmTFdTamg4Vm9zeHRsTnNMOUlW?=
 =?utf-8?B?cWRLZzJOTVdMeGprL3IvWnhDcXhxbjI5cGxxd0hUazZLb0NnLzMzaDlSRVlS?=
 =?utf-8?B?cE5NL2pnYTJ3dXdmZ1FRcHpQSkxaNmpvRTVWalE2TEN3Y1lXdVBZdFVMbWFH?=
 =?utf-8?B?Z1NGVjJhQnllQ2pjNlpzSXVzSWpUN0IxZjB1RXA5QWduVnhMa1VBUkNNenRQ?=
 =?utf-8?B?akliamNEYXpISFV6MWl0OFFXd1N5M3l4U2VOdEtycjQ5dUQxK0hsY21CT2hC?=
 =?utf-8?B?SW9ZK1FldzRrSFN2UnNObEQvaHhrY1hmSnphcDQ2VzcxQ3B0Q0lpa0hobFNN?=
 =?utf-8?Q?gNLBDbzZoaBtZ8Ua5sM2i1NkP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11130f97-1d9a-47c2-69f1-08de38fbdf28
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR17MB4870.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 21:25:56.6268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 514876bd-5965-4b40-b0c8-e336cf72c743
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dZxLC5+/04KZ3TYuAobiJY9ONS1w71AandLgyvUx+eBJpx2uFR21k7yi8WclPUv+YsAG759l4YZZni98mF9ngw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR17MB6970
X-OriginatorOrg: akamai.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_03,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512110171
X-Proofpoint-ORIG-GUID: qNkic4cwYmRmBDojLMtK1QOtB6uzo8_f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDE3MiBTYWx0ZWRfXyzGGtfDHPrcX
 0MTayowkmMb82CvRPmCEzmi9VvfYsJPCdAQm8CZ2/loIGxm7y3w2Q9tTWumEkbioXlD6/Q2JpkK
 ybKoSCiFJAYOFVzsrkhJ85vWdsfKhFRAr6o5wdI+sKvPzQIV/0ZDLEBwhYUUQcgj12lHoom1OiR
 CPGmoxjy31qs+aQc7e2Qus3gxwGVVyhH6rxkJnYf5TIWl1O1eWaxvoGXmX9TVaH7nsBGx41iXKx
 yGpXC5CiaLd5mwtk55z1I48aa2zfyhIT2cPpF3zcKGwP2fKIw5PLTZGGvk+m13Aay+R0b7DWxPJ
 ZpdkonPYP0c1CYjDIaOpOccdGcCddbvfCXmliiriHRuGp+dPYZus1aFSTOeMAd+fONqaAuTXcqs
 zuGj9TfybmH/w6zNnEJGIY0S8QMVKQ==
X-Proofpoint-GUID: qNkic4cwYmRmBDojLMtK1QOtB6uzo8_f
X-Authority-Analysis: v=2.4 cv=NO/YOk6g c=1 sm=1 tr=0 ts=693b36ea cx=c_pps
 a=YfDTZII5gR69fLX6qI1EXA==:117 a=YfDTZII5gR69fLX6qI1EXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=g1y_e2JewP0A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=DQ2I1JIJHPYleXYAsOcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_03,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110172
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
> classmap-v1 code protected class'd pr_debugs from unintended
> changes by unclassed/_DFLT queries:
> 
>    # - to declutter examples:
>    alias ddcmd='echo $* > /proc/dynamic_debug/control'
> 
>    # IOW, this should NOT alter drm.debug settings
>    ddcmd -p
> 
>    # Instead, you must name the class to change it.
>    # Protective but tedious
>    ddcmd class DRM_UT_CORE +p
> 
>    # Or do it the (old school) subsystem way
>    # This is ABI !!
>    echo 1 > /sys/module/drm/parameters/debug
> 
> Since the debug sysfs-node is ABI, if dyndbg is going to implement it,
> it must also honor its settings; it must at least protect against
> accidental changes to its classes from legacy queries.
> 
> The protection allows all previously conceived queries to work the way
> they always have; ie select the same set of pr_debugs, despite the
> inclusion of whole new classes of pr_debugs.
> 
> But that choice has 2 downsides:
> 
> 1. "name the class to change it" makes a tedious long-winded
> interface, needing many commands to set DRM_UT_* one at a time.
> 
> 2. It makes the class keyword special in some sense; the other
> keywords skip only on query mismatch, otherwise the code falls thru to
> adjust the pr-debug site.
> 
>   Jason Baron	didn't like v1 on point 2.
>   Louis Chauvet	didn't like recent rev on point 1 tedium.
> 
> But that said: /sys/ is ABI, so this must be reliable:
> 
>    #> echo 0x1f > /sys/module/drm/parameters/debug
> 
> It 'just works' without dyndbg underneath; we must deliver that same
> stability.  Convenience is secondary.
> 
> The new resolution:
> 
> If ABI is the blocking issue, then no ABI means no blocking issue.
> IOW, if the classmap has no presence under /sys/*, ie no PARAM, there
> is no ABI to guard, and no reason to enforce a tedious interface.
> 
> In the future, if DRM wants to alter this protection, that is
> practical, but I think default-on is the correct mode.
> 
> So atm classes without a PARAM are unprotected at >control, allowing
> admins their shortcuts.  I think this could satisfy all viewpoints.
> 
> That said, theres also a possibility of wildcard classes:
> 
>     #> ddcmd class '*' +p
> 
> Currently, the query-class is exact-matched against each module's
> classmaps.names.  This gives precise behavior, a good basis.
> 
> But class wildcards are possible, they just did'nt appear useful for
> DRM, whose classmap names are a flat DRM_UT_* namespace.
> 
> IOW, theres no useful selectivity there:
> 
>     #> ddcmd class "DRM_*" +p		# these enable every DRM_* class
>     #> ddcmd class "DRM_UT_*" +p
> 
>     #> ddcmd class "DRM_UT_V*" +p	# finally select just 1: DRM_UT_VBL
>     #> ddcmd class "DRM_UT_D*" +p	# but this gets 3
> 
>     #> ddcmd class "D*V*" +p		# here be dragons
> 
> But there is debatable utility in the feature.
> 
>     #> ddcmd class __DEFAULT__ -p	# what about this ?
>     #> ddcmd -p				# thats what this does. automatically
> 
> Anyway, this patch does:
> 
> 1. adds link field from _ddebug_class_map to the .controlling_param
> 
> 2. sets it in ddebug_match_apply_kparam(), during modprobe/init,
>     when options like drm.debug=VAL are handled.
> 
> 3. ddebug_class_has_param() now checks .controlling_param
> 
> 4. ddebug_class_wants_protection() macro renames 3.
>     this frames it as a separable policy decision
> 
> 5. ddebug_match_desc() gets the most attention:
> 
> a. move classmap consideration to the bottom
>     this insures all other constraints act 1st.
>     allows simpler 'final' decisions.
> 
> b. split class choices cleanly on query:
>     class FOO vs none, and class'd vs _DPRINTK_CLASS_DFLT site.
> 
> c. calls 4 when applying a class-less query to a class'd pr_debug
>     here we need a new fn to find the classmap with this .class_id
> 
> d. calls new ddebug_find_classmap_by_class_id().
>     when class-less query looks at a class'd pr_debug.
>     finds classmap, which can then decide, currently by PARAM existence.
> 
> NOTES:
> 
> protection is only against class-less queries, explicit "class FOO"
> adjustments are allowed (that is the mechanism).
> 
> The drm.debug sysfs-node heavily under-specifies the class'd pr_debugs
> it controls; none of the +mfls prefixing flags have any effect, and
> each callsite remains individually controllable. drm.debug just
> toggles the +p flag for all the modules' class'd pr_debugs.
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> history
> -v0 - original, before classmaps: no special case keywords
> -v1 - "class DEFAULT" is assumed if not mentioned.
>        this protects classes from class-less queries
> 
> -v2.pre-this-patch - protection macro'd to false
> -v2.with-this-patch - sysfs knob decides
> -v2.speculative - module decides wrt classmap protection
> 		  seems unneeded now, TBD
> 
> v3 - new patch
> v4
> - drop fn-scope map var, with 2 local vars, renamed to purpose
> - fix for NULL ptr case.
> - Add loop-var to reduce many "&dt->info." exprs to "di->"
> - add 1-liner postcondition comments
> 
> fixus
> ---
>   include/linux/dynamic_debug.h |  14 ++--
>   lib/dynamic_debug.c           | 127 +++++++++++++++++++++++++++-------
>   2 files changed, 110 insertions(+), 31 deletions(-)
> 
> diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
> index b1d11d946780..b22da40e2583 100644
> --- a/include/linux/dynamic_debug.h
> +++ b/include/linux/dynamic_debug.h
> @@ -75,6 +75,7 @@ enum ddebug_class_map_type {
>    * map @class_names 0..N to consecutive constants starting at @base.
>    */
>   struct _ddebug_class_map {
> +	struct _ddebug_class_param *controlling_param;
>   	const struct module *mod;	/* NULL for builtins */
>   	const char *mod_name;
>   	const char **class_names;
> @@ -259,7 +260,12 @@ struct _ddebug_class_param {
>    *
>    * Creates a sysfs-param to control the classes defined by the
>    * exported classmap, with bits 0..N-1 mapped to the classes named.
> - * This version keeps class-state in a private long int.
> + *
> + * Since sysfs-params are ABI, this also protects the classmap'd
> + * pr_debugs from un-class'd `echo -p > /proc/dynamic_debug/control`
> + * changes.
> + *
> + * This keeps class-state in a private long int.
>    */
>   #define DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _var, _flags)		\
>   	static unsigned long _name##_bvec;				\
> @@ -272,10 +278,8 @@ struct _ddebug_class_param {
>    * @_var:   name of the (exported) classmap var defining the classes/bits
>    * @_flags: flags to be toggled, typically just 'p'
>    *
> - * Creates a sysfs-param to control the classes defined by the
> - * exported clasmap, with bits 0..N-1 mapped to the classes named.
> - * This version keeps class-state in user @_bits.  This lets drm check
> - * __drm_debug elsewhere too.
> + * Like DYNAMIC_DEBUG_CLASSMAP_PARAM, but maintains param-state in
> + * extern @_bits.  This lets DRM check __drm_debug elsewhere too.
>    */
>   #define DYNAMIC_DEBUG_CLASSMAP_PARAM_REF(_name, _bits, _var, _flags)	\
>   	__DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _bits, _var, _flags)
> diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> index 636a6b5741f7..1082e0273f0e 100644
> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
> @@ -206,6 +206,50 @@ ddebug_find_valid_class(struct _ddebug_info const *di, const char *query_class,
>   	return NULL;
>   }
>   
> +static bool ddebug_class_in_range(const int class_id, const struct _ddebug_class_map *map)
> +{
> +	return (class_id >= map->base &&
> +		class_id < map->base + map->length);
> +}
> +
> +static struct _ddebug_class_map *
> +ddebug_find_map_by_class_id(struct _ddebug_info *di, int class_id)
> +{
> +	struct _ddebug_class_map *map;
> +	struct _ddebug_class_user *cli;
> +	int i;
> +
> +	for_subvec(i, map, di, maps)
> +		if (ddebug_class_in_range(class_id, map))
> +			return map;
> +
> +	for_subvec(i, cli, di, users)
> +		if (ddebug_class_in_range(class_id, cli->map))
> +			return cli->map;
> +
> +	return NULL;
> +}
> +
> +/*
> + * classmaps-V1 protected classes from changes by legacy commands
> + * (those selecting _DPRINTK_CLASS_DFLT by omission).  This had the
> + * downside that saying "class FOO" for every change can get tedious.
> + *
> + * V2 is smarter, it protects class-maps if the defining module also
> + * calls DYNAMIC_DEBUG_CLASSMAP_PARAM to create a sysfs parameter.
> + * Since the author wants the knob, we should assume they intend to
> + * use it (in preference to "class FOO +p" >control), and want to
> + * trust its settings.  This gives protection when its useful, and not
> + * when its just tedious.
> + */
> +static inline bool ddebug_class_has_param(const struct _ddebug_class_map *map)
> +{
> +	return !!(map->controlling_param);
> +}
> +
> +/* re-framed as a policy choice */
> +#define ddebug_class_wants_protection(map) (ddebug_class_has_param(map))
> +
>   /*
>    * Search the tables for _ddebug's which match the given `query' and
>    * apply the `flags' and `mask' to them.  Returns number of matching
> @@ -214,11 +258,10 @@ ddebug_find_valid_class(struct _ddebug_info const *di, const char *query_class,
>    */
>   static bool ddebug_match_desc(const struct ddebug_query *query,
>   			      struct _ddebug *dp,
> -			      int valid_class)
> +			      struct _ddebug_info *di,
> +			      int selected_class)
>   {
> -	/* match site against query-class */
> -	if (dp->class_id != valid_class)
> -		return false;
> +	struct _ddebug_class_map *site_map;
>   
>   	/* match against the source filename */
>   	if (query->filename &&
> @@ -255,7 +298,28 @@ static bool ddebug_match_desc(const struct ddebug_query *query,
>   	    dp->lineno > query->last_lineno)
>   		return false;
>   
> -	return true;
> +	/*
> +	 * above are all satisfied, so we can make final decisions:
> +	 * 1- class FOO or implied class __DEFAULT__
> +	 * 2- site.is_classed or not
> +	 */
> +	if (query->class_string) {
> +		/* class FOO given, exact match required */
> +		return (dp->class_id == selected_class);
> +	}
> +	/* query class __DEFAULT__ by omission. */
> +	if (dp->class_id == _DPRINTK_CLASS_DFLT) {
> +		/* un-classed site */
> +		return true;
> +	}
> +	/* site is class'd */
> +	site_map = ddebug_find_map_by_class_id(di, dp->class_id);
> +	if (!site_map) {
> +		/* _UNKNOWN_ class_id. XXX: Allow changes here ? */
> +		return false;
> +	}

Do we want a WARN_ON_ONCE() here? I think this is the case where we have 
class_id for the call site but it's not default, so shouldn't it always 
have a map or be a user of the map?

Thanks,

-Jason

