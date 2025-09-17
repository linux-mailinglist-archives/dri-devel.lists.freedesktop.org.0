Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4120BB7EDE7
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 15:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6E010E008;
	Wed, 17 Sep 2025 01:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="X2eTsBtl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013040.outbound.protection.outlook.com
 [40.93.201.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F48110E008
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 01:49:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tzm+Y4Y0Eam1ci97rveLP6jdCnYEPj0mk3JOJkz0T/q6TVXm18NweOzCzxZOg33YpK5gnUk07CwqK5FjxUqyW3x5hT3kZBEVv6iEu1QfkKu0uwxjUkpcUakHH9tiks3vEADajdEkCWcZhym0gyAx7k0lrKgT+3ADiuET+1BGP5EQ1rP3XPPHmReryN+4I+4QIG4wfkPe6QwptIeinmjyRw57KLyHfx0been23ZinJcjeLqpItNVVVUAtmDOAald4XAAuavB3kz/kwPb1X+SkB7lhWUv8KD3lQrlfqKr30a6rREqxNJLrOEMQ7llQJwVOI7Yo0sLa6JAOAYmEBHKfhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ei0ZyeuWeRpgSypNasx/EXQ9MTks+FXYGSrCV/O9Www=;
 b=Nek17VSVHAYsXCAXkYWrORUbQ+rqv4OGkeuANjwyS3Tbj2UZiLCZ2Xb/OmLTtyVF4vnksWhHVEs9VyJKNPKq/+g5Vw/DJS1tRJOGVnlRKJMQeEiVL/CJiPI5SaedbdgU5QhR2i41WBs6BMy9MDMP1F2mTKnNf1q7786zVzVCdTp5doahOlTwF7n3mmZ8efJGcJkS0vGQpZASi+jodzSOVRmsaojLnCPWkWVZJDGQFdqz3N6RU8MHbMBx6+VHO58U8vDDpniZNrCHOsMeUfeXNT/E+EKoTlUp0q3vRr8q1XwhSYHm670oaD6CnEDeTz+pKYdJtJpI9loFgsqFtiLamA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ei0ZyeuWeRpgSypNasx/EXQ9MTks+FXYGSrCV/O9Www=;
 b=X2eTsBtl8JunqxTGjDU2YfvvVzagxtTQeS9wbR7ZQXGpiN93VB6U0YpAMufIdWndAqKo85HMqkiCpxa/1vxhHbv162MnWDC7p3A5fU/L/X7VJQrECnrVSRRxL2vQy2tUtwMCWyMscEkfYZNN45x3m2336HPGKOaSFdNi4/3oViCp70fvOQz/xRABQJ4V1hP/uKzPM7kEZf/qgdfgJAkSlk6SMfyG/aUfJHY4adsujRBEe27IoHN1vGWicAaGUFbZMbaSe2BFsxmyITMsRbbPq7KOoQZ7wz2zxcEcy/OAJDfttMta07d6S7l/wNTwgyNhGrLT6foEsWQIsxhswhtWFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 PH0PR12MB7010.namprd12.prod.outlook.com (2603:10b6:510:21c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 01:48:56 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9115.018; Wed, 17 Sep 2025
 01:48:56 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
Date: Wed, 17 Sep 2025 10:48:30 +0900
Subject: [PATCH v2] gpu: host1x: Syncpoint interrupt performance optimization
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-host1x-syncpt-irq-perf-v2-1-736ef69b1347@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAG0TymgC/4WNQQ6CMBBFr0Jm7ZgOpCCuvIdhgXSQWdhC2zQQw
 t2tXMD81fvJf3+HwF44wL3YwXOSIM5mKC8FDFNv34xiMkOpSq0a1eDkQqQVw2aHOaL4BWf2I/a
 kXmTaiiozQh7PnkdZT/GzyzxJiM5v50+iX/tXmQhzaqMr1lTfWv2wSYz018F9oDuO4wvWGQpzv
 QAAAA==
X-Change-ID: 20250707-host1x-syncpt-irq-perf-a10b1d9313df
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYWP286CA0018.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::8) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|PH0PR12MB7010:EE_
X-MS-Office365-Filtering-Correlation-Id: 03a7cd28-9983-4eba-b0bd-08ddf58c5d0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEN3VXY5end1d3JsQyt3Y0lwN0FGMnFpeG45REJhd29ZY21veGFETm8rREJj?=
 =?utf-8?B?cG1IZHBaNU13b1NNT0ZiVWttbzQyek5YYStqNTl5cmhueVdxVVZCTUI2Tk00?=
 =?utf-8?B?SFhIb1NOTWtkS2NsQVBpSHBQbTkzZ29lTDBuNitHTUpzWXM4RllxcU1xa2VR?=
 =?utf-8?B?UllNZ0c1THU2Q1VKcnB3aFFFVkd3Ykk1d2grcE1pRDRIaVkzZmVJaWNUUHlI?=
 =?utf-8?B?OTBKWXhkQXdVaDNSR3FRVVFBQ1lDMU80V1FHNFlmUmQ2WjVmeC9BenpkQVhy?=
 =?utf-8?B?UGI3a0ZTR2RvQXRsbFhueU43dHQ0WklSK1lpZmRlTlBPalJtemFJMlh1S0Vi?=
 =?utf-8?B?a2NWQ1JZYzNjOHRIRVRHM0NzbFE5VmhacnVvdG93NjNPeFNqTmlxWm1SbWtZ?=
 =?utf-8?B?NENhV3BvR3NlK1ZWWUk3bWI0UWtRWmxBd2x0dWZGNkVHZHhnMWgvYk9uUVJI?=
 =?utf-8?B?bkFjUGVKd2I3TFN0WUJMS3FGZjVYTVppVHhiQ2RHNWM5NDlob2c4aVREZ0JX?=
 =?utf-8?B?OHlLU0JObVY4YXpIQUdBdk1zUHBDRjhpNnNWT0pSZzZtUUIvQVJ6bnROYUJp?=
 =?utf-8?B?Ui9qOWlZQXd2b1ptRUF2cWlUMjljdTRORlcyaU42VG0wQjFFcTVwMlFWcW0v?=
 =?utf-8?B?clZIWlovWFF2bGc2U2xuTldXRm5hd2Y0NWlQWng2V2xEd1FZL0xkdXZBcTl6?=
 =?utf-8?B?eTNRclBOYXhnV1pkOCtTcFJaT2M3YStwckhtdjkzaG9ITE94TEJ4aE0xcWhm?=
 =?utf-8?B?WkVZTmtPaFdydlBQUlpZbDQwYS9aOGhldzJoNWJmQVhENUovdkMxYXVxK3Rv?=
 =?utf-8?B?SWJ3aG55Zi9CeG9WYjcrR3hRb2Q4ZmhSUEtHRGZLMFVtVmw1YzRRYUNkd2Zp?=
 =?utf-8?B?RWV1R29Zc2syNGxoUmxKMndzajk3YW5WS2lZNDNhKzhiOTVuaHJZTFpJamI1?=
 =?utf-8?B?U0ZmVXgzSlJycmh1WUh5WVZoYlgxUHdnTm5tb29OV0dtalhEcUtrSk1jVUNx?=
 =?utf-8?B?TlZDa1VjZCtjVm9BZjdiM2dRSE1TVEliUU9PYkNSVnJoRUpHaENUVzRydWJ6?=
 =?utf-8?B?OU15TEZCL3RjdkNndCtCT2F4WFZCNDJzMTFqM2RJcFVTOUwzNnZPbjFtM3BF?=
 =?utf-8?B?aVBPQ1dCcU0xcEpIOEY1ZWhWemFLaU5na1hwekhFSm1EMVd5eDdhMWlTN3dy?=
 =?utf-8?B?YTVSdTg4cENHd3Y5aUlDN28zbHBFZFdvTzF4WW5uYWtpZitrMGgwWXJDeSsw?=
 =?utf-8?B?YWdxclcrVzQ5Uk1TdGw3ditGOWxLcTdtV2I4anFIUStnRzhyZzRrc0ltcllC?=
 =?utf-8?B?dWhRUUsyQkFXWUlTWWkxY3hycFdjNUZwTXdnaFRkTG4vSVBBb01uVi9xUFVC?=
 =?utf-8?B?YURiRlVWNjZqdExXS0VGMFkvQ0U0eUlBYm9hdG1NQkFFYWpYdTVBeE5QSHhk?=
 =?utf-8?B?enh1dkFpMWhyYzVmSmhBY2VSVS9pOEVVMHFhMkpGQjdoUlAyRFdWOVl0YmYx?=
 =?utf-8?B?TTBaQm5xdXY4VDBLL1BQT3VGNkxreVNtZ29idTB2RURDNU85K1RoVXRTOU84?=
 =?utf-8?B?SVVDMzVqblUwRlQ5c21sQmdMZFhINWdnaVJXaVMxSVpDZVFuTHZLcmZvODYw?=
 =?utf-8?B?TWdmNncveWwvU24xZlovVDF3dUhaQm9sV3ZZSGNadUozSG1HSlZ4TGY5VmlP?=
 =?utf-8?B?Ujg2MTZBUUoyUkRHbUtML2tEMVlSdnloQlRJajRrUHBhUGU2WERyUENNd0F2?=
 =?utf-8?B?d3dhQURRUSsvYmJGb0RGY0ZRTmNweXpXZEhhZTNldWllTVovVU80V0tZcHIr?=
 =?utf-8?B?K21vTmllR1FHOXpoZzR6Q2VPcnY4UHdhYXNjVkt6Y1hBeUxFNkNvUlBOWVc5?=
 =?utf-8?B?Q1MwVFk5NTRsKzVaRktmRTVLOUJQQXJ4U0dzMlFVSklEaFB1b1dnTVEzc25B?=
 =?utf-8?Q?/Lz8xBGqFFQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFFXZUFmdXo1MGJkSXZ5bGhBdHJwZkRmb2NGNnR3TklIU0NGeXVTTXo4K29V?=
 =?utf-8?B?YjVnbnkzdGo3ZFdFeU8zSkM2WHhqenh5TTZiZDFXMklYV1pkZWU4NFpoN0s1?=
 =?utf-8?B?SFZGV1hxSDBqMmdmT3QzRDRXOFpXTjNVTE5jRU04dkdob0JmRjZpdWNVMldy?=
 =?utf-8?B?dW8wR01UNTVqRmlTSFVoVSs5N3pQSXlmc0svUHhkQ0ZmK3E4MHEzYzVhdW1E?=
 =?utf-8?B?NzBrZnJVMXFmZU0vNVB5TkkzVWFMTWNwTUxYWE5jaFhmQTlaNlN5OFRHYXdW?=
 =?utf-8?B?bGRSZ3pXdmtRSEpqT2NrMWcwcUU0bFkxeGRnTExDVit6eTRIRDNWRlU2aUJn?=
 =?utf-8?B?UUNEYWhrbW5jNlhaUm5hS0pHZ2ducUVia1FWQURxMWtrVzhnUG9TTWZIQzA4?=
 =?utf-8?B?ZGxqZC9MQlJLdlVJZ0hwWm1QUjgzSTVCRkgyVXlYR2pzSTVnT1liaHFWcDh1?=
 =?utf-8?B?QTY3QkxoMlUxTnlpN2FoY2NTY3BDTno2c3FJZGZxSUh2MExGdW9hL2pUNmt6?=
 =?utf-8?B?RjQySStJRkFkRW5iVnBVYmtOcU1HNzhvNmNBMTkxWW5qdzVmWDZDb3BqOFlL?=
 =?utf-8?B?a2RRc0M4ZjUyVGZ6VE01NUhNTlg0a3Zab3A4cXlDY01wTFl4NTFaY3VUMGVz?=
 =?utf-8?B?U29NL3ZpVnY3dGQ4UXVLa2FnaWhmY0tOaWoxUTQrbG1INnU1djBKZFFkcGVZ?=
 =?utf-8?B?VFo5OUtYclJRdHNkRGtqYVgwa3VNajIybm1taXVlbkRuL090cXRqelNsNnQ2?=
 =?utf-8?B?Tm9aK3I2ZnBuWjdVRnBDMzF3dXArdEZGRjRITXNBbURLZi9CSFZwZXFheVdy?=
 =?utf-8?B?L1JheVVPYjFpcll2VG10SGozTnBwbmxiM0srVzFWemRZVHZ0U2hXQkZ3bUZ6?=
 =?utf-8?B?WjR3UTZNek9RY0k1TlJ6LzJjSU50VlVMVFJXWCtTYnpIVldtM0RkVExUL1Y1?=
 =?utf-8?B?QmlhbDhoUFIxRHpIUlEyUlU5c0hibDFoSFFhcHNHcWV2MUFOdDVxSzJDcEtV?=
 =?utf-8?B?b2FHbElrcnJ5RnlnanVLc2x4c1FwOXgzcWtnVHNpeHFtKzFha3FIVE1EczRn?=
 =?utf-8?B?VEtxTXJENEdsR3ZkUU1qMVBRU21peDBoOUdGcE1pS0VGWVNCUlYyeWMvSGFy?=
 =?utf-8?B?VHBZeVFWZmhsdWlPcmQ2QVMydzlpNVZySWovS3R3aXlPR3Z5N09yb0d0YWVx?=
 =?utf-8?B?aHV5Z0d5cUQ2QW1KRmVrSzFCSVR0bk1rWTBxK3NibXlsUXBuZ0Z4dSt5UTVL?=
 =?utf-8?B?SW5zb1A4d0xkR2VPU3Q5MXNJMzA3ZURhNjRsOEhjSWtHV3RMVEMzMU1MaGFj?=
 =?utf-8?B?Tml1Q2s3WW9nQkMyTWhuL0xuWVpNSC82NlV3MkZ2TkhPWjVPSzFHTnBXejZw?=
 =?utf-8?B?aUlwdVJRQVVZaXdJaVJHVmJSYklkWjVvdUhvL1lUL2RMY2Rva2ZKeGQ1NUNU?=
 =?utf-8?B?R2M4ZzNLUUpIazRoSFNxVzAxQUt2c1BweThBSng5a1B1RUF6cGUxUlZZQVJR?=
 =?utf-8?B?T3hGOTBlRFNvN0hBMGMxQ2w1UWJQUEJLZnd4eHRxbUlGSmljT09aU2c2VThO?=
 =?utf-8?B?UFhWQXI0dExZQjAyTVlEL0VwZFZmcXdhZFQ1d1BUZHk4NkhmWVpCY2Nna052?=
 =?utf-8?B?VnNJU20vd3k0cWhyN25PaXRseUxybTg3WlRxT252UXMvTEtPVzFRd0Vqa1JG?=
 =?utf-8?B?S1RUNlFCL1JjRG5GS040NE5uZ3daTU5rSzVrNDFicUZKMTZpSGdSRmdCOERm?=
 =?utf-8?B?TWdQZXhVUnV6NHFsemgvMHdJeXd1Y2g2cHBUSW0xTVBCL1NuYmNsNUJlRlp1?=
 =?utf-8?B?Y2FiTkhpZ0FubjJJdXhrd25iK0xWRmRMY0VtVnZGR09BYVJKcCttTXBndGtm?=
 =?utf-8?B?UzhNZVlUUXdRd21pRlRjMm8ybm55U05pUW52cWxLTUhmdWxsQnZ2NHpmN1cr?=
 =?utf-8?B?aEtDMElHb1J0MnpteEluR3lTNGZIQ2diZnhaUk1UV1V1Z0haTHVHTlFpQ1FX?=
 =?utf-8?B?Ti9VQlVuQ1dybVBxWENmR3RqWkFQZFRmNHBhQmVZcDFIWHkxcldCamJhSy9V?=
 =?utf-8?B?azRFUzU1VHovZHRvb1lvSUFLNTRnSXlWdDYyRExHNHM1L2pTVEowZFh3bzk2?=
 =?utf-8?B?b25pcDV2ZmNOd2VoV3FYR216dGx3SlRMZFlNTk9yNzRnR05SRk5sZ25zTStD?=
 =?utf-8?B?TmRQQUpIR0lZL3F6RDI4VFRmbDlTMW5MZEdnVlhIc3RQanFyeWRaVytnenBY?=
 =?utf-8?B?cDc4RmJ4RWxOZGV1RzhpUFJYdndBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a7cd28-9983-4eba-b0bd-08ddf58c5d0d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 01:48:56.3941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ZnzH23OECUHvbTHEZWV9b2p0vPxaZcmLa0qNdnmvd7rWaIWhklHgoykv8GXtIJo+J8s8d8wFwxeFGGF5bpxLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7010
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

Optimize performance of syncpoint interrupt handling by reading
the status register in 64-bit chunks when possible, and skipping
processing when the read value is zero.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
Changes in v2:
- Pass register value as unsigned long to use with for_each_set_bit
- Add unaligned register handling for Tegra186/194
- Link to v1: https://lore.kernel.org/r/20250707-host1x-syncpt-irq-perf-v1-1-16d53e516895@nvidia.com
---
 drivers/gpu/host1x/dev.c        |  9 +++++++
 drivers/gpu/host1x/dev.h        |  3 +++
 drivers/gpu/host1x/hw/intr_hw.c | 56 ++++++++++++++++++++++++++++++++++-------
 3 files changed, 59 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 1f93e5e276c0835eac2f713ffcd60a9db8db2c21..80380b6138276877be9709048c15da85d079f977 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -71,6 +71,15 @@ u32 host1x_sync_readl(struct host1x *host1x, u32 r)
 	return readl(sync_regs + r);
 }
 
