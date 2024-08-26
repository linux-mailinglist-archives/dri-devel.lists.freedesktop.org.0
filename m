Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B4795F9BE
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 21:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A0310E0A1;
	Mon, 26 Aug 2024 19:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.b="oVu9LbKv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2076.outbound.protection.outlook.com [40.107.22.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC0B10E0A1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 19:35:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHgD+sQM3mE1jVGxfVRGXDkeNzB5kldkWK65guNsXhCCwxEIaszLCQCugO1y1ZGuLkRpSz5qGSwcGV25pZmRKfkJIQLQ7Owt+GN6YV0tT5ydYh5K3JQdCbuSeSBNAGDNdjEwaQ5XSHFFxXhJ5LGXMPY2i2HbsknI1QrqOh3NgSnYkEnpeAHChAMYT4jxoFJbPZFs5JnU30T+PANIjG1e1IJNiowM6FeTZzf5L54I1OWi0E+VeP0VXAG88M6o/Jo5N9sI2qY4WbEzH8kMpHXgJHgrBB4mj13brrWpsXN4L7RT2LvpmCl3aQRr49nlghLxXB8eiuCw6fkEYg1LQClofA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pzxS1yLAqMj6Iro36t/bbNuo+TNURhsxjOzRHXmIogo=;
 b=sqmrW6JWJt3iO8KcCLj4MmhDD+51Bb3fR7SG4IdlqUInKjshxSc9wSaz1EoCcrLBXmDKsexB3YslgqZctHppJti+gyHuz3+dr2AyaEikOWhr7LCRExOCgTkdK5lHzNx8qaPLWtfX80NHW9tr3JaIkRsXiBUHdhJDxXMd1hjfuFGFYjTcpXaQgrn6429s6tdbA8JzjQaY1Y0p7I+03RoKqE5ZDh4cDz63aq79SJgbvEqZ/8c08qrfNEIF7AXw/VKhBmwBSU/CUv+19Yzodm0WlpDwX8+C10oCQ8CbBDUy4UqrWG3fk0zOvFibkeD/OGrmZHdaY/jUjlV43pJdV69Eyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzxS1yLAqMj6Iro36t/bbNuo+TNURhsxjOzRHXmIogo=;
 b=oVu9LbKvwayVKNf5Nxr6jdzZ3yJKsF6Mz1c9U7xbjzzDH8uEN/cshGWMNd1OaDQ9OQbd5m9G0Q4xDOREub4DirUubAMIxMvnaRjbQFQtjQwbnNp0oSMQStMH6LpxKCEMzwlFzZemldK2zEqNUacFOOqn1I+doURTAQQrcbjlBwCpcXIRK0iz3Xz+JTptBC+KuGFNkkJH1YRbwkp7kNEyWo1W14gCbUKeQek4Pe1Bf2yfulb7XHh/D/VNRZu8rNhRG9amBGZ+3YO3b1grtkRDVFgNAf7rE5EpBxtytDECS+uMAoV06UNE2SRVYHO69C+QBY2UPa3nZ/YPtuPiQNQLfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by DUZPR10MB8127.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4b0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 19:35:57 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8fe1:7e71:cf4a:7408]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8fe1:7e71:cf4a:7408%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 19:35:56 +0000
Message-ID: <4133a684-61a1-4d18-bb25-212d5fdc5620@siemens.com>
Date: Mon, 26 Aug 2024 21:35:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] drm/bridge: tc358767: Fix
 DRM_BRIDGE_ATTACH_NO_CONNECTOR case
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Aradhya Bhatia <a-bhatia1@ti.com>, dri-devel@lists.freedesktop.org,
 Marek Vasut <marex@denx.de>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
References: <f6af46e0-aadb-450a-9349-eec1337ea870@ti.com>
 <b221c978-2ce0-4d31-8146-ab43a9f86a1f@ti.com>
 <st6vgd2k6dxo4vd3pmqmqlc5haofhbym2jeb2eeh2pa2n6zcca@tradpzxrzexl>
 <2469374.jE0xQCEvom@steina-w>
 <CAA8EJpraKjBZRLL5U+BVQRf98_EBa5b=nSPxZATU+yvvq9Kfmw@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Content-Language: en-US
Autocrypt: addr=jan.kiszka@siemens.com; keydata=
 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
