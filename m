Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uK8rFxdmc2mivQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 13:14:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB0D759CA
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 13:14:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9039710EAEF;
	Fri, 23 Jan 2026 12:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="abKqPLJE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011035.outbound.protection.outlook.com
 [40.93.194.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4879310EAE3;
 Fri, 23 Jan 2026 12:14:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncFRjJ7kCQ3hb+Ka1EUS15lYvaNZs7IscwQ07gzXBFpThLSSDYjc1nAqbaE9w9IX8YUc4MAWj+4Nu2WPapwHoAi2hiHuqaPPKt8uk7tw/fq1XPzhmqiEuVoTC2WCbvGOnkoBRHjVE6K6QnHmZsXt0/LL57nh064YTf8TLz8zh4W6zcR0p8HKvg0QwKDeEUdKGCxEbd92LOsYZqMUQq9Lmzs6oKVolG0w/SrQXf2n3fezXKUg16opizzzJPuqq9GW9l3PZUPGQN6HrE7/nSGEf+LoWS2eFJelHcl0OV5xHT0Hy6oo5TbnSQwfdXPuDpraunL73UVi9otCE/TyXjxX3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJVRE/Lg6+H/iFUgGm3W88U8n6pTgNs2h6GprJcfWoQ=;
 b=E/Kkf1H1dBtiZ19R41alj+LFASvx2h4x1U0dXn1XvHioEnzfIkhbVi5cxLK9F4BI6K/0+YwPpGkpVjnfmlffxQ1l+Lc3UcVbWqEK+qCm2sasdNs2CiJB+tElN4ssteQeBH5aoJGZ35S+uRD9eOZyUASPn7p4bqG0QFSwnAtt0HHEzex9x1fKZnRa/pfXD1e+nGGi9yp7wccuu8xhtBI55fSH8sU0U2Jlof4xs+U48/TH+vGLOr3WbhwqvBTCMKNPVcuLpGX/mlfU3JrBELh9BIyjvniTylUvSclDHyho6HnlWGju5VzB5zkArpH4V4uT56B4ak319SrMM9u3FHHs7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJVRE/Lg6+H/iFUgGm3W88U8n6pTgNs2h6GprJcfWoQ=;
 b=abKqPLJEPPM8wCrOdcXZXjSf7er51bnAd6GtCZYEgQU6E3OukY2svhS+mZ6WULfKgl+qOa523XuJOzFt95lriPxvktT0TfCPCs+xLjYucYJgY/JOr4mdRNe6pw49HJWbT35ngx0ArrJLpomSZ+F/j2GIzAhgkSsYjwLL4ANOSmZhEvZuTmhoDZX6/FY1bOPfGQypFkjl9NsdNwwhuT1JmjVlckmkCO88bx7G2FR7jgFx8KdAj7ItDyGt/QX2VjZHqRwRdLvDj7/Xl2a2IxuCdFswg4yYFJZR1zlxEL8r14jav1WinqlTv0er2L7OkFcsVNl73M9a+KYhW7Jmw0U5nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SA1PR12MB8162.namprd12.prod.outlook.com (2603:10b6:806:33a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 12:14:04 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 12:14:04 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 23 Jan 2026 21:12:39 +0900
Subject: [PATCH v2 2/4] gpu: nova-core: gsp: clarify comments about
 invariants and pointer roles
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-nova-core-cmdq1-v2-2-e797ec1b714c@nvidia.com>
References: <20260123-nova-core-cmdq1-v2-0-e797ec1b714c@nvidia.com>
In-Reply-To: <20260123-nova-core-cmdq1-v2-0-e797ec1b714c@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alistair Popple <apopple@nvidia.com>
Cc: nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0036.jpnprd01.prod.outlook.com
 (2603:1096:405:1::24) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SA1PR12MB8162:EE_
X-MS-Office365-Filtering-Correlation-Id: 890606ea-1ccd-4944-b6e3-08de5a78e6b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djl3S2xFT1BrOEU4WWt4ajNLRWhHWlJqM0JVbWs5UEI3NUplSzJOdTFyRlFt?=
 =?utf-8?B?NWtPZjBGTlJGRkhMU1ZHaDBUS0RZVTMrcXJUNGFPQjZ6NUQ0MTRuU0VqcWd3?=
 =?utf-8?B?cXVoRkxrZzI1dTZGK21ucnM1NGdUcmZuTzRkeVVOSS96K3d0SkRlUzF3RnVk?=
 =?utf-8?B?MzQ2WUNQR3FRb0REVUFJYlJHRXZtWFVNR1NKVWdnZE5aQS9RS0RnUmdIV1Ni?=
 =?utf-8?B?K1BxeU1ObnhWeFhTRmxkSVRXRS9YZUNCd2RBNitHK3B0NWNUTnplUUdoY08v?=
 =?utf-8?B?Z2dDdHY1QXVSd2U4U2w0TWVNdnhtTzZ4U0RjajBUUG9Wc1A2aUpkVHAwTTg5?=
 =?utf-8?B?VGN1cnJPVEhyL3BhTUJ4SkxpVlg3UHNIelg4c2p6NG5pdXF0SU1wV0dVU0lz?=
 =?utf-8?B?NmRTaDZhMzRmZ1hqRVhabDJWU0tlQTZSYVJlMm13Zm8zU0txcUhHYUJuZjcy?=
 =?utf-8?B?SU15TjRhV3lFVjNGeW8yVWo0YlltTWd0ZGllTFVTWVBpRnN1T1Q1VFErKzhE?=
 =?utf-8?B?eUxFV2xNdTg3S2x3bVV3WjRyTlMyRVo2aVptbWNLNVlrQWJhVHpJeHVaY2hC?=
 =?utf-8?B?YnFjV2ExY3prcDRwYjZDU1MrdkI4SHFWUWJYSlNzNmRUbHNnSlF0aGx0cU1X?=
 =?utf-8?B?VG5UTGdCSnhESG8wb2J2ai9UeTI5dWN2bmE3UENnRm93VmVwSXZaN0FjdFFt?=
 =?utf-8?B?ajRFSkpQVWw0SHB6MWRsK1JVTGpqSUhzZzI0T0ZvM2h6d2N6WFZ5WWRXOW10?=
 =?utf-8?B?UkFWajR2NVRHeGNaWnpMbmhXK0VIalRDZmxnMkU2QkM4S3pzdStIdVp2L1Zo?=
 =?utf-8?B?NGoxZHBHSkh4OGxQd2VWTVpTdXhyN2JSeTFmRlA4RmMvNUkrSmRqQi9BNjVU?=
 =?utf-8?B?Y1F2K2tCZEhzcmwzc01UVnBTaGVEVk5OVmZ3YzRoZWlzeEhhYlpYQkdBZ1FD?=
 =?utf-8?B?WFZ1U0Q2TXFiSHRoQXFwdEV1c0xPUWZNalgyRXBjWTBtcUFMZ2xtS0FqWUlh?=
 =?utf-8?B?VGtNaUdrWXgyd2h3RVQ4MEFjdFlsemtjbGcvN0ZwVUc3UkFwNTVROXBuMTBm?=
 =?utf-8?B?dHVHaVR0UHlzRnJ6TDFpR3RvdHpCOTJTSzd2TUIvV3lFYUN6ZEx5akVPZnln?=
 =?utf-8?B?cXlTUnV1cWxYcEJCTjZkVlF2Q1cxYVZKakRRMlRhc2dMZTRFQ2g5Q3NvbDds?=
 =?utf-8?B?WEtDLzZ6SDJ2NjhqU1Bpb1RtRlFlN0lLcitvQ0dIOW0ycVVkL1VGTDVsUlk2?=
 =?utf-8?B?YndHK3Vmbkgvd3RVQzlzOHB6NzViNk9ZZEgxUFlINkJMWkJUeDJBaEhJVk9z?=
 =?utf-8?B?UWZTeC9EQjM5VGd6L3ExUUhkUTNxUUw1R0FrTkpwTERYL0JRb2dTK1ZDd1BC?=
 =?utf-8?B?R05ZcTcrbXh2MHBJRmRmMzNvNVZZdUVYZnIycSt1dWVxVzZyWEhqdzNoU0xD?=
 =?utf-8?B?dktRY1NHSEhMdG5vRGNiNUdLTFJYVy9INW44KzZOVnZMMVlOK2NPMy8xaTBZ?=
 =?utf-8?B?dHVvVEV3Z0hrV1RnajlPRk5rbXhLQkNsS3RsdUVqNTlhK1pJL1BxdUNiWlNZ?=
 =?utf-8?B?VHpqWDYvbVBFeDN6RWVZbkZQOVk1aTJYY0JjTVY4Vk9obmRic2tRVWVGU0E1?=
 =?utf-8?B?YnVwa1ZqZ252UVA3UEVBYWRBQnk1SzF4K3Ztd1VoVlpCOWpwR3Y5aGNqdGVD?=
 =?utf-8?B?L29WZmVqLzZkR2pYNHRLdUkxNkV4eXRmMExBaVVBSEhJbVVjU0lSRWpyV2xl?=
 =?utf-8?B?am1sbFU3RlhVRG9tdWRjbE9WR3NQWUQrMUVSOUUxa2RkYThCM2VsQitpUWVy?=
 =?utf-8?B?WmpCS2d1R3RwUjBlWURCaUFGRktBNDc0Nk4wR2Eyb1FqNmtHWHF4S2dvSjRL?=
 =?utf-8?B?WVkrL3lCSWJ3TFFqQkdtRlE1UWNMVDNRMDhlTkp2K3Z2VFFiR0txM0wxYTVN?=
 =?utf-8?B?TndPVVI5OExYS0swQWN0N3NKaSs3QjZ0b1AzWkF3NG5aS0xYbmU1OFRtQ0FX?=
 =?utf-8?B?SUhLSWRLYkFObENuQ3RDbmZkR3c4aFF4Qjh3UElSZFJGd0xnd25MRlNUQmlh?=
 =?utf-8?B?MUdpdWpqOTArUGJ2QjdUU2NhWUNnVUlZVFgwb2VDVXg2YWl4YTVoTGp4N0Rv?=
 =?utf-8?Q?b3h8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzBsaFllNmVjcFJXMFRPZityTjhZaktjbEhrbnYxUGFwa042Wkcxd2xPd1hL?=
 =?utf-8?B?RGZQcXhwWUh5NVdORUlqemtzQU1sWnl5M1FxRzMrc3Q5VWVTYmRWRWpGVjEr?=
 =?utf-8?B?SDZkZmtRa09CUTZRZDFRU3Y2QVc4aFk4U3hDMExGM3dyYlVtNnJMY3ByMHly?=
 =?utf-8?B?emdUN3RINjB5LzdNbWZKZWVIVUpqekZYQy8wemxyY3BhVEFTS2lraGpuN2s2?=
 =?utf-8?B?cURSNWJReG1pajNmcTROdFc4K3pKZnp6YllUcUllZFVXemRLS2dzaEMvTWFZ?=
 =?utf-8?B?cFlBU3l2aUI3bytodkxBaktqeXlqMkpvbEdSbzZBZk5IZzZaalc4TDNIbWwv?=
 =?utf-8?B?ZlVsR1l2V0hTcHZpMk9VL0Zvc0J2eEMwT0owUzJZNm4xS2xPOGREZ1kxd05h?=
 =?utf-8?B?dmZKcmZBQVBRN0Qyakx0Z1JmUExqczJraVoxUTkyRTB5T1hYTmJXQzYyZUdW?=
 =?utf-8?B?VEswRk81alo5aEhTWnBMUzI4QW5TK2lBUkJ2WGJNSUdtOUJhZHZ2cmxpZXpO?=
 =?utf-8?B?cmdURjZPTi9sNTYvbWpkQkxqcmxSa3RxdG1DRElnYkkzKzREd1lrWVJ4Z2ZW?=
 =?utf-8?B?cWNVeUloOTV6b1NFdHJvbGhtTVI4Y1k1akZ3dnV0NUR4K0RDcXJ2UFpoOTFC?=
 =?utf-8?B?YjdYVEtvVGFXeDErS0RQcXBwbUxtNkpLNlRrbmhheTMya3RPYlVncEZDQ1ho?=
 =?utf-8?B?bVdYelNRdGgvcWZHaXhDWEtkU0VuNmV4Ynkxc3k4Yjc0VnVwTm9BSkorODJC?=
 =?utf-8?B?OXVIS3Z3cXRpcHhIL3U3Z051S0N2MDRIN1p5OE1nK1hxMmhibXE1UWFjZ0k1?=
 =?utf-8?B?Zm9hd0YzTURBTldna0xPTzBsWXJwbFVta1ZUdUdYTGZ3cG9jZTFLQjBuQllM?=
 =?utf-8?B?UnRWYjlkR1hLQWkyTTVTNmx3cjlncU1NRHJRc0g2akRZOXFOSjhpazdGdUFw?=
 =?utf-8?B?dFNndjNKU2l3OTRIZGY1dkRqcEZsT1VmcGs3V203NkV6WEs1UVdzUDRNdGtt?=
 =?utf-8?B?bFZHZGIwWEdUakZnUFJjNHE3dXhCMWxiNzl6TW1ZZkVDek1XM2dQL3ZPSm53?=
 =?utf-8?B?VEZnZy93WnZTVllMQXc0WnRlM2hNeHdyejdlTDhKUExuUUZGOUpWNnZPY3hY?=
 =?utf-8?B?bk1yeHcrSGNONHJSb3I0L2gzZHFTRkIvcEtUUi9UT3h0T3lDbUJUQWNUUDdt?=
 =?utf-8?B?M0x4SkFBYXdaTUtycVNjbmNSMWxaU0RFdzQ0a254cW43ZWVRVmhjTlowNys0?=
 =?utf-8?B?elRpRFVINDRYRUVQMWk1ZGt4dzhLdWhwb2k4NE9SVXdSdGJwTmppV2FvZTM4?=
 =?utf-8?B?d0EyMHNLT3cyTDZCUVp2dUhXdHJlK2laYU1zL3dhTzJpS0hyR0ViUDJDZUkw?=
 =?utf-8?B?SXhQUFIxbDZpTzRBVVZOVkRiSFpmUWRIbzRCbDl3M0l1UEJRTG5RWmhxeFgx?=
 =?utf-8?B?QUZUejgvMlRuQVhEd2ZUaCtab0VvVTlIL1R0WHdQWDBna3F4QkQ4Z1BzeFN3?=
 =?utf-8?B?bkZkc0R1WjR4VnI1S2FndEhDQnlTRytsWlREMENodUZCOFpveC9UZzZwVnFz?=
 =?utf-8?B?YmpZSHcwdE1uTzY0Z3hxSUtGUE9jQ0FOWngrakdCalRGVTdPVFdZenpXRVN6?=
 =?utf-8?B?RUhNYVRxS2hvbGpZOGVIWmpGdjBlWmlGNkhzZGdOYUlySGQ1clpITHJvWklq?=
 =?utf-8?B?RUlhcDZ5dzJ0S2dtUlRLTGhZOW56TWdDR2pSOWZ5dHFNOERCZ1NqVVk5cEtP?=
 =?utf-8?B?di92UGZ5anpGSTE4NExUSTh3ZVNRMGlpNXpaWXBkcHB3a0JCRzBYZXExbVUw?=
 =?utf-8?B?dXp5OHM3QnRhMEM3cmRKb1ZyNjhPK2pVaHduMzliMTQwQTlWQUs4WjF0K3g5?=
 =?utf-8?B?bURER3FzWjZVWjZRL2tVZVg0cHdMRTg0UDVFTTIzc002dzF0YkJHQVBxaFVx?=
 =?utf-8?B?dlJDbEdVdjFqeUxxaFBiMUl1THZUWllnZ2FvbVJiMW1HZksvUVhtZGVudEdN?=
 =?utf-8?B?eFBYdnBjQ090VHhSNTZDbUUyVlBWc2NSUmZlVWVQallmYnNuL3pQUGJWbFFn?=
 =?utf-8?B?VmtCOHVtM1VZSldGMGUwYmtGOWJIL2RRRWdyTUYvR2tYQUV2VVVrKzA2Z3Bi?=
 =?utf-8?B?RG1EQUN6d3c5bGhiMUoyM2UwMzMrS2hZRXRHeUFTSzdZYURqNWx6ZVZhWEQw?=
 =?utf-8?B?WXcwR3BlKzdCZDlBK3ZkUFdZT0RtRUFVNkhUMWdSby9qNllrRVZNZXlRSXEy?=
 =?utf-8?B?eHMrV01RSU1LWWVqRnhqOG1DMG1rMGJRcm9wdnhGMEFRSG5YZ1NjWDFsTmY5?=
 =?utf-8?B?aW9TWVhiZDFsbTFZMjZBbnVzQUppQTJwNkVCdDFSRTdLMlpNdVNmM3pBWE0z?=
 =?utf-8?Q?ndPhv8UWk3Vr9goeD81AaRrWUwvEffFSiM8YY4ZcuXmhK?=
X-MS-Exchange-AntiSpam-MessageData-1: 2NgO0v4Nhws5jg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 890606ea-1ccd-4944-b6e3-08de5a78e6b6
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 12:14:04.7248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JWuUM8riKMUno1aq6mhQkBoVk4MTDM5bwMvFCU8gBSJtM+Gxs5QjqgpaZiUiaGJN5sBEImOp2Z5iOwOrtAbV3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8162
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 0BB0D759CA
X-Rspamd-Action: no action

Disambiguate a few things in comments in cmdq.rs.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index f139aad7af3f..09c28eeb6f12 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -161,12 +161,14 @@ struct GspMem {
     /// Self-mapping page table entries.
     ptes: PteArray<{ GSP_PAGE_SIZE / size_of::<u64>() }>,
     /// CPU queue: the driver writes commands here, and the GSP reads them. It also contains the
-    /// write and read pointers that the CPU updates.
+    /// write and read pointers that the CPU updates. This means that the read pointer here is an
+    /// index into the GSP queue.
     ///
     /// This member is read-only for the GSP.
     cpuq: Msgq,
     /// GSP queue: the GSP writes messages here, and the driver reads them. It also contains the
-    /// write and read pointers that the GSP updates.
+    /// write and read pointers that the GSP updates. This means that the read pointer here is an
+    /// index into the CPU queue.
     ///
     /// This member is read-only for the driver.
     gspq: Msgq,
@@ -222,7 +224,7 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         // - We will only access the driver-owned part of the shared memory.
         // - Per the safety statement of the function, no concurrent access will be performed.
         let gsp_mem = &mut unsafe { self.0.as_slice_mut(0, 1) }.unwrap()[0];
-        // PANIC: per the invariant of `cpu_write_ptr`, `tx` is `<= MSGQ_NUM_PAGES`.
+        // PANIC: per the invariant of `cpu_write_ptr`, `tx` is `< MSGQ_NUM_PAGES`.
         let (before_tx, after_tx) = gsp_mem.cpuq.msgq.data.split_at_mut(tx);
 
         if rx <= tx {
@@ -257,7 +259,7 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         // - We will only access the driver-owned part of the shared memory.
         // - Per the safety statement of the function, no concurrent access will be performed.
         let gsp_mem = &unsafe { self.0.as_slice(0, 1) }.unwrap()[0];
-        // PANIC: per the invariant of `cpu_read_ptr`, `xx` is `<= MSGQ_NUM_PAGES`.
+        // PANIC: per the invariant of `cpu_read_ptr`, `rx` is `< MSGQ_NUM_PAGES`.
         let (before_rx, after_rx) = gsp_mem.gspq.msgq.data.split_at(rx);
 
         match tx.cmp(&rx) {
@@ -315,7 +317,7 @@ fn allocate_command(&mut self, size: usize) -> Result<GspCommand<'_>> {
     //
     // # Invariants
     //
-    // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
+    // - The returned value is between `0` and `MSGQ_NUM_PAGES - 1`, inclusive.
     fn gsp_write_ptr(&self) -> u32 {
         let gsp_mem = self.0.start_ptr();
 
@@ -329,7 +331,7 @@ fn gsp_write_ptr(&self) -> u32 {
     //
     // # Invariants
     //
-    // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
+    // - The returned value is between `0` and `MSGQ_NUM_PAGES - 1`, inclusive.
     fn gsp_read_ptr(&self) -> u32 {
         let gsp_mem = self.0.start_ptr();
 
@@ -343,7 +345,7 @@ fn gsp_read_ptr(&self) -> u32 {
     //
     // # Invariants
     //
-    // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
+    // - The returned value is between `0` and `MSGQ_NUM_PAGES - 1`, inclusive.
     fn cpu_read_ptr(&self) -> u32 {
         let gsp_mem = self.0.start_ptr();
 
@@ -372,7 +374,7 @@ fn advance_cpu_read_ptr(&mut self, elem_count: u32) {
     //
     // # Invariants
     //
-    // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
+    // - The returned value is between `0` and `MSGQ_NUM_PAGES - 1`, inclusive.
     fn cpu_write_ptr(&self) -> u32 {
         let gsp_mem = self.0.start_ptr();
 

-- 
2.52.0

