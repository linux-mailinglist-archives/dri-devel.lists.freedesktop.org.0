Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKWoNq4olGk9AQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 09:37:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5CC14A06F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 09:37:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB18810E285;
	Tue, 17 Feb 2026 08:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZSWjDyUs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011013.outbound.protection.outlook.com [52.101.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDF610E285
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 08:36:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVA/IhRwzRptJjE3E6b/ViSJMSkoEBz//S87YGGdevy0Pw0sOQKUBZM3U+PpDZvvUm5FmMdLuiOvwCVxTeBpC+2t6K6lRFJqfabdzvyi9Jug8X6HzxAuwpN57vp2xwh7vrHGUz2McjPt/vfurZMFZ+0BA+N0P82WVgNoZA/BIVYvgFBet9Xa/YNac+LKb+z7JqrSeGadQu2g0o1UKtrgAQeLan+VQ5Co0jKJ2TYlJ+mkvjNmOmSXUpWvQ1vxyS6BreMsRxhn8WFIaJMYZMl9HWzHfrPhT8mIFnf2QVkc9kWL4LBXLnzLNQKa2XlkMwTFDfWagr393RPPGXMqF5iwSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKLM5OY5SOJ0hBYMkFg8sUF6s0LGJKqq563+bnxfPcM=;
 b=T+Kvjdgz0DdAwi/fD1WQCf+unq0gkwNPv4ogjgDy8GmTKE8nkSBBfpOAkkkjEm6jajw8rvls7xD1OZqJZlMinw3Es/mnKhqm5F2Qa8v9sS0N+BdnUb8riYZOyIAnNaCs8X4Va1NirPBVjAAELR8OiMI2t6DtYT6Wfb1OBbV7TBGycwNmAK4Wk9WHyhwcKffLYhNjVV2KziGtlTBftbICVQwpUJ9dADAg9Z+BJE/lk6YF7GFcUYTO5omQZzeF0136cBirymEbd2uV/pHfL4vyD1mVrkRdqJN733euQEVvGKlzEQ+P6KEwYFuCKlEnTcHo2CeDX7/mwqxFKM9vm9G7Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKLM5OY5SOJ0hBYMkFg8sUF6s0LGJKqq563+bnxfPcM=;
 b=ZSWjDyUsLf8NtoSHgnrojpIIDRD6aKXajB1Sx5JNsaxDxFZs9go4xL63efSqsz9qs/FD7H3BU2cA/87DYTEkkFVSviDK0XY2Ercf5OPEHYJ0H40LlHl0YH1vf6kNrDudlI7rYsH9tZpNCYEZ54nH+SYO4qAaVtOol9gg+FAjuVOLjqdjXsn0vbLaOm10Z6HSPSmvk9CMb3JGGtAQMeqmXed0zCKedkDByVOjck2XNiTCCQ9Bm3TGo4fx7kMcz9MVxh0UAvUXVBrFMl9w1YdYNYGGXZkRrCSXXKI/K7qGWKr+Khc3iPlYFm3lJvExhNQPOR3TLe30quuE2bI0xXw+fA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AS8PR04MB7704.eurprd04.prod.outlook.com (2603:10a6:20b:296::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 08:36:54 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 08:36:54 +0000
Message-ID: <128cf3c8-b75e-44a9-85cf-8c19f91fa646@oss.nxp.com>
Date: Tue, 17 Feb 2026 10:39:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] dt-bindings: serial: fsl-linflexuart: add dma
 properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Larisa Grigore <larisa.grigore@oss.nxp.com>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 chester62515@gmail.com, cosmin.stoica@nxp.com, adrian.nitu@freescale.com,
 stefan-gabriel.mirea@nxp.com, Mihaela.Martinas@freescale.com,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 s32@nxp.com, imx@lists.linux.dev, clizzi@redhat.com, aruizrui@redhat.com,
 eballetb@redhat.com, echanude@redhat.com, jkangas@redhat.com,
 Radu Pirea <radu-nicolae.pirea@nxp.com>
References: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
 <20260216150205.212318-10-larisa.grigore@oss.nxp.com>
 <5c0251b6-5228-4077-a21f-4da179949b90@oss.nxp.com>
 <20260217-stirring-warping-partridge-dd9531@quoll>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260217-stirring-warping-partridge-dd9531@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P189CA0013.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::18) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AS8PR04MB7704:EE_
