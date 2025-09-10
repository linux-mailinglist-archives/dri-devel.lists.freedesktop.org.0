Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFC4B51DF4
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 18:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCB610E96D;
	Wed, 10 Sep 2025 16:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="QSoWkflT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013057.outbound.protection.outlook.com [40.107.159.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D349E10E96D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 16:39:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xIS4yQom8ZZJ6AdOjHWH3WBwjwafnzPLRv7cH/V4yA83VioOJSqdRfm45q0KTwcyHv6n6hTqnghfeg0g1x7Dl54ulnBFLuHJ+g+JwzLe6QmSRCplb9QFOqBls4Ieptlrb2RlN7vyM+zy/92xMYL7RtUnaOjIR1wdWX2jnEJt4hShy7JL3yyyqlGnCX3OrGrh6g81RFzsH4GsVe2AngrkOGigTwJvHOK4ZM7sYQqWoCExG87gSIAzTnEJG8eUCzRXZXQPlkLLE+Z0gj4awbAEspdg99c1NHdG5WIMUu2vORTv9638Rf5kxjGXaiLO6yXbSX2DSqpVTbbZAjNbyMMZSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32CG659hP8G2WqqqXfqyIag3hFI1ybDc0k8zfv0FqH0=;
 b=hVCRx8Q++FQpjpjpWGLMeLgjf4CS8zzsqHlKDknpJ5gP/N7QtLh5aZC7S1NEr+++c66jCMsRDSORQDYV0bv/vr6CmQJXdgTeuMTXT4m42vkEQYY56IPHUWJw7dRxlGS6RjdQp1w/2wJEgGkhQDJ/QNgxlr3U3jYxKX1KR4EzvG1z6H/Jd0XO61lXqMJlAw9NruBKrVWdSF/OZ2FAAYvgoBANdCJKI3jFbPy0f5TvIHbx98YLtd/+y8pzfCxMxgijfHUS1pw8TbZF7fzKUuzyk80M/8NMZPouiaccEIU1sQ5ELw3+xiqEw3YT26iUYecIv+nkUmMbZ4O0ZGwC86PPRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32CG659hP8G2WqqqXfqyIag3hFI1ybDc0k8zfv0FqH0=;
 b=QSoWkflTwpspFzVR7d98j80hz8fFdwWDOlPyJ9be3pOBXARgWGro9cgSNgzfNTLhELUsQbs0fpIZUf3yxqxCZ+ejoa4WLtLisDmdLk2sh9UA6ZZczofNz2cT/8x9hkJNaNC27HE9Hr+0R5+JCQC/x2qGA6dEEMVmvRqzMzEErRdGlegQcrFsRbXf12YpYR+6euli4xri0AuHyNjBkEGCQRRyn2CCkBDgyfiASpbYjG1kzvtJwkJS2EH9RQZL/FnT3xqGLa+u36zZ2E0HtMZRNuC4trIUeSXQzMUAtA6kxdNWf3ENNQ7Bx3s+GMdieZmebrtOHmkX8shEC+7l6SDHMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GV1PR04MB10990.eurprd04.prod.outlook.com (2603:10a6:150:209::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 16:39:41 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 16:39:40 +0000
Date: Wed, 10 Sep 2025 12:39:33 -0400
From: Frank Li <Frank.li@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, kernel@pengutronix.de,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH RESEND v4 2/3] dt-bindings: lcdif: Expand the
 imx6sl/imx6sll fallbacks
Message-ID: <aMGpxQDnr7pSNqkd@lizhi-Precision-Tower-5810>
References: <20250910020525.342590-1-festevam@gmail.com>
 <20250910020525.342590-2-festevam@gmail.com>
 <aMGfiOZrVaFIqA2R@lizhi-Precision-Tower-5810>
 <CAOMZO5BGFAfJYFZGCStYhGoFM9-P9=LfFKSNqoTAmMQoox2nEw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5BGFAfJYFZGCStYhGoFM9-P9=LfFKSNqoTAmMQoox2nEw@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0346.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::21) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GV1PR04MB10990:EE_
