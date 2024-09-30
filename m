Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55657989DD1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 11:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B4510E3D0;
	Mon, 30 Sep 2024 09:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="j3jwQ/nk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2052.outbound.protection.outlook.com [40.107.21.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401EB10E3D0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 09:15:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJQG4irWctVykHb8vPXt495iPiAGxL8cBObZZnnVPz2U6nq3rYHk/JJdlKoE9dNMTeWwVs0X7aCZr+LCetobhRbGb1SHaUQHVTNEnKMxC3QV1Erny+oPxY/806FGGdYKBdYpBKbHZw0tVZ3EvWwBJWEKBJBVBuz9iyrz9iRrGp2N+3OBeVV0xy+0YmAoXaZ4+N88dP7wQHXnvuo64j4i7b3NbsCe3V+G36ODM244bFvwPSvK+qBgQ4a1+8Flv3Hs+PQDqWj8C3wagvWctyhuQ+i4VKanHdAn0t+LSWZONg8loYYs/RB37vfqv7NwNPv4VxNIfCfZsbMYiTJMsjNmfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=860+qkYkMzLGA6hJlNSA4i0DCO6f+MNotwgK+rG983k=;
 b=ZBBt7DazFHVm4TiAHIA3zt+bQbV4Ts7IfBI7tuRpiVLf5MoQKO7FfxA+QWvfyjWwyj1g5hip+YpE4rkYFwyw1oJZ11dlB13ouOxfJSqCW0aHEU361OpPAa/nFd6nndb1trA3JcDg/9ntawOUMFo5Viw0jDt31f7DeAR2qBvNxm9s26iZ6eTDjMs4jbQlW05XqG4kmxjUbtfZlebLwQZVt/8e5Rfv46ow9JYBShLvdwnB0MFpuFr+0BqeXmbmHGwWRsXgn5a4zL5dhk8m8dbY4S1e10G5vcSok7X915/F6EXqoXpF70YAA+r/huQvMqD8TnjoJftmInk0b476Iz3d/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=860+qkYkMzLGA6hJlNSA4i0DCO6f+MNotwgK+rG983k=;
 b=j3jwQ/nkGGtx62/JcBb1MH7c11A1jaPHNxewwMgnU+AN61L80mPYApUJzdUjamxCMVz++2ZUpdHFOVoRNOcan/E07z5AKGmhj+Ht06l6PTreiSJFDZYcCEPqlpPwG4ivG1WWARdsx58xZLwGCsZbkH9xeBFrGvjH4r7iJGG6Heyxj+SaLidbjdixRpMdW1kxUjRKC3gqFsTMeCjAJ8iNprhe3VJLSBJPUsxToffXR6skCIPgVUGBzEYHdHJKdlqhYz2WS2m39H0zd1JW1fa3KtGtvp2Tn7/zSwXDRkzEoBuAEMMpj0Ui0dJfxdQaoOimJcL1wfY0ZAvZgDBzb9OhCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8023.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 09:15:44 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 09:15:44 +0000
Message-ID: <b5ad1ace-4a0e-4a17-91f3-6b374ef168c7@nxp.com>
Date: Mon, 30 Sep 2024 17:16:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] dt-bindings: display: bridge: Add ITE IT6263 LVDS to
 HDMI converter
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
 "y.moog@phytec.de" <y.moog@phytec.de>
References: <20240930052903.168881-1-victor.liu@nxp.com>
 <20240930052903.168881-6-victor.liu@nxp.com>
 <TY3PR01MB11346CF2BE6F838A718E64F5586762@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <TY3PR01MB11346CF2BE6F838A718E64F5586762@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI1PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8023:EE_
