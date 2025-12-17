Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E90E2CC5AB5
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 02:06:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4608D10E9B6;
	Wed, 17 Dec 2025 01:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="l25QXJD0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012066.outbound.protection.outlook.com [40.107.209.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D647A10E041;
 Wed, 17 Dec 2025 01:06:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IdQn/MxdFRxUbBbfE5CSdhubIMluKjQ3NAcgimotpL5kBNf+Cca8mLPTdz5EzCvay4mOVej8pr9dUthYKH7xhSyysA5zKEM6GueQUEL5bXpSMZfvOvCbxn1CWdgKS+MOVM8rd0Irg96aHL5hJJKdidCkDJW/S6TCZ8KWeMsqVhT/GLQV8Erzc6q8hvzhGuf0NgVPkds6V/YJvZf//Oi9yMkOuAfusJnq/9a4WdtZzGPZiqG8U0jNWogxlLYnQdEWJNqQUk4FwZshRVwYVJSst+A+L3rcIwvO9rcrnXCLPLGf3bR/YNo3QfddrJqi6wtyEBHp9IuiDtnvMTH4Bj5tkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0Ynv6LlsrT1hwmKHLeUdNR9S5hrPpcr37JD3siQ3KY=;
 b=PztKFmcQGkjEWj8hlPrgVOjZEUlmzQt9iHFBvqys8dtAhVrYCvEi4yHB+wNjx34oaqHtG5fOzdGRv5rXGh16pREEGBUNA87kqcWZpbrnzbmf3vYqLfAWkr8V3E+l4oN+fSA51GMW+/KWzlCQwehZNpHa7Bml9zs71OVoHiQ0mhrfkpA/l3vdTgbxRVVa7kKkkmH7OuQRHaKZuwcNR60sANPVWMiVIOGaKKH+ms1OgmYfywaqA3zB8huDYw84DJshxok3iPoUV7tstsAJfBqv/bX0JN+TNkxL6EMvaI6q7vh8Ero7oBLdcr6ej06eMFF3ReWhgqONh5YXQ9APMm8Ttw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0Ynv6LlsrT1hwmKHLeUdNR9S5hrPpcr37JD3siQ3KY=;
 b=l25QXJD0BQQbJnSNxRJz86I3HszRtSq7vRFIMZvSJ5yxW+87v1tCTm9r09GxQjIB0I8OT27Kllbho1XGADn+5T/sPCJ8aUgv48ZJ+Xz+ldDJPPyD4tEjuAGsY2AsQnfzxO0g8FLD+I1W95jKQ/opPANoSIrDCfJiU/KOtINP1Cg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SN7PR12MB7420.namprd12.prod.outlook.com (2603:10b6:806:2a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.12; Wed, 17 Dec
 2025 01:06:24 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 01:06:23 +0000
Message-ID: <083e313e-ab8b-4a38-b40d-9b416b8d162b@amd.com>
Date: Tue, 16 Dec 2025 18:06:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V13 06/51] drm/colorop: Add 1D Curve subtype
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: ariel.dalessandro@collabora.com, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com, mcanal@igalia.com, arthurgrillo@riseup.net,
 Daniel Stone <daniels@collabora.com>