X-MS-Office365-Filtering-Correlation-Id: d5014368-2f61-4848-7378-08de6dffb3d5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|19092799006|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkNsMGNHeGRMTXdueEcwV2JOaURhd04wT0hjWmkxNmxNZWE5YWxlNkRFK3Jo?=
 =?utf-8?B?NFk4dmRqOVlDUnY1Z2JXQ3ZNSzI1cE9XSm5Ea1FROFlPYVh3NEZvdmU3RWxF?=
 =?utf-8?B?ZXpGdW5JOG1yeEN5eWMwdmtNVnlTWEdUUFhhL3hReTJqOVVnWEw5MEd2dDB5?=
 =?utf-8?B?QWpQRXhrcDlxYU9qa0xPNU5OaWw1bUdHaEVjNU5VSjNrSGJia2d4cE5NaWlL?=
 =?utf-8?B?NkQxMVJsTUtUTWdkSWRXbnZhbXRxS3d2cTV4emdUL0Q5S29NSTVIMWkyZEJj?=
 =?utf-8?B?UTJBNFlIWVYyUE1nVktNR0R2RW5uNDdSVmRYU0w2NUt5bkIxbmpJQXRqQ2Yv?=
 =?utf-8?B?N2N2YW5LdC81clZqWk1CQzVQTmVzQmEwcmdaS1pLMkVOVTF3OEQxczcyZDVy?=
 =?utf-8?B?YmlxM0lsQmZwN3dmYVpCNUw0TnVWL05ZY2FnR2hHV1YwNDZzZVhYa2FMQk55?=
 =?utf-8?B?eW1iVVlUUGdXSUFOQ2pveG5iRmFNcjFpNmVOeXNoWWxIOGFxZGlYSXdIVktB?=
 =?utf-8?B?cm5Rb2kzMXU2RXE0WktRS3JONCt2MGhsSnR2WlhqSnZpNVlzNGljMXN3Uk05?=
 =?utf-8?B?eEtjNXlkRGpCWUMyYktCbHZvMCtRUVUvZzZDTlQ3U2JMVnRoR3RCT0FTMU9W?=
 =?utf-8?B?eHRpYmg3RG1XY3N5dmlUNWM4dTU1U2hMSUFLMU5wdzdTUXhkaFNhdmt0WkJ0?=
 =?utf-8?B?UGVJTUE3czBxc3pkdzRXSUlzbHlYZ0NDQ3l4MEN3RGw0MkVjVjFibHdOUTNk?=
 =?utf-8?B?b2tXQVlucGxsK3pneTVXd0E2UktrUHJBKytJUVArWjBkbUl4QnNWVG1RT0hK?=
 =?utf-8?B?U2c2VWs5LzNsaVBrMGxzRzBLd3poeGZkL2VqdGtjL0cwMFY1a2E4UUttQ2hq?=
 =?utf-8?B?Rm83Sm83Zk96QVJpUkNMNjFHUUlRc0M2YUxhOE1oMFRKdjI3QXkrL25BeS9w?=
 =?utf-8?B?YndTVlV4ajQvK21oL0pKTFlEVEIrcmhMTUhUUG1hV3BwR1o1YWdIYWREZFpp?=
 =?utf-8?B?NGo5V2w3V1RzanZXZG5QRVdNb094dzNJV3ByTGpSNkxkdjFlMzBveDFoSlA4?=
 =?utf-8?B?WEV2bDQ0N3pYOVNMUVEwY1VFUmpHeEJGQnpFbmRzdUp2UzluQ0hkR0pWV3RZ?=
 =?utf-8?B?cFNjakRZMVdIdGZYYTA3bVRMSUhlTk9kTi95dXVRYXNmT1lGZjducTdkWDVF?=
 =?utf-8?B?TFdWZlBvcDdsa25ScXk0WVdINUpoL3NIaEVvcDhadjY3dVpzNFdoYVU4eFNh?=
 =?utf-8?B?UDl4N3ZPaTFhMHdYZzFDT3o2Z3ZjbC9Sb3JKT3d0QmtsTTNXS1JlbE9FcWhZ?=
 =?utf-8?B?anI0RDFJUUphYlFqTlF0M3BTejY2U3ZqWW1QYlQyL0cyRWpyM0E5MndGYkNQ?=
 =?utf-8?B?aW1mNWF6MU9wNWlvSjF3eXhYWURwV1gwai9TOWIrQVBLdVE1NWp3aC84YlUy?=
 =?utf-8?B?K3pyYlkveEYrYjdEc0FXblZtSzJYNnJZbThOajFBS0YwZmgvQit1cW5CVWUy?=
 =?utf-8?B?TDlOSzFiVi9xOUJEUElheWdveGNLeEdOaUlwSWtOb1RsS3lVMFpFY3JNL09u?=
 =?utf-8?B?MlVrK2k0MjJmRjQ1czQzMmNTTXN0SU9vd2gxUVdnM0NqSnpuMnN4OThvYTFO?=
 =?utf-8?B?aGREUjhlclM2RS93T0wwQkd4Sy94UXR3QlNwSDdLbEhqUEZBeTJ4RzVybGJi?=
 =?utf-8?B?cHVmTWRrRXB1bE1HSlQrRkJTQmZGZ1BhOW5ZOFV2aWc3R0xCNzl5S1l4SXdu?=
 =?utf-8?B?c0hPMXk2ZU1pUThjM05xTzlhclNzeEZrVTlHNFAwREl6UkdDODNDaEUwVTRL?=
 =?utf-8?B?NzJ3TjEwcUxBSnVhQnBsdlp5NFQ3UHRKb3pRc0paN1hQY0UyakN2bE5JV0F1?=
 =?utf-8?B?NldqdGg5NnBMOEVHczVkcUcrSW9ES2xVa1FWaThkT0dVR0JVVVJoUHhlSFFJ?=
 =?utf-8?B?bXVYdW80SkdINWpBL0krWEtNcUs0aURseFZMNjJDNVZiaUhkOUFBaGxreHQ5?=
 =?utf-8?B?WG5uNmMvUDVPM2w0RjdTLzNLYzNzdXpTRUVqVjNRNmVtVU5GL1NTZUh2dzJw?=
 =?utf-8?B?L1FtSFRacWJUbURvWVJwWWRWV3BKbER3cGZvdnROdUQybFlUQm5aUnVUd0dM?=
 =?utf-8?Q?XeNA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8247.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(19092799006)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzR6MmQ4QjloU2ZXT3FLcDVweVNERU5rQkdKN0owb0QzUFRSWDY3UE5PL3BZ?=
 =?utf-8?B?c1NJTWNvSGV1ZFkyRnNmcXhjKzdBZUFUaUpGNDRGR3I2TjJ2RnlvZkEwNUE0?=
 =?utf-8?B?d3g0dllYSHpLdHJhQWZmMFhKdkdWU3VyazVaMXdjUEIwamRmaHl0MXlDVVls?=
 =?utf-8?B?di9FdzNWeWMwRlZXRWVKOTZiSGpkZ1JGMzVMclh4R3YxYXRUK0ZxK2crNU13?=
 =?utf-8?B?bmVXcXIvZUNCSFlPOEhxd1dYbld2eS9EY3JIUEVZRTRTR1piSDVBenUvdXBl?=
 =?utf-8?B?MGQ1MnZSRDNEYXEyVTA4V0szZlFmWWlMVzF3cUpWdE9vZ2RRWDJiaDI2cU4z?=
 =?utf-8?B?eVRDQVEySW55WS9XY2VLWnJKZDY4UzF6V1NKMHplMHJ4VzJsdUN2YmsrZEN6?=
 =?utf-8?B?bFVQV0cvSjM0MnU0RjdsYzZkckE3U1ppek1EVVRNQUl0czFYbldLUVdEd1Ro?=
 =?utf-8?B?YXJqU24xZU5vR3ROK09KcjRZMGlaR0VSVkxKTFA2NmZSdFphY0k2RXhxemZN?=
 =?utf-8?B?YkxSWFAyTytVWi9wek53WjdYOW1CaDdmRzFRcUx5Szg2c1NaVno4eXJPN05w?=
 =?utf-8?B?NVU1MytFZjQ1d2puRHQ4RFdwUVFtLzlOVmluaVpveGY0Z0FBWGo3SEZINnRF?=
 =?utf-8?B?YnN5bHFPVEFXK3lrWXB5VS9jWmxOZnBIc1RndFZOdDBLQ1g5WjY0UTRKaUho?=
 =?utf-8?B?REt0M1kxR24rampGWkR6TlhvVC9IYVY3NkdnQzBVNG84Q2lWUFM3b1pmUXFH?=
 =?utf-8?B?dmhUdkNGWUR4dmp2N1QzazB5RjdxcWIrMUVmNkJuei9MdHRQOW5xSjRMNXJw?=
 =?utf-8?B?YlhkR0pvRm1CYkRlNkhpemMxRTl4YVJnUW1mNTVkZTVXcWZObjE2c1l6MlJY?=
 =?utf-8?B?bzEyU0xqbHZlenhHYzkxMWtXNjNXSktGS2lmYmNZcmJQRVhVNVFHcEpOeEQ1?=
 =?utf-8?B?SC9HWFE0K0ZWU2tyQUlRaEc5VStJQm90L1dEa24xaFQ5NDAxZ2ZHQ2ZQck1S?=
 =?utf-8?B?K1pEUGNJWWIzc0RSLzZ2OWYyR0lzeldrb3hLRFlnQzNkZmhNOFptVzl3d0hu?=
 =?utf-8?B?WVo2SVJrZFg0YzlXenV2SG5ZWWoxR05NaHMrbnhueGJTWHk0U3VzVG0yWTE1?=
 =?utf-8?B?dUVUMWFGQ3JvRlJTTDF5NW1KZEt6a3ZSMU1nelZYY3RXOEwwUE8yRHhKNmx0?=
 =?utf-8?B?UGJkOVJNWjNHVS93SW1jK3E0d0VGbzQzN2VNRTBYdnl5RlBXTVladTZvMGNJ?=
 =?utf-8?B?TUIzdjQzRnk2VlpyUU9ZckVJbGpSVW1ad1hMUDdVTUV0OExZK0lkeEtGOWJG?=
 =?utf-8?B?emlGS1pVaFBSN1hvam84RWZzUkc5blJTNnR4NUlDQWYyZ045dDBXS1krY3Rj?=
 =?utf-8?B?Y0pIdTdwdE1qU0dxYUo1MXlJSFlzRmd2TURRM01CdldHcUwrNzBaSktWQTlu?=
 =?utf-8?B?SzE2blFYeVhsQmlKU3JyVEpWZVVycVplQWpOV21Cd3ZIS3lpR2hKSTBPK1Zk?=
 =?utf-8?B?UGx1UjZ4b3VYRUcwc1h6WGtxV1piamJrdGdaRmVNSHF4R3RwOFNBUVFmVXFR?=
 =?utf-8?B?djZYSFRjSjZjZUdOcDlPTDNiTmhscVc0akM0TE92bFNycTdvNHZaUmkwQUF2?=
 =?utf-8?B?M2ZwRmVBODZqM2dnWDd2L3p4d0JYaFFGQmh3aWN5bEtjcE90b1dHTzRIUzdn?=
 =?utf-8?B?Z2VVdnZsKy9Mbld3eGw2cWExbEpuOW5wWmRhbVVJbmoxODR5OS9YNUJKU0JG?=
 =?utf-8?B?bkhsQm9BWTUrOEVEaHJvcTR1V29GNDhYVXpZb2FaT2RMU0RSbk83LzNwemlQ?=
 =?utf-8?B?WTlleFMwaVJoN1docWNGOFZ0S1EvTzJVWm5ZalZSWDYvSkFOZHB2RmYvLzNL?=
 =?utf-8?B?QlF5S0JsNUJuTGFXQWtXb3RjMWN3OWQ4V25zdEtQVzVYYU9xVVZKN1JkNUlE?=
 =?utf-8?B?aW1OQ3FZQWF3WFVEK2doMXNHU09keW5kU1VUdWFTSGlaSUw2NFgrUC9mMG9w?=
 =?utf-8?B?NHJsekVPeCtJVjRVbXcweE5WeFhiTHdaelpnMXk3YXRPOGloYUQrOWkzOGpa?=
 =?utf-8?B?RitkRlNHOTJRdEMrTHZDZjBDK1lVdHpuQzBYM2RrNjhzVXFkWldqSkl5eVJj?=
 =?utf-8?B?NlBzaHVDZStUajdxTDFFNU9jVWlHOGJMcHdaZ1BxQUZZTWJSRTcxMzhxTFVV?=
 =?utf-8?B?RE1BMkJIRnN0b0NMeElhZmZRbm9hZFpsK3hEcXZSQ2xVdzQ0WjZSNEJtL2ZX?=
 =?utf-8?B?T3Z5WmdRNjlxZ3FDL3VWeG5UditQaE9sZTZFcjZEeFhUQUVTcGtaQkU1WDBu?=
 =?utf-8?B?dVdSZGdrcjJrZ2tVbit0UlRjZGVyU1VLdDk1YTg3RExTbGM2VFJ2dz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5014368-2f61-4848-7378-08de6dffb3d5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 08:36:53.9290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dv04/dujB8WAFCZk+J23gUWNhhN90D1keETtr+9/HLmHhCK1ceNBGaN9CUCuqPex0CjIY8hQJg2HOtzYP/kOVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7704
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:larisa.grigore@oss.nxp.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:chester62515@gmail.com,m:cosmin.stoica@nxp.com,m:adrian.nitu@freescale.com,m:stefan-gabriel.mirea@nxp.com,m:Mihaela.Martinas@freescale.com,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:s32@nxp.com,m:imx@lists.linux.dev,m:clizzi@redhat.com,m:aruizrui@redhat.com,m:eballetb@redhat.com,m:echanude@redhat.com,m:jkangas@redhat.com,m:radu-nicolae.pirea@nxp.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[daniel.baluta@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.baluta@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.nxp.com,linuxfoundation.org,kernel.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev,redhat.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,oss.nxp.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,aka.ms:url]
X-Rspamd-Queue-Id: 4B5CC14A06F
X-Rspamd-Action: no action