X-MS-Office365-Filtering-Correlation-Id: bae3c87e-847a-4088-c422-08ddf088a396
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|19092799006|1800799024|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2x1YnFzSDIyUm9CY2JHdTRzWWYybVl4MlZ0cmthZXZtM01ocjlmSkNlZVVE?=
 =?utf-8?B?aU1mMGJ6YUV6QWZ0RVlXd0ljQTYraXU5VUNCOVVzNGwyOGliVDRhQ2VuM1Vi?=
 =?utf-8?B?aEg2R0dKMWxjUXRWTktXVVd5a0Y5bjR1aHR0VHhETkoyUWxJdk9ETWtseGRE?=
 =?utf-8?B?cCtKc0d2RE1rdkZMUzhYSjlacm8zMHhDQ0MwT0YrVUowVDFLVG1FQ2tlaHpm?=
 =?utf-8?B?ME5MazREZklkdThaZ2JnMGdQRGhTZU8yMEVtMlBDWUlZLytER3MxamxDVGUr?=
 =?utf-8?B?UHdwQ0JwSlI4bEZlTmdvSWVjSTJHZ0FpS01Zd0pDRTBvZXZaOVg1ZWhmdERY?=
 =?utf-8?B?N0dzSVMrOU0xTXlzOHh4Z0hjV2lpdUo2TitmdUwvT0JmeTlEYXpwK0JLSkRs?=
 =?utf-8?B?WitPalJ1R3BsY0hXTUdlc1RER04ycjZFV1gwbDN0M2VYU0ZPYndrMlZ1VmFn?=
 =?utf-8?B?QUhlbTRNQnBRQkJrdldvdG1zb2JwWERIdXdJbGVmc1ViYnJqcGVSTWhEUG56?=
 =?utf-8?B?Z2NxMVBWMjRSclVHak9tMHRNNloxVHhLb2gzU3JVNlhRbWlJTndXWDdaUVhl?=
 =?utf-8?B?ZElGTm04NFpWaGY0V056N1VZYTFyUHI4bDg3MlR2U2h1SzMrVE9sMkZPeFN1?=
 =?utf-8?B?YkdpcDZNZVhSaC9sQ1kxSEdDNVdPL1BZWDFKaW5zUkJTM3hUQWUxelZER3FB?=
 =?utf-8?B?dFVSNTFZempPZUcyaGtsOTdoVU44YXM2c0NHWCt4TVZDR3IzaFJLQXkvMitO?=
 =?utf-8?B?MjBMVy9vczhQQ3RkY1QveURWQjM4U2xmeWNJdytkbHFWL1gzMHRkQnNUMVhv?=
 =?utf-8?B?OWNQeGJRL2hwaWZqZWFDTno3N2d2dkFnUEZMdjBac3RNRTJrU1kyY3NybXFt?=
 =?utf-8?B?UStXeEF3NDZrek1zY1c4QW02d1lkRmc1VVJReWN4b3BwWU0vT2JyYXR0RU1q?=
 =?utf-8?B?Q3BteGcwa2pBdnlyMGZyWENDNEpVTjRmeHkrZWxxMDNUc3lMR29jNmEzQ3Ux?=
 =?utf-8?B?NEdNbTlmNmVRTDN1eVhNK0ZvZ1VzNmhKQW5YVGdRSzBmdUp6Rnk4UXFTQVFa?=
 =?utf-8?B?aW1mRmhDOCtiRCszTlVCSzFFQWdlQ3VCNmFuUDdiR0oxNUR6T0JZaTVlYVlv?=
 =?utf-8?B?QkJ5OVo3WnZyc2txcS9idHJpdU9iLzBkVU9yUWk3L0dWaERjSlVqOW0rWmFj?=
 =?utf-8?B?TnRVYTl2eUo1QURLRnN6dU1VVUJTeFVSWDVhT0YyUWY2OHZIYXp2VjY4cmZJ?=
 =?utf-8?B?ZkZnU2o1SnN4bmZZNmxoZ3E0QXZJY3RzMldWZGtubk1ZcHovL0h4Vk5sSm95?=
 =?utf-8?B?VHZxWHVuUCtrNzFlcTBlNDcyY1RBNXNobEgwNlZYZ1dvZDRtRmduVU9JMHdi?=
 =?utf-8?B?c3B1SFdrNUxpS0FiaTBPWVFOSXlRSEZ4Z1QwczV0N3ptU25hSGg0akhsSE1x?=
 =?utf-8?B?Q0FWNkxVa011RkVpcWtMank0Umd4ek1DcnpJNE5tNHVaSlE0cTVaUmgrVm1r?=
 =?utf-8?B?TldLcWNaQ3Y4RDlRVkcrdEg2d1ZDY1JmbU4vZkpEM0lPb1BObGJpN293bHBj?=
 =?utf-8?B?V1Q4TzZPTWFJakZVZ28vVVYzb1ljNlptRmhzR3NFYkRjcXFnbjdERndMNW9B?=
 =?utf-8?B?QU5HOHJGUENsN1RNUUVaaTBuVC9rKzFEZHZhakFRWm1RL3RrQVB1anVUWVgz?=
 =?utf-8?B?NWRneWFSRm91UE5ON2lrYzFaM04zYUVJSDVsTGJUZDJHMXJuMWdyYzF4ZFlW?=
 =?utf-8?B?RHlWeTh4Znh4TnIrTklqamNkOEVrVTU1ZUtOR3dQWFYrNFpIS29WT2l5bHJK?=
 =?utf-8?B?cGFySTdnejBZZ0p6OWFiS2srNDhjTkI5NlNuMzVQMGh5K0N3NitJaE5pdUJM?=
 =?utf-8?B?clYxTENWRFdqVTc5OXNpVUdxbWFxTWhORGY1VGdsbk9IdkdHVTB4bDUwRmJU?=
 =?utf-8?B?WnNUcmhtakFTamFFalcyRTVMdEpXV3ZvRDdjMW9MekgvRHExWWMycWtFYjA0?=
 =?utf-8?Q?SbXAREntyfXlKFSASX3d9o8Wd9lQRE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9626.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(19092799006)(1800799024)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEErS3BaM05SUDM5MGZGUWxTQmo0YzVrT3lNQjNvRFNOMEhDSGZuTWxrL2lT?=
 =?utf-8?B?ckZDT0ttNmQ5RHBiTmtEY1JGZDJtSkxmemQ2S1J1aEtFN0lsZEZGM2ZnM25a?=
 =?utf-8?B?QlpqL2tZaG9pa1E2NElCYWRqNytOSEdXeFBzeHhYem1EeUxWZnkrZmRYbStx?=
 =?utf-8?B?NkFNaG84QXU3UktsVmZPTUxWRFZTM3U3bzAxT2p4QU02dWkxY1I1dytXYXBh?=
 =?utf-8?B?cXJJQmJpU0R2aUcwV3VNb2hORGlHcFdLSzF0TzB6Q2dMS1RRSUFFTitnc3pP?=
 =?utf-8?B?VzVzeXNWdkF0NmI0V2ViMzdWdjRkclVkWlN3VjQxWkNhY3hGWklEZDJhV1hs?=
 =?utf-8?B?TmdYaU1nMVlFdnl5WTdYYWVRdmYrSS9zbXZsQ3NTUWVHL0tFWFJxaTU4L2w0?=
 =?utf-8?B?ZkR2SmVqNzdEeDBVa1ZxWFo5MWd5dXlJaVRqK1V6N2djV3NHaHRtdnpaVDJO?=
 =?utf-8?B?YzRsQnU4WktpaWFYbkdjOTM3N0IvdWNZN3hLbmIxckJHbnNjU0svbU1Hb29F?=
 =?utf-8?B?ZXppcUdpTmh5OVVVdm84UXllRklBMGs3V29tSXFCR3YvV21uc2pjRStBUis0?=
 =?utf-8?B?M3JQTnJSTzVVejZaTURhbFk2NjNWcSthcW5rQkhYVGd3NXRZbUErRWpGOTF3?=
 =?utf-8?B?QmxUd1VMSU9OMzIwcG9oNUt0RU0vZGQ0bXRiM0VhZGhvd0l4cjdvbWFtRm9l?=
 =?utf-8?B?anNxb2tKV0dGT2JLbzhhUENJcE1IZmxhZ01pbzlENG9DMXRtTUFyOEZ1QkRY?=
 =?utf-8?B?OTZCaExnaGJmSldqRXNhdjREbkNIZWpJSHhNakhZbW4vT01TUEZUS2YzVlhw?=
 =?utf-8?B?NkNEZHBVc28xSXQ5N2FzOEFlanNuNGY5ZTlmVkZqeUxLQm9CeWlCaXdsZU03?=
 =?utf-8?B?TFpvbjB2MS9qd0RmMElFYTRXUGdjN0liWGZOS0VXcmdobWw3dXZ5WUhwTnRF?=
 =?utf-8?B?WitRSDVsRVNGUC80TmZMb1NlTWV5bjdublFkVDdrMStFdWpHMzljd0x1SkN4?=
 =?utf-8?B?NTYrV09hYzZNbDFCNnVmbTVCTTNCL0ZtK3hTdTU1YUlVbFg2NVFheHRVY3Bz?=
 =?utf-8?B?dm9DdmI2SWJrV2RIMUZpc1g4bGpRNG03RTVUT21ReDRzUExYNmRjNUVrNVFT?=
 =?utf-8?B?MG5XUFVJTTNaK3YzbHM3Tkh1WURncXFmVDdZZmNWcHdUSHJ0ZjRQRXArcmZG?=
 =?utf-8?B?bU1rZE51UHp5ZmJ4UjIyTXRRZURkcFRVNnBQM1Uza3o5L1VkYmQyejRhU2tv?=
 =?utf-8?B?dTBWOElqUjMySk45aFAzRGRpRGlIUGFoVUNlMHVpQm9IWXI3THlHSDRqVFBJ?=
 =?utf-8?B?UjhXd1Rlb0kvdElFcXlsRkVTMDFXUXN6WkM4cUlaRnhGVDBZYXZaSGZpM1BY?=
 =?utf-8?B?N1F4Mkova3dxS1dWQWlLVWJhdEZLUlNoT1lKTTg0c01GeE5lRFdQaDY4dmxw?=
 =?utf-8?B?eWUxN25odHpjMWQveE9GaHFaVmIzeEN0am1PSEFwQjZpeUxaWmNwR2YvMStU?=
 =?utf-8?B?d0s1ckdDczNBVjFrYVo3VVJZSndJQUEyRDR4NlMrZ3JFWFBUZkZjOENNZXR2?=
 =?utf-8?B?Nmp2MWV0UlNJZndLMWhWRlVWV2xtNk9YVFh6U3ozUDdCYlZvZlhqZ1h3Mito?=
 =?utf-8?B?SVM2VGRZM2lHNUV0WVB0SVlHOEZrZVE5TTlLbzViMWpoZ1lxSzJCb1Jxa28y?=
 =?utf-8?B?emVhY0xCMEpvblhRTi9ZcG5uM29FTkhqWjM1Vk1vRGJiajEyNE8yNVRvaUlm?=
 =?utf-8?B?QzBQdGVsdWVIOG5IaCtKclpqYXZ4YzFVek51anNBVmJjYmdvdzJCaTFSR1JV?=
 =?utf-8?B?a1VsWGk1RmlzS3F4bjdPK2Zod25nWDJYYnI3MmdBSldnc1RRd1kzTUpGamxj?=
 =?utf-8?B?bWxia3JyT1gzNUJkN1VZRTBNK2oyelNRQ2VQMEJuVWhjSU1sOEowK0FHTFhy?=
 =?utf-8?B?NzVNaDRPTGRTRUFtZ1c5MVpVeVh6TEVTNkN6SVBpWGVJdkRFL0tQSGs4SzBs?=
 =?utf-8?B?Vkd3ejFUSVd6VW9lWGhDbWw1bUQySkVJVW5KSEp5SXFhd3dKcDVuNWM1cnhE?=
 =?utf-8?B?WlYwaGZneUJyZjBMOXNhWnFOaVVQLzJSY3JzaExGL2hkcjVuSGlYMGZSRXlC?=
 =?utf-8?Q?7HkjsuPSZVFXLdMLu2dw/PAb+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bae3c87e-847a-4088-c422-08ddf088a396
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 16:39:40.8915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B1ahDUPK0n7twJnE/22Z8w9xVSw+gwxoKYuPjK66LSk8J+wORYxscOp4dFjjNRwMEpUCXSJ6TisJnwXBsW2hsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10990
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

On Wed, Sep 10, 2025 at 01:36:32PM -0300, Fabio Estevam wrote:
> On Wed, Sep 10, 2025 at 12:56 PM Frank Li <Frank.li@nxp.com> wrote:
>
> > > compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
> >
> > Anyway, you change dts. If you change dts as
> >
> > compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif";
> >
> > needn't update binding here.
>
> This was discussed in previous iterations.
>
> The change you propose may cause regressions for other device tree
> consumers, such as bootloaders, where the match may occur only aganst
> "fsl,imx28-lcdif".
>
> That's why "fsl,imx28-lcdif" fallback needs to stay.

Okay

Reviewed-by: Frank Li <Frank.Li@nxp.com>