References: <20251115000237.3561250-1-alex.hung@amd.com>
 <20251115000237.3561250-7-alex.hung@amd.com>
 <492878007a02ffa87d0cff301571ffd100bc9c94.camel@collabora.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <492878007a02ffa87d0cff301571ffd100bc9c94.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0034.namprd04.prod.outlook.com
 (2603:10b6:303:6a::9) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SN7PR12MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: c53a82b9-18b2-4005-5936-08de3d087ea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlJyd1NyWDBQcDgvaWx4dWNsZXEzdHVkaldoTmVQdi92emZjUVV3Z2FyRXpH?=
 =?utf-8?B?MDZsQUUvU0Q2c2RFLytPY3Q0K21IQ094cFA1NlQydjBKbkduZDBwQ2QvZlg5?=
 =?utf-8?B?bTkvWlNBcFhoQ2JUMGl3ck5FWEJycE5XdVhsUTExby8wd0tpd1dFN0l0bWVr?=
 =?utf-8?B?YmpzOWtzemRCUkZNdlcvSVdhRkRmTFNkZWxOdkVZNzMxak1CaFFwT1k4L2Y3?=
 =?utf-8?B?dlJUQTdGY0M5SlFiMGNpdDNTdmRYT0xQVVp5YkgrY0dZdzMrRlM0VFdHUUZH?=
 =?utf-8?B?SWVGcFVVRmdxYlVzT2toY0lLK3ZnajBnYzZnWkFwVUczMWFtbnJyN2EzWDN0?=
 =?utf-8?B?NDFRb2ZSWm9yOVIvVm8wV0pqZkRpMGVCOHZVM3R1QWtBa0dDa09VQnZubDd5?=
 =?utf-8?B?bDhhc2FWK2FVRlVsa2Y5RHl6alBwT1ZheENIQTdxMXY3S2tiUjlUcWhxR2s1?=
 =?utf-8?B?NVFBZndvRmtHb3ZaWjcxNUVsb21odHpuMmdzNDVWTVBKS3BUbFl6cUl4ZklF?=
 =?utf-8?B?RHdVOThjdDl1ZG1xT0VYMGVnUXAyK2xPdVdmNlZ5TmcrRzF6YXhaZXRzQjRO?=
 =?utf-8?B?VlBCZ1c3U3h5TW9pQWRXQVBqT2lJY0pyRDJkeHhMOGUrbW4vQW42a1ZpKys3?=
 =?utf-8?B?eFJhblpsY3F1TUd4YWlOcXVoMFNSRnoyUVl6K3RsVGVjNG9PNjl6YVJUS0hr?=
 =?utf-8?B?V0RmY3B1UlM0M0lZRE5XWUE5aFpDTWx6anNBZnEzaGFvYlBsVlNmWjlicFFV?=
 =?utf-8?B?aUcrZUtQMC9TMC94cE5YUm8wZGhrUDJzK1EwR1h4cURLZStnMlUwMGFPUnRZ?=
 =?utf-8?B?RmpYTmc5V2hTcXZ3RzRzU2poWlovcTBSckVwMUQ0Rkw4aVRDNGNvT2RYTkZn?=
 =?utf-8?B?KzlMTE5DRWlLU3piRitTcmJlaDdzU1h5UHh4ZmRZWVhCSlZLV3Fqd3FLYlZ5?=
 =?utf-8?B?bjBmbFczbzdzNTVrMHVkNVlnblZlZ1hJMzBkWjA1QkNzeGdkZUhQNWFzdE1N?=
 =?utf-8?B?eVNXVFBKUGt4aElJaVpha2lKRlNnUnFqc05hdEZabTExdnFBallsQzV6MWxL?=
 =?utf-8?B?SCtlMDI2WGt1ME9kTnNVajl3L2FoTTdkV0pzS1RYdlNLL1Raa3RWZEg1TEN5?=
 =?utf-8?B?MWNmY1dkbHpDRHQvbkVmZi9idlFrcFUvdHdyMjdrR09GTHBHcFBaSmRSbVBN?=
 =?utf-8?B?NDBjUENFL1c3WEdWdHJxeEZ6S3RFbVFXREg0WmFaQ3loYkhmUnE2N1U3VjRz?=
 =?utf-8?B?R3pVdU9YN2NhVkU4UC81MjhCSDdXdFF5STBsdG5mdHg5bmY4VnFkQXR0UUN0?=
 =?utf-8?B?aTlyVS90MEpxMUhnU3N5dTdlVjFRbHNWTkNzRTdrKzUzdXhqVjJVZks5eGZi?=
 =?utf-8?B?Q1dQckt3bFlURzhWR210L3FuMmpWTGhJd0RrVlJPb0ZwTFFyM28zR3ZSMU9K?=
 =?utf-8?B?NUlhTHRXTlNIU2JxYzJxNVU4c3BLcG9lSXVqNmg2MXlkMlhGdURsU25nMzFl?=
 =?utf-8?B?OW53SmY5bnNmaFpwS0pWb1FDd05pWnBGUXBOb25kcGVuZUZyVWd0RXdOVXBx?=
 =?utf-8?B?VlJpTUtiaCtRVnpkVU9iWC9LYS9LOHU3RjBsUU9oVDU5bjhSK1BlR2lFdU1U?=
 =?utf-8?B?c3UxRng3My9sdGdYUC9rT0hvcXlRYXlHTDYySVhDQ0JMbHpXMGg1Q001bXFu?=
 =?utf-8?B?aHU5VUpSUGx2WWJkUW0xeVIxSjAvdFRXWCtOOE9NOFVUNVQyWlI0bXNZTnJH?=
 =?utf-8?B?Mm52OVpsRU04d0lPL0pyR3ozOHp5ZHppY0FkNXJKZlI5dWdsdkdxRWRyVC9X?=
 =?utf-8?B?MWxheXpCMWVzQnZabXZKUTdJRm9TZmVHamw0ei9lU3U2MVFuV2pSMGRnY28z?=
 =?utf-8?B?cTZZTkJzVzRPMnFJOVZOMVpwWmxGK3cwa1Ivb0xadXVraVRwK0VvQTNWcHRs?=
 =?utf-8?Q?M+bbbeFd6+0h+XBmA5Y6QsGQpqrtLQKA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGUvdU1kWExJRmFiZkE2YlVoajE2OXdkbjkrM1REVUhkR2dsTDZ0RjMxclNi?=
 =?utf-8?B?dytTV29LYk96MnpuVUlIbWIzSFVjN3pQbUwydlVZQ01USi9TWFZua1Z4OTZa?=
 =?utf-8?B?d1UxWkhKeG05ZHgyTXN3TEl4MzdsTitKTittWHlkaCsyRUhSamVyLzFqREtW?=
 =?utf-8?B?dmE4Z1dIRmh6MkxaM3dncFZBZTUrcitBWUxJOUpWZUFML1RzRHRDUFNPWGhP?=
 =?utf-8?B?TEh0dmg5N2I4d29iZURFakRVYnNZYXhxSk00QVZKVGhCUzF5cGJuMTg5WVBX?=
 =?utf-8?B?aUxWelJRYlFSUGkrSENWTmJwT2Y2eWw0eW45ZURSemJVRkwyN3l5QjFDdXg0?=
 =?utf-8?B?T3RHUUR3TEdiekNldmxOR0VaTkxkTGZSY1RGcFlDdkZES2dyV2FxbmU2eWs3?=
 =?utf-8?B?VWpqMkczaktFZ1I0YU5uUXZGdm9qczFwa3M0QVJMQkJJMTJ2NThNT2dPSSs5?=
 =?utf-8?B?UGdvZURaeUxhdCtheUhiWlVHTFNsY3FkRURJRzZMc2FmK2dMd3I1alJqRlh0?=
 =?utf-8?B?TkU1eDBiTnNiU2pLZ25xUTZmVzJhNWJHTnVVQXpXYnpGZnRkZmNVNk5adkZ1?=
 =?utf-8?B?RjBzajQ4UUx1cWE4eUdJaHh0eHNZTXl6R09KcnZ1QlJBUnlUWU1sdk5hT3Fh?=
 =?utf-8?B?Yjg1K3I2aXZBQm5wN2ZtYmlqYlIxQmZ2azFHT2V1L2p3ZGUwZGJiVDBmeVpX?=
 =?utf-8?B?bGN6b2FpS0FwZFFNVDdhT2pSVkFSVVJMS3I2WkZWcm1FVElVSXFwbjM1akk3?=
 =?utf-8?B?MEVGNWdrWkIyVWpIRUhiQnQyY2JQcG9GemNLenhhYWk3VHcza0M3UnhzTUFO?=
 =?utf-8?B?cXppZmdPS1VCNUtpd25FZllraURhNFlaRDBRMWtxZmRsYld3ZDQyODU4bGor?=
 =?utf-8?B?UFZkZU1TVjEvOVQ3dnZFWEtGZEVNRWxIK0pCNEF4YWJnUXJGYTRpcW94T2JE?=
 =?utf-8?B?N2lUZEtpSHczbG16MitRQXZvSTZoWVhsZm9ZRXFzbFB6QWZONG9DWFBCTmtG?=
 =?utf-8?B?RWJNRDBNUE9sYlZRUTFVM25RRVdheCtDaDlmN3h3ZkowMnA4L1BxdEZlcDFD?=
 =?utf-8?B?Y252NzBucFEzQ092Tzh0TEN3Y05KVjQ5VFFsMzNmZTdmVzJ0bnRvY3NhMHll?=
 =?utf-8?B?RjYvNkdoeU9kQ1IvQndLaTRxVW56b3lJS1BMYW4zQnphUmFDTC9vV2JidlFa?=
 =?utf-8?B?bFlSY082ckoyRGZnWFhoRUFHTHdOQXJyUUNyZUdpYS9vOHA1Uks5R1diNjQy?=
 =?utf-8?B?djhrbzBKaU1JdktMbyt2c3pacHBlYjZ2cTkyZnMrNy9Sc0grcTl2M1gxVEJw?=
 =?utf-8?B?c2h0R2NCbzIwemt2NnZjdnBwUXFYd1dzUnBKeUdXQTZoZXQyL0dKR0hPeDk0?=
 =?utf-8?B?QTBQRVUxdVB0WHBFK1dBSE5iSnJZWEFWdmxaVnZMNmE1aXRqUjZ0cWVrVFdH?=
 =?utf-8?B?bjI2SndhNnEyb0RpOHlpbmFtMjJPWFdaSVJuRG9VUWRaaUJEU3hmRi82TStJ?=
 =?utf-8?B?c2RQUUgyTW91RFoyN3VoMEU1S1ZqTUxzRTFEMy9vdktmMC9tYThsb2REWWR2?=
 =?utf-8?B?azNRSDZzelkwSVRFT09Ka3ZzVHN5ZW1NU3VBKzlhZ1BWTEVET1kyTDZUTEs4?=
 =?utf-8?B?Y2NMbkVJU2NpNTFIcmxHc3lpaTB5NndyNEQ2UitQQ2d0WlJJU0c1ZEVpeE1O?=
 =?utf-8?B?aTA3Z1pGdTBrUFdQYWwwb1lDSGo0TzZsR012M1VYT0JsUWUvQU9wOS9SOFlu?=
 =?utf-8?B?UUdOVXgxbmhVVEZzdWpBazdwZndBNjNOZ3FyZWVxQVZUU3pQeHNMeWlOeVRS?=
 =?utf-8?B?ZnNDcmVzVGxaeWd2aWt1S3RwTVVkdklpT0VVU21QeHVPVFVkaStkd0dhYU80?=
 =?utf-8?B?cVVoTlcxR0w3Q2hseVc5Q2I1bFBZSC9xQmpyMGhMTjVTSjUzeE5McEhRVjhN?=
 =?utf-8?B?a0huTk5yTHRRNXU0SjBUeW00THJ6UGUrVUMwdW8wK3RzOU04djFZeURRN2dP?=
 =?utf-8?B?SFV1UHNJa1ZvRGRDZkl6QS9SMHdDbE05N0NPWTNBT3hGMTdGOFg4L0grUTZh?=
 =?utf-8?B?eUN5TS9mYVZCTjdyRXA4L01zenZzZmtmNVpnMGhPQWVQVDIxVzNTb1ZidVpp?=
 =?utf-8?Q?ZqEUgL7FW+ZFoq+ugXoDB3Kva?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c53a82b9-18b2-4005-5936-08de3d087ea2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 01:06:23.5621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: whdrWnC+VOV4dx+VHOpzSOg5gIRJlXRsKgwqBPJdr13muQ0EqwIVX8/Ui2ngOh7awv9FLWArK7+fbTYJ4vr4zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7420
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