X-MS-Office365-Filtering-Correlation-Id: 47417550-29fb-4c32-727a-08dce13076a3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3hQdWEzeXVsRERTbk9IZjZrNUhLYkxZQm0yNTE0VzhzRFdYMDRoaGZ6RE15?=
 =?utf-8?B?QWg3TTBrWmNlYkFHbFpIUDlHelVicllobWVQMkJSZTQzT3FrUmJYSFFBWHRO?=
 =?utf-8?B?V0VPZXpDeWZ1aW5PSlpzeTNEVWpYbUphSlNlL0N6cmg3T2N2YmpFQjZtUnEv?=
 =?utf-8?B?ZG9lOUhVUlhmZmFLbjZaaEhibzBUNXgzdUVoRXFGNm94dmxNcHNZSnVXUEhQ?=
 =?utf-8?B?U2Ivdm12Wit0VHNZUUpTbnRoOC9XRThNV3FUaUJnTHdKZGUySDVwQkJVYmNY?=
 =?utf-8?B?LzQrK2lHaWlOKy9pblZ0QlpZNjE2Z0tSR2xuRGkwOHRzWE1kdFZpTFZmZlpR?=
 =?utf-8?B?RW5LY3NsbmJwYmZUQjVsUm1PZDRsUWFnU3FOS0pQamhoajhxTVpRNjQxdUpM?=
 =?utf-8?B?dThCdW5MYXgwREFvQ3FqUElsdSs5ajJuNWJhYXY5RnE1WmRoVW0xQzZyZlhF?=
 =?utf-8?B?anNhZ3pIenZuVzNkNTZSSXp0UjNoM2VQdnYrSmFENHhmdjRrRFlyYkxJZllT?=
 =?utf-8?B?dHNDTzEzWkJra3R6UDROZlNuVWtlTEpSUDRaZEE1RllYT1c2UlFKOUFhVGZq?=
 =?utf-8?B?YlF6eGJ5d2RPbmswTm9lQUIwT3h1ZlVJb25heVRDZ1JtWGREWE9wcnNvQU9I?=
 =?utf-8?B?SWY3UTBZT3pOZDJvYUVzZnVRU25BaG5WKzQ4U3VJWGI4QitzeHJjMFFyL1g1?=
 =?utf-8?B?ZitsNVRDYVltQWFRdGNZS0w1djhSRUtBN0tzSHV6MkcwQzBKZUpXeitmbDdK?=
 =?utf-8?B?a3RRV3ZiMnhMWHdNOHFSOGwwdGUyeWdjY0N1OUZvRUlMRjM4SXB3U1AwcU4y?=
 =?utf-8?B?bHBsd0FTekErekdoM0lQek1PblpGdFd1S2tSanlOU1Z5d0JGSk9xU3NnTEd2?=
 =?utf-8?B?QXdmMFBUVUlFZm1uRVJxdWhDQU9tVE9hZFNoNjZ2MnVxYUtvekNVZ3ZXUHhM?=
 =?utf-8?B?Qzk2RmdLamx3M25nMXJPNTc1VG5JOFNxNUZXVWdTZFNUQ1RONXJKMXpzQUNB?=
 =?utf-8?B?Lzc4S1NRL2FZSTk1YnhyS2JQc3p3QWhLYTN4L0pyT2wrdVM2alRORkpZSXp4?=
 =?utf-8?B?ZXYxODVFVWQ0N1RiMkVid3dQY3I1djFZWVR6amIvMzRzQVV0Z3RUTWJUN20v?=
 =?utf-8?B?TW1JZ09GVkZJWDZBSGVIb3JKU1lueHBUZ0FodzZpVjN0d0h0YTg4anNtWW1l?=
 =?utf-8?B?YnZ6N2Q4dUJJekE0VUtqcmFialduWkt3aEc0WVVHQUNNWWVKbDdMWjlhdTdo?=
 =?utf-8?B?eCtiWlVWTkJxK05MSzFROThjVjRYUE1nVUV2eHZ5MTNYZUQxOHNOOTJWRWVh?=
 =?utf-8?B?R0pxdUt4akE4WmtDMmxIOGZiSnduWVlDMU5tZEhYZzREelRURGRSV1RFelRT?=
 =?utf-8?B?UkgxV3IxTDhMTnhhRzZzSjJPVll6QkpZZktzQ254OUJ5b2hKd0gvY3Z1eks1?=
 =?utf-8?B?S0dJUjFmZ3hiNE9tZGR5Ris2NEQwTE95cFM0MHRlb1RXWUZUcUJrSVJiVHFm?=
 =?utf-8?B?ODQ4Tld5d0M2cFBXSFozWVdQeWhhVjRQL1NDS2tVZnE0U1N4YTV2ckxNS2F4?=
 =?utf-8?B?Y0FMb2ZNQ1c0d0sxak51ZGRUWE9MdFdPUVhzTjUyUkpiNy9WTmN3Z0FLeTZN?=
 =?utf-8?B?TnpUcVp4bXlxV2gyRDVJd1dVSmtleEJnZnJjeUdYNXJ6Rk1qR0Z2dERZSUZo?=
 =?utf-8?B?SUo0SFBOSlJBN2Nqd2JoWTdlVmZYMmZLQzZSeG5YVmp3TmNjRWhwcEsyb1Z4?=
 =?utf-8?Q?h6NK7G4+J7vn7J2Jfc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NU5ZaVhTTUZDZEZmSS8zYzVvOHptbnZEdWhpbEtHQUVSSkp1Rjl4UDE2OHVO?=
 =?utf-8?B?MFJqcHZrMkpyQ0hkMFRyeWVpQWZ4V0IwekZiRGovWldyUDNsNkwwS2xRaFh6?=
 =?utf-8?B?M3hRbkFzdE5KOGtuaEFzanlUMVdoUVdRbFdlZ2ZGTFRJSFl4ektsZitYWjNp?=
 =?utf-8?B?ZDFEM3hQRmZxMlhrN084QmdiM0J6dmRXVVRXRzNUclVUdmhpRzMvY0VKTnhP?=
 =?utf-8?B?bVYveUpac2NtbzdFbEt1dTliNzc0RnRLbG41TDZVaFlzMXNvWXpVU3BMNkJr?=
 =?utf-8?B?MnAvcmcrOW5GeEkwd3BYZ3YzdWtJcW1MTzFsVXQ2UHhDQ0EwTkdQbDd4cS95?=
 =?utf-8?B?ZjBNTkZORFcrWnNDeEtwblJiK0xqUm95WUwwTUprVDBIS0hUTFgzWGlNamlI?=
 =?utf-8?B?b2txMDZsb1FQcHlSUzdpRFoycFhWdHgyZGFPbmZKUGlOUXhza0kwektJcy9D?=
 =?utf-8?B?OFk1bXBLNTFsbTdud1pWd1ZpVEhHNzlZNkZzK2ZNYjYzVWtOZzJWZ0tyOUo5?=
 =?utf-8?B?czdHSDRHaitEZzZWemYrMUlnbXJ0blZjcFVyRldqNmUxM2RDMVljTHcwZVBK?=
 =?utf-8?B?ODcwTXN2TGRxek5nSkR6R2w3Q3ZsRllicm1YdjhmOTEwSExOQTdBbFVyQjI1?=
 =?utf-8?B?cUdkeUZVdTZMekVZV0VlbjJYWUpVUGd3ODhFTkVYQ1V5SUIvb0JYT0x5T2xr?=
 =?utf-8?B?ZXdzT01TaEdXci9lTG1sZkJ4Yk1WNXcvV0tUUXdjdVZJVWZFVnlQSnN6MDV4?=
 =?utf-8?B?aUwyRHRNVHVYL1cwbjZzeHpHdDBya1gySE5rYmdIbVI0OGVxK3kyTnlCOW44?=
 =?utf-8?B?Z05WV3JzVlg0Y0NHR2o5UzByYTdIaUE0Ty92bFo0d01pY2NqZXdPejRwTmxq?=
 =?utf-8?B?cUN4Q3ZIck1nVnk3Q0lqcUZ3QlNkM25RY0V2dmIzRVFhdk1xZXdxeHhPMkl2?=
 =?utf-8?B?MExlWlBkRkk5VWJNdEp6TVNTNEswSUhtZHFzQUFpOGJSZWVqUHV0K3ZNUmRp?=
 =?utf-8?B?a05Jb0VaSW1PTnlvVnpFWncrbklqVnlpZHBjUVFkT1VqN1ptVnZ1L2VrU21G?=
 =?utf-8?B?QzNyMXVndk5Fd1dWK3Y4WVNtWExPZWtjN3pFWm5sL0QxcVhMd3FZOVZqNjc1?=
 =?utf-8?B?QTRXblZjbVprZ05kMzVUTTl6THNBbFdiOVhzTTBpRitUMzZmZSswN21KZGVv?=
 =?utf-8?B?TElsdkd1czlRU2YrM2tMYUI4d2R4blU2ZWxTdzlJM0RwNHJEK3JQZTVQUkZ1?=
 =?utf-8?B?Ulh2ZnJpWG1NSEpFYUs1NjdOeEN4MHpYUVFpUERQU2UvSitMOTVEdmpPWmVM?=
 =?utf-8?B?azNldGQzUUUzWFlVMWVKTzJOQ0k3L08rUDNKc2VSYVp3MmlNc2dSWEpXTDlK?=
 =?utf-8?B?NE11bm5mclFNOFhnSThsbmFDeXdDMEZSRHMvUlJIMW0zUXlxbUpBM2V1d3Jp?=
 =?utf-8?B?aWVlcWgyWUVDcmN5UlB2NDcxREVtMmNJVklZaFViNmZTdUI2WTB6Y1NrSGpW?=
 =?utf-8?B?UXVLNGdQVFRJd0ZUK1VCR3FtYUUyTkhwb05KcjBoTWNGSjZHeHAzL0U2SVFG?=
 =?utf-8?B?MHdnNFNvcENVdHQ1V0ozS0RQQjQ4amNrblZYR2lwSmF0eDBaZm9lUEJBNGd1?=
 =?utf-8?B?WWYrOE1BT3kxK0puUVgweFh6MEhCT2xXS3ZWS0cwaTJ2Q2IrTlI3MnVrZlJH?=
 =?utf-8?B?WW80cCtwbi9yeHRQazdwb0ViejFicEt6WHM5WUpObXd1RExhb3lub0hPcEdj?=
 =?utf-8?B?UHUwTDBsd2dHWkxOenlIbXo1S3JoN1J4YjUxSkthaGo0VjhUTGM0azVGN2sz?=
 =?utf-8?B?cUtkK3RwNWY0cTE1ZDNpQjlQYXJqTXVCK2kxM0hZYVk3dkxpQjBLUml1M0Nw?=
 =?utf-8?B?VEJTY3d6R29uN050ZXdzcUszZnZrL2VvTWpIRks1WHJ4c21WS05zRGZ4Ti9y?=
 =?utf-8?B?VFI1cEpOY01SQndNQW03TnRQUVMvNCtxRzhlVXNKUGhrQWQ4djVKLzg1MTZz?=
 =?utf-8?B?VWpLVjdIMkJPZlE1Rkhkak40MVBzajV6alBLY3k1OFRSK1Z5Nlk2NkFrVWsx?=
 =?utf-8?B?RjkySlkzbHVMS1RxejBFcFNhUjJIdjkwdnNxR1R4NitaNEtXVzFubjEyU3dv?=
 =?utf-8?Q?7iECFrAM8qxEJSGnvZQ+SY3Ui?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47417550-29fb-4c32-727a-08dce13076a3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 09:15:44.6194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7OAdkbOAjUGvCxw7lmGy6n4mPxB9thjWyr7sUWxecRdCy2k0iH8M5wVp6bXZFa6ocOiYfyY6ePViRoxdxj2JxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8023
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