+#ifdef CONFIG_64BIT
+u64 host1x_sync_readq(struct host1x *host1x, u32 r)
+{
+	void __iomem *sync_regs = host1x->regs + host1x->info->sync_offset;
+
+	return readq(sync_regs + r);
+}
+#endif
+
 void host1x_ch_writel(struct host1x_channel *ch, u32 v, u32 r)
 {
 	writel(v, ch->regs + r);
diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index d3855a1c6b472a9bd289c753d79906463e6bcdb4..ef44618ed88a128bae9ab712bf49f8abc0f3b778 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -179,6 +179,9 @@ void host1x_hypervisor_writel(struct host1x *host1x, u32 v, u32 r);
 u32 host1x_hypervisor_readl(struct host1x *host1x, u32 r);
 void host1x_sync_writel(struct host1x *host1x, u32 v, u32 r);
 u32 host1x_sync_readl(struct host1x *host1x, u32 r);
+#ifdef CONFIG_64BIT
+u64 host1x_sync_readq(struct host1x *host1x, u32 r);
+#endif
 void host1x_ch_writel(struct host1x_channel *ch, u32 v, u32 r);
 u32 host1x_ch_readl(struct host1x_channel *ch, u32 r);
 
diff --git a/drivers/gpu/host1x/hw/intr_hw.c b/drivers/gpu/host1x/hw/intr_hw.c
index 415f8d7e42021b791550ca719adafa088cd34101..aad4435256ba4257f19a20c02bfa552229b62c55 100644
--- a/drivers/gpu/host1x/hw/intr_hw.c
+++ b/drivers/gpu/host1x/hw/intr_hw.c
@@ -11,26 +11,64 @@
 #include "../intr.h"
 #include "../dev.h"
 
+static void process_32_syncpts(struct host1x *host, unsigned long val, u32 reg_offset)
+{
+	unsigned int id;
+
+	if (!val)
+		return;
+
+	host1x_sync_writel(host, val, HOST1X_SYNC_SYNCPT_THRESH_INT_DISABLE(reg_offset));
+	host1x_sync_writel(host, val, HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS(reg_offset));
+
+	for_each_set_bit(id, &val, 32)
+		host1x_intr_handle_interrupt(host, reg_offset * 32 + id);
+}
+
 static irqreturn_t syncpt_thresh_isr(int irq, void *dev_id)
 {
 	struct host1x_intr_irq_data *irq_data = dev_id;
 	struct host1x *host = irq_data->host;
 	unsigned long reg;
-	unsigned int i, id;
+	unsigned int i;
 
+#if !defined(CONFIG_64BIT)
 	for (i = irq_data->offset; i < DIV_ROUND_UP(host->info->nb_pts, 32);
 	     i += host->num_syncpt_irqs) {
 		reg = host1x_sync_readl(host,
 			HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS(i));
 
-		host1x_sync_writel(host, reg,
-			HOST1X_SYNC_SYNCPT_THRESH_INT_DISABLE(i));
-		host1x_sync_writel(host, reg,
+		process_32_syncpts(host, reg, i);
+	}
+#elif HOST1X_HW == 6 || HOST1X_HW == 7
+	/*
+	 * Tegra186 and Tegra194 have the first INT_STATUS register not 64-bit aligned,
+	 * and only have one interrupt line.
+	 */
+	reg = host1x_sync_readl(host, HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS(0));
+	process_32_syncpts(host, reg, 0);
+
+	for (i = 1; i < (host->info->nb_pts / 32) - 1; i += 2) {
+		reg = host1x_sync_readq(host,
 			HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS(i));
 
-		for_each_set_bit(id, &reg, 32)
-			host1x_intr_handle_interrupt(host, i * 32 + id);
+		process_32_syncpts(host, lower_32_bits(reg), i);
+		process_32_syncpts(host, upper_32_bits(reg), i+1);
+	}
+
+	reg = host1x_sync_readl(host, HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS(i));
+	process_32_syncpts(host, reg, i);
+#else
+	/* All 64-bit capable SoCs have number of syncpoints divisible by 64 */
+	for (i = irq_data->offset; i < DIV_ROUND_UP(host->info->nb_pts, 64);
+	     i += host->num_syncpt_irqs) {
+		reg = host1x_sync_readq(host,
+			HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS(i*2));
+
+		process_32_syncpts(host, lower_32_bits(reg), i*2+0);
+		process_32_syncpts(host, upper_32_bits(reg), i*2+1);
 	}
+#endif
 
 	return IRQ_HANDLED;
 }
@@ -68,12 +106,12 @@ host1x_intr_init_host_sync(struct host1x *host, u32 cpm)
 
 	/*
 	 * Program threshold interrupt destination among 8 lines per VM,
-	 * per syncpoint. For each group of 32 syncpoints (corresponding to one
-	 * interrupt status register), direct to one interrupt line, going
+	 * per syncpoint. For each group of 64 syncpoints (corresponding to two
+	 * interrupt status registers), direct to one interrupt line, going
 	 * around in a round robin fashion.
 	 */
 	for (id = 0; id < host->info->nb_pts; id++) {
-		u32 reg_offset = id / 32;
+		u32 reg_offset = id / 64;
 		u32 irq_index = reg_offset % host->num_syncpt_irqs;
 
 		host1x_sync_writel(host, irq_index, HOST1X_SYNC_SYNCPT_INTR_DEST(id));

---
base-commit: 33bcf93b9a6b028758105680f8b538a31bc563cf
change-id: 20250707-host1x-syncpt-irq-perf-a10b1d9313df