On 12/16/25 11:19, Nícolas F. R. A. Prado wrote:
> On Fri, 2025-11-14 at 17:01 -0700, Alex Hung wrote:
>> From: Harry Wentland <harry.wentland@amd.com>
>>
>> Add a new drm_colorop with DRM_COLOROP_1D_CURVE with two subtypes:
>> DRM_COLOROP_1D_CURVE_SRGB_EOTF and
>> DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF.
>>
>> Reviewed-by: Simon Ser <contact@emersion.fr>
>> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> Co-developed-by: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> Reviewed-by: Daniel Stone <daniels@collabora.com>
>> Reviewed-by: Melissa Wen <mwen@igalia.com>
>> Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
>> ---
> [..]
>> diff --git a/drivers/gpu/drm/drm_colorop.c
>> b/drivers/gpu/drm/drm_colorop.c
>> index 1459a28c7e7b..6fbc3c284d33 100644
>> --- a/drivers/gpu/drm/drm_colorop.c
>> +++ b/drivers/gpu/drm/drm_colorop.c
> [..]
>> +static int drm_plane_colorop_init(struct drm_device *dev, struct
>> drm_colorop *colorop,
>> +			    struct drm_plane *plane, enum
>> drm_colorop_type type)
>> +{
>> +	struct drm_mode_config *config = &dev->mode_config;
>> +	struct drm_property *prop;
>> +	int ret = 0;
>> +
>> +	ret = drm_mode_object_add(dev, &colorop->base,
>> DRM_MODE_OBJECT_COLOROP);
>> +	if (ret)
>> +		return ret;
>> +
>> +	colorop->base.properties = &colorop->properties;
>> +	colorop->dev = dev;
>> +	colorop->type = type;
>> +	colorop->plane = plane;
>> +
>> +	list_add_tail(&colorop->head, &config->colorop_list);
>> +	colorop->index = config->num_colorop++;
> 
> Hi Alex,
> 
> I know this series has already been merged, but I was looking through
> the code together with Ariel and we noticed that while this init
> function adds the colorop to the list in the drm_mode_config, it
> doesn't remove it in the error paths below, and I believe it should.
> 
> Does that make sense?
> 

Hi Nicolas,

drm_colorop_pipeline_destroy() calls drm_colorop_cleanup() to delete it. 
After drm_colorop_pipeline_destroy is called the entire pipeline will be 
freed.

void drm_colorop_cleanup(struct drm_colorop *colorop)
{
	...
	list_del(&colorop->head);
	config->num_colorop--;
	...
}

For example, amdgpu calls drm_plane_colorop_*_init functions (which call 
drm_plane_colorop_init themselves) to create a pipeline. If any of 
colorop creation fails, amdgpu calls drm_colorop_pipeline_destroy to 
destroy the entire pipeline.

In the end, we either have a good pipeline or none.

> Thanks,
> Nicolas
> 
>> +
>> +	/* add properties */
>> +
>> +	/* type */
>> +	prop = drm_property_create_enum(dev,
>> +					DRM_MODE_PROP_IMMUTABLE,
>> +					"TYPE",
>> drm_colorop_type_enum_list,
>> +					ARRAY_SIZE(drm_colorop_type_
>> enum_list));
>> +
>> +	if (!prop)
>> +		return -ENOMEM;
>> +
>> +	colorop->type_property = prop;
>> +
>> +	drm_object_attach_property(&colorop->base,
>> +				   colorop->type_property,
>> +				   colorop->type);
>> +
>> +	return ret;
>> +}