On 09/30/2024, Biju Das wrote:
> Hi Liu,

Hi Biju,

> 
> thanks for the patch.
> 
>> -----Original Message-----
>> From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org> On Behalf Of Liu Ying
>> Sent: Monday, September 30, 2024 6:29 AM
>> Subject: [PATCH 5/8] dt-bindings: display: bridge: Add ITE IT6263 LVDS to HDMI converter
>>
>> Document ITE IT6263 LVDS to HDMI converter.
>>
>> Product link:
>> https://www.ite.com.tw/en/product/cate1/IT6263
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>>  .../bindings/display/bridge/ite,it6263.yaml   | 310 ++++++++++++++++++
>>  1 file changed, 310 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>> b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>> new file mode 100644
>> index 000000000000..97fb81e5bc4a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>> @@ -0,0 +1,310 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: ITE IT6263 LVDS to HDMI converter
>> +
>> +maintainers:
>> +  - Liu Ying <victor.liu@nxp.com>
>> +
>> +description: |
>> +  The IT6263 is a high-performance single-chip De-SSC(De-Spread
>> +Spectrum) LVDS
>> +  to HDMI converter.  Combined with LVDS receiver and HDMI 1.4a
>> +transmitter,
>> +  the IT6263 supports LVDS input and HDMI 1.4 output by conversion function.
>> +  The built-in LVDS receiver can support single-link and dual-link LVDS
>> +inputs,
>> +  and the built-in HDMI transmitter is fully compliant with HDMI
>> +1.4a/3D, HDCP
>> +  1.2 and backward compatible with DVI 1.0 specification.
>> +
>> +  The IT6263 also encodes and transmits up to 8 channels of I2S digital
>> + audio,  with sampling rate up to 192KHz and sample size up to 24 bits.
>> + In addition,  an S/PDIF input port takes in compressed audio of up to 192KHz frame rate.
>> +
>> +  The newly supported High-Bit Rate(HBR) audio by HDMI specifications
>> + v1.3 is  provided by the IT6263 in two interfaces: the four I2S input
>> + ports or the  S/PDIF input port.  With both interfaces the highest
>> + possible HBR frame rate  is supported at up to 768KHz.
>> +
>> +properties:
>> +  compatible:
>> +    const: ite,it6263
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +    description: audio master clock
>> +
>> +  clock-names:
>> +    const: mclk
>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +
>> +  ivdd-supply:
>> +    description: 1.8V digital logic power
>> +
>> +  ovdd-supply:
>> +    description: 3.3V I/O pin power
>> +
>> +  txavcc18-supply:
>> +    description: 1.8V HDMI analog frontend power
>> +
>> +  txavcc33-supply:
>> +    description: 3.3V HDMI analog frontend power
>> +
>> +  pvcc1-supply:
>> +    description: 1.8V HDMI frontend core PLL power
>> +
>> +  pvcc2-supply:
>> +    description: 1.8V HDMI frontend filter PLL power
>> +
>> +  avcc-supply:
>> +    description: 3.3V LVDS frontend power
>> +
>> +  anvdd-supply:
>> +    description: 1.8V LVDS frontend analog power
>> +
>> +  apvdd-supply:
>> +    description: 1.8V LVDS frontend PLL power
>> +
>> +  "#sound-dai-cells":
>> +    const: 0
>> +
>> +  ite,i2s-audio-fifo-sources:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1
>> +    maxItems: 4
>> +    items:
>> +      enum: [0, 1, 2, 3]
>> +    description:
>> +      Each array element indicates the pin number of an I2S serial data input
>> +      line which is connected to an audio FIFO, from audio FIFO0 to FIFO3.
>> +
>> +  ite,rl-channel-swap-audio-sources:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1
>> +    maxItems: 4
>> +    uniqueItems: true
>> +    items:
>> +      enum: [0, 1, 2, 3]
>> +    description:
>> +      Each array element indicates an audio source whose right channel and left
>> +      channel are swapped by this converter. For I2S, the element is the pin
>> +      number of an I2S serial data input line. For S/PDIF, the element is always
>> +      0.
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    oneOf:
>> +      - properties:
>> +          port@0:
>> +            $ref: /schemas/graph.yaml#/properties/port
>> +            description: the first LVDS input link
>> +
>> +          port@1: false
>> +
>> +          port@2:
>> +            $ref: /schemas/graph.yaml#/properties/port
>> +            description: video port for the HDMI output
>> +
>> +          port@3:
>> +            $ref: /schemas/graph.yaml#/properties/port
>> +            description: sound input port
>> +
>> +        required:
>> +          - port@0
>> +          - port@2
>> +
>> +      - properties:
>> +          port@0:
>> +            $ref: /schemas/graph.yaml#/$defs/port-base
>> +            unevaluatedProperties: false
>> +            description: the first LVDS input link
>> +
>> +            properties:
>> +              dual-lvds-odd-pixels:
>> +                type: boolean
>> +                description: the first sink port for odd pixels
>> +
>> +              dual-lvds-even-pixels:
>> +                type: boolean
>> +                description: the first sink port for even pixels
>> +
>> +            oneOf:
>> +              - required: [dual-lvds-odd-pixels]
>> +              - required: [dual-lvds-even-pixels]
>> +
>> +          port@1:
>> +            $ref: /schemas/graph.yaml#/$defs/port-base
>> +            unevaluatedProperties: false
>> +            description: the second LVDS input link
>> +
>> +            properties:
>> +              dual-lvds-even-pixels:
>> +                type: boolean
>> +                description: the second sink port for even pixels
>> +
>> +              dual-lvds-odd-pixels:
>> +                type: boolean
>> +                description: the second sink port for odd pixels
>> +
>> +            oneOf:
>> +              - required: [dual-lvds-even-pixels]
>> +              - required: [dual-lvds-odd-pixels]
> 
> 
>> +
>> +          port@2:
>> +            $ref: /schemas/graph.yaml#/properties/port
>> +            description: video port for the HDMI output
>> +
>> +          port@3:
>> +            $ref: /schemas/graph.yaml#/properties/port
>> +            description: sound input port
> 
> What about single lvds as device support it?