On 2/17/26 10:10, Krzysztof Kozlowski wrote:
> On Mon, Feb 16, 2026 at 05:29:57PM +0200, Daniel Baluta wrote:
>> On 2/16/26 17:02, Larisa Grigore wrote:
>>> [You don't often get email from larisa.grigore@oss.nxp.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> From: Radu Pirea <radu-nicolae.pirea@nxp.com>
>>>
>>> Add 'dmas' and 'dma-names' properties to describe optional DMA support
>>> for RX and TX channels in the LINFlexD UART controller.
>>>
>>> This allows the device tree to specify DMA channels used for UART data
>>> transfers. If not specified, the driver will fall to interrupt-based
>>> operations.
>>>
>>> Signed-off-by: Radu Pirea <radu-nicolae.pirea@nxp.com>
>>> Co-developed-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
>>> Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
>> If both of you worked on this patch then the last lines must read:
>>
>> Co-developed-by: Radu Pirea <radu-nicolae.pirea@nxp.com>
>>
>> Signed-off-by: Radu Pirea <radu-nicolae.pirea@nxp.com>
>>
>> Co-developed-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
>>
>> Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
> No, the DCO with this authorship is correct if they both worked. Nothing
> has to be changed here.

Got it now. There is no need to add C-d-by for the people listed as 'main' author

via the 'From' tag. 