In-Reply-To: <CAA8EJpraKjBZRLL5U+BVQRf98_EBa5b=nSPxZATU+yvvq9Kfmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::7) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|DUZPR10MB8127:EE_
X-MS-Office365-Filtering-Correlation-Id: abebbe59-2b91-4805-65fd-08dcc6064e34
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MW5kSm1wRWdHSzdKWDUrTWQwQlhVTUk4NTYyNmQreFk0M2FmMVJjY0wrYnMz?=
 =?utf-8?B?anJFdjZoOHVVcVpSdXF3bE0yY2QvRmF0VERyczZXdzA0NHg3dUdZY1B1YnMv?=
 =?utf-8?B?TThJRlNBR044TjI2dXZ1WlZFS0FVZTdSWGtrc2orbWlYcWZnTE1PblA0Ylhm?=
 =?utf-8?B?bHpwNk9hdC8vSjl1R0pUQVpwQ1A4azE0UERUTStMZHZXUmNYRlRUdU9TTXRa?=
 =?utf-8?B?RXRsU3YyYjkxd2JBSXMxbUk0YjdBTGlySzJmV3MrQ0lIZzdDWFFKU1A2OElG?=
 =?utf-8?B?b1JiY2JUWktTMGEwclBLalJzejJoQkNiV0RaaVo3YWY2bTlPSG14SmN4b3hi?=
 =?utf-8?B?bGxMMDVCbTRHbm1WZ04yUlVmOGJoeUdFQ0pvZ3NEWXhNYmpqV1JmVFhZVnhE?=
 =?utf-8?B?N1lwSXprNnhCQzg1b0t2YWR6VHVseGlwYW5KSWJmUkc2dlZNUHZkZHhqc0Uy?=
 =?utf-8?B?a0pOblBTYmdjd29SdmJVNytidVB3b3AwcXVuMlVHTXJ1Wkp2V2RvNkcybExT?=
 =?utf-8?B?NjI4alpKWmZyWnA1WW5pN1phb08wN0VHY2lLRVBpNjhTTHYxbi9QckRwZDNa?=
 =?utf-8?B?ZGl0RzJ3cXdSRUc2a3hhOHE5QXNGT211OHpmODB4T0FEeFhRSXQ5aDhyVDJ4?=
 =?utf-8?B?eXhiYWJ2dzI0NG5jQ0krSERpNzdRVXAzTTVVSVhqZitxNUtDbGRmQ2F2di9W?=
 =?utf-8?B?TFpKS3hHYjFEaXAwdDkzSHhGTG5HN21taXJBalNZU3Z3eU9MNnVWZ2toMU5q?=
 =?utf-8?B?YjVqQXUvd2ZaMnJMZ0srZ1lsWEFObTlSY2l6RkswQ2dlNEZQZ21TTXp1UXk3?=
 =?utf-8?B?MXNZRmJqOFhvU1h3U1ZCYnRoM3Qya3pqaHVqNnlDbVQ4R3NMV1FZS0tFTFEy?=
 =?utf-8?B?S2F6cHZzR3lPMTd1bHZEK01MUFNIaXFJSThVR2pMaWZJeWtxNEcrdzc0YWZn?=
 =?utf-8?B?dEpBL1ptVXI3N1V2eDNjWGdURjFZNGlDWFNheXpoTVJWMGxvRXMwUnYzSXZm?=
 =?utf-8?B?ZnBWZWVNVlo1MnZ0R0VSNjdKY1ovUzdiL0tBOVNSaWd2MnpTVFVmNVpaTUxF?=
 =?utf-8?B?cXllUDdDL0dDSnVLUkpKQXdrYzNyTzZmbXZhUHpBRzhNTnlUN2pvTFlqTHhH?=
 =?utf-8?B?VFNoRUlGK0dYejIzYmZzMG43N3JpTDk5U2N3VEIxU0lCWnFxVktWSStUQnVu?=
 =?utf-8?B?Nm42MEw1a0twNW1tR2J2anNSN2c1YW4yMVVSOXJ0QVRDWVZuWHJnaGZMMEhU?=
 =?utf-8?B?K0lYSXRaNG9VdnlZK0JnWjJvVDNTWFdBZlhYc0lNOFdOMzNDcTY0ZkdSaDVY?=
 =?utf-8?B?TnhWMnE0ZWVwYmE0aWtaZnNLekdMdmd0T2t0M1RMYkVjK2pvU0pwVDd4YWta?=
 =?utf-8?B?cmtYMUFZTk8rSnQwWVZxNEwzU210am0yYmJKRUt5LzU0SmhrcE5ibVhxcGxG?=
 =?utf-8?B?aXczNVROV2laYzc2V1ZLOXczWUhPUWdXcDZFU2txNkF6S1FyVzFtWlJwNUow?=
 =?utf-8?B?T05pencvUjNEejFvcFgzOHA4SlkvZFFXN1k4WnMzTFJhSE9sOUJrVDFGeXI3?=
 =?utf-8?B?K25Ma0tCeWV3L2t5MGFuN1FjZ0RHQi9RbC9iZ3M5ZzRMeC9MeUN0N2l5QjdE?=
 =?utf-8?B?MFVIOGdudUY2dWx5OVlmUjhoVTU0amM5RVE4OW5VdlB6VkFsbnNIK0dxOG5v?=
 =?utf-8?B?V3JNa2QvZE1hL3FGRytDRm5aVE1CNGF2NGNPbkRqN0hnNGpjSFFnM3Boc053?=
 =?utf-8?Q?8Gm38tAQPB+FAJ2Uz4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFV2ZVM1bVhqUzIzR25aMEdmTlFVN0xlM2NsVVpzL2QrNy95cmRKaTd4Kzh2?=
 =?utf-8?B?alB3eXN3ME1JOEZUa1VWWTJESGowcGgyMkJwT1VYdGdHUUlpVUlUem4vQkdJ?=
 =?utf-8?B?U3gxQ3VlTmg3ZXJ3VG0rMDMvOWNDNnZRcXRwY3hHTzRnaGJLYlNXeEdjZmJL?=
 =?utf-8?B?ZnF3V3BnT1ZyL3pjejJKTGlHRkhoYTQzRlh3ZTMxRHVZaHRvWWNod1BUSzhG?=
 =?utf-8?B?aUdmRWQvTmIxQTJxOUd0V1grakhTOUVPbmNtWG5oZ0d1VThHMGtmMUZrZCt1?=
 =?utf-8?B?YXZHaGp4NjZEUGxMbkR4RVZmS1o4MDdldnRrMm5NeFZTY3B0SnpWMDRpWHlH?=
 =?utf-8?B?VGZYZ0Y1S2lnS05GVEorUy9lVlliSXJ0blA2ZXNYNG5aU0RMUGFpbERlMUVl?=
 =?utf-8?B?NThIMDFRNDYwbEJZdG1hTkxiaFdvU2FRMmRhS3J6aGhPNm1Wb3lCcDgxK3M2?=
 =?utf-8?B?Q3NFQW80bk9oZ05Fck9iRjNORWtFWXRQNmhndkdsRVg2aG1XUTdZeHRRemlm?=
 =?utf-8?B?N0IrWlRRU3BoNFQzOGloR0FBQlMwaXYzWWhpUVdDTzhRaUFaazUzYU84WExZ?=
 =?utf-8?B?dVloRmk2STZpVWkwVzhCeVpoRk5ZV0h2N1J4RFM1UHdrQW05SW9aTVhqUnZt?=
 =?utf-8?B?ZG10REcrTzl1eXVrNlgyazFja1NmalBXbkk5U2FWSUNpQ3ZnOHVhblByU3d3?=
 =?utf-8?B?RTlqVGJCNS9PKzhFRlA3TGdBWWJsWVdUTXc1cUs0a3ZCVmQ2NVBrS3hWNmt1?=
 =?utf-8?B?blAzTkpiOW1HQ21vTU5TMC90L0JZci9ycDRxbkFmRzBXMmRmNnEvWUVxSkZW?=
 =?utf-8?B?RWFUY21mMnJhbkJ1MWdLMUZLN3VMMWRwZnVWK09OdDFzZGE4R1dPTnZxWk9p?=
 =?utf-8?B?NDBNcm9nZHFEMXQybHNZNUMwcXV6Rk1keXY5V29ibDZRcWdpM3F1TjZlWDlG?=
 =?utf-8?B?b3VxaGJGV3RyU0JxaGxxT1NoVElYaWZjUHZpYjQ2eUkwOXQxeUVKais2QlEz?=
 =?utf-8?B?d0JyYTc5Qy9JMmxWdjQyZnhOcXNBMjh0RytFMmc1WmVhQ3ZlbE55YTJod2JI?=
 =?utf-8?B?VmwrbW1lOHdzL1lCYmthVEdXK1JNUTFXWHlxdS91ZU15UmlTVm1Qcnpqd0Ex?=
 =?utf-8?B?dlFqWlcxMFpuV0l1aEVZRFd6K2ZEdlBTSTJzREIyYVRxUmxWcjh6dHdSaWd4?=
 =?utf-8?B?dkNOVDZVdTAvaXorNGY2L0tFajFPeGVRUEg1RTJ1dE5SWXBQaGxTQndNTVha?=
 =?utf-8?B?c1RyV0hIS1hiYm5uaUtYaWVPemcwTTVHWDFqcmMvbWdiTXRlS1ZzeUZwSWxB?=
 =?utf-8?B?d0Y4REtsT0Y0RGs2aVMyNFZBL29QbEROTmZTbXZ5YmRkeUh4amo1bFlMSGRM?=
 =?utf-8?B?SnlCSDVMaGtUK01tM3MvUmVBUXZZaGF4ZXE3Z0JFV1RjMjR5eURVMGRDb21k?=
 =?utf-8?B?WnlpQkVWczYrR3lMaVFuN0hjazZ3RG1qU1RiUkxlZk1lbGVNZlI2Unc3WFdj?=
 =?utf-8?B?QURBOEtHbFNBUkVxK1kxWE8wZ3NEYktSZld2T1dpOEFPZ1BkUkdiMGF4SGNR?=
 =?utf-8?B?VU9RdlVvSjVkbStub2ZGdmpEZ3NRUEVjU0hDOVE2TUdtcHVva0RxMjZ2Y2Ri?=
 =?utf-8?B?QlRCOEpBL0tDU2JzLzhMR3h0NEl3cDBrWkFIL1BjOER2Y3U0U3I5czMwZ1hn?=
 =?utf-8?B?ZDg1WERiVDJrMEVJTWkycGtyMXA2RjhMWkFhcHV3dXBlVjV4L3VydTd4OHVN?=
 =?utf-8?B?VEJhVndBR1BrTnBKR3I1blhvM2tHRzY5cnhFaFNqOVp5ckkzVldld2FDSkFo?=
 =?utf-8?B?T1Vnc3VXa2M3WWt1b3hZSnR4OUtpNStkUlc4RUliL0NJLzF1eTlDVHJxeGlj?=
 =?utf-8?B?MmhGbzJmc2pyWDZUVytsVzlmN3ArTFhOS01ZN3kvU3dzL2ZHdjdtZjFaV2N0?=
 =?utf-8?B?NllwN1oyNzR1UDFyMXYvZ2RKU3dKTGswNm0zajlaa3pOWDhtb1JldHFDK1Vs?=
 =?utf-8?B?YWNXUEk3cVJidjZRRFE4NmZGSk84cm5pRUIwdzlpU0hMZEJRZXl4QjVoTEl0?=
 =?utf-8?B?L1V0bk13YTlBeWtWUEpzTndSVTh6OENXdkI4TUljQkRrRytFTHlKM2M1L2Fy?=
 =?utf-8?B?TVZETVlYUW1Fa1h2SHZsc1BBNGJqWnFqclY0QzJDZXVaMlRIemdqR3VTM3A3?=
 =?utf-8?B?b2c9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abebbe59-2b91-4805-65fd-08dcc6064e34
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 19:35:56.5382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gV1Wt63Ef9xz6O+mie6fQwcbD+5kLjnUssaQACJEVWzSJPYho7fQllPcleOPb0G+ZkVS9DbjscoDbEjDXC5qdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR10MB8127
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