The single LVDS link has already been documented in this binding doc.  
Please find the "properties" above where only "port@0" and "port@2"
are required.

imx8mp-evk-lvds0-imx-lvds-hdmi.dtso and imx8mp-evk-lvds1-imx-lvds-hdmi.dtso
added in patch 7 support the NXP adapter card with single LVDS link.

> 
> Cheers,
> Biju
> 
>> +
>> +        required:
>> +          - port@0
>> +          - port@1
>> +          - port@2
>> +
>> +        allOf:
>> +          - if:
>> +              properties:
>> +                port@0:
>> +                  required:
>> +                    - dual-lvds-odd-pixels
>> +            then:
>> +              properties:
>> +                port@1:
>> +                  properties:
>> +                    dual-lvds-odd-pixels: false
>> +
>> +          - if:
>> +              properties:
>> +                port@0:
>> +                  required:
>> +                    - dual-lvds-even-pixels
>> +            then:
>> +              properties:
>> +                port@1:
>> +                  properties:
>> +                    dual-lvds-even-pixels: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - ivdd-supply
>> +  - ovdd-supply
>> +  - txavcc18-supply
>> +  - txavcc33-supply
>> +  - pvcc1-supply
>> +  - pvcc2-supply
>> +  - avcc-supply
>> +  - anvdd-supply
>> +  - apvdd-supply
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    /* single-link LVDS input */
>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        hdmi@4c {
>> +            compatible = "ite,it6263";
>> +            reg = <0x4c>;
>> +            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
>> +            ivdd-supply = <&reg_buck5>;
>> +            ovdd-supply = <&reg_vext_3v3>;
>> +            txavcc18-supply = <&reg_buck5>;
>> +            txavcc33-supply = <&reg_vext_3v3>;
>> +            pvcc1-supply = <&reg_buck5>;
>> +            pvcc2-supply = <&reg_buck5>;
>> +            avcc-supply = <&reg_vext_3v3>;
>> +            anvdd-supply = <&reg_buck5>;
>> +            apvdd-supply = <&reg_buck5>;
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@0 {
>> +                    reg = <0>;
>> +
>> +                    it6263_lvds_link1: endpoint {
>> +                        remote-endpoint = <&ldb_lvds_ch0>;
>> +                    };
>> +                };
>> +
>> +                port@2 {
>> +                    reg = <2>;
>> +
>> +                    it6263_out: endpoint {
>> +                        remote-endpoint = <&hdmi_in>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +  - |
>> +    /* dual-link LVDS input */
>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        hdmi@4c {
>> +            compatible = "ite,it6263";
>> +            reg = <0x4c>;
>> +            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
>> +            ivdd-supply = <&reg_buck5>;
>> +            ovdd-supply = <&reg_vext_3v3>;
>> +            txavcc18-supply = <&reg_buck5>;
>> +            txavcc33-supply = <&reg_vext_3v3>;
>> +            pvcc1-supply = <&reg_buck5>;
>> +            pvcc2-supply = <&reg_buck5>;
>> +            avcc-supply = <&reg_vext_3v3>;
>> +            anvdd-supply = <&reg_buck5>;
>> +            apvdd-supply = <&reg_buck5>;
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@0 {
>> +                    reg = <0>;
>> +                    dual-lvds-odd-pixels;
>> +
>> +                    it6263_lvds_link1_dual: endpoint {
>> +                        remote-endpoint = <&ldb_lvds_ch0>;
>> +                    };
>> +                };
>> +
>> +                port@1 {
>> +                    reg = <1>;
>> +                    dual-lvds-even-pixels;
>> +
>> +                    it6263_lvds_link2_dual: endpoint {
>> +                        remote-endpoint = <&ldb_lvds_ch1>;
>> +                    };
>> +                };
>> +
>> +                port@2 {
>> +                    reg = <2>;
>> +
>> +                    it6263_out_dual: endpoint {
>> +                        remote-endpoint = <&hdmi_in>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
>> --
>> 2.34.1
>>
> 

-- 
Regards,
Liu Ying