On 24.06.24 12:17, Dmitry Baryshkov wrote:
> On Mon, 24 Jun 2024 at 13:07, Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
>>
>> Hi,
>>
>> Am Montag, 24. Juni 2024, 11:49:04 CEST schrieb Dmitry Baryshkov:
>>> On Mon, Jun 24, 2024 at 03:07:10PM GMT, Aradhya Bhatia wrote:
>>>>
>>>>
>>>> On 22/06/24 17:49, Dmitry Baryshkov wrote:
>>>>> On Sat, Jun 22, 2024 at 05:16:58PM GMT, Aradhya Bhatia wrote:
>>>>>>
>>>>>>
>>>>>> On 17-Jun-24 13:41, Dmitry Baryshkov wrote:
>>>>>>> On Mon, Jun 17, 2024 at 07:40:32AM GMT, Jan Kiszka wrote:
>>>>>>>> On 16.02.24 15:57, Marek Vasut wrote:
>>>>>>>>> On 2/16/24 10:10, Tomi Valkeinen wrote:
>>>>>>>>>> Ok. Does anyone have a worry that these patches make the situation
>>>>>>>>>> worse for the DSI case than it was before? Afaics, if the DSI lanes
>>>>>>>>>> are not set up early enough by the DSI host, the driver would break
>>>>>>>>>> with and without these patches.
>>>>>>>>>>
>>>>>>>>>> These do fix the driver for DRM_BRIDGE_ATTACH_NO_CONNECTOR and DPI, so
>>>>>>>>>> I'd like to merge these unless these cause a regression with the DSI
>>>>>>>>>> case.
>>>>>>>>>
>>>>>>>>> 1/2 looks good to me, go ahead and apply .
>>>>>>
>>>>>> Isn't there any way for the second patch to move forward as well though?
>>>>>> The bridge device (under DPI to (e)DP mode) cannot really work without
>>>>>> it, and the patches have been pending idle for a long time. =)
>>>>>>
>>>>>>>>
>>>>>>>> My local patches still apply on top of 6.10-rc4, so I don't think this
>>>>>>>> ever happened. What's still holding up this long-pending fix (at least
>>>>>>>> for our devices)?
>>>>>>>
>>>>>>> Neither of the patches contains Fixes tags. If the first patch fixes an
>>>>>>> issue in previous kernels, please consider following the stable process.
>>>>>>>
>>>>>>> If we are unsure about the second patch, please send the first patch
>>>>>>> separately, adding proper tags.
>>>>>>>
>>>>>>
>>>>>> Thanks Dmitry! I can send the patches again with the required fixes
>>>>>> tags (or just patch-1 if we cannot do anything about patch-2).
>>>>>
>>>>> The problem with the second patch is that it get mixed reviews. I can
>>>>> ack the first patch, but for the second one I'd need a confirmation from
>>>>> somebody else. I'll go on and apply the first patch later today.
>>>>>
>>>>
>>>> Thanks Dmitry!
>>>>
>>>> However, would it be okay if I instead add another patch that makes 2
>>>> versions of the "tc_edp_bridge_funcs", say "tc_dpi_edp_bridge_funcs" and
>>>> "tc_dsi_edp_bridge_funcs", that have all the same function hooks except
>>>> for the .edid_read()?
>>>>
>>>> The dsi edid_read() will remain the same, and Tomi's patch - patch 2/2 -
>>>> will only fix the dpi version of the edid_read()?
>>>>
>>>> The bridge already has the capability to distinguish a DSI input from a
>>>> DPI input. This can be leveraged to decide which set of functions need
>>>> to be used without any major changes.
>>>
>>> I'd prefer if somebody with the DSI setup can ack / test the second
>>> patch.
>>>
>>>
>>
>> Now that my DSI-DP setup works apparently without issue I could test patch 2.
>> Since my setup does not use DRM_BRIDGE_ATTACH_NO_CONNECTOR (running on
>> drivers/gpu/drm/mxsfb/lcdif_drv.c), I can only say
>> there is no regression.
> 
> Let me send a (non-tested) patch, switching to drm_bridge_connector,
> then you can probably test both of them
> 

I suppose [1] was that follow-up, just not leading to success, right?

Now, what's next? I'd love to see the regression we have for the IOT2050 
devices finally fixed, even if it now only requires a short downstream
patch.

Jan

[1] https://lore.kernel.org/dri-devel/20240624-mxc-lcdif-bridge-attach-v1-1-37e8c5d5d934@linaro.org/

-- 
Siemens AG, Technology
Linux Expert Center

