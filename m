Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A98897D401
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 12:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7D510E7FA;
	Fri, 20 Sep 2024 10:07:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KDs7Da1N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FDD10E800;
 Fri, 20 Sep 2024 10:07:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mgm1RybAZitGy3Ucl084c/UiaHrq/9zJsaJ1Aj2WMM9t+ATHr+Es31Bs0AeWUvh4YaCpXY5tjwnpgUky+pi13B2+1F6iPnL8/9RPtjXq1u2kzVARs3j/Dk8EDqztRExT/v7lExjNBTzYrKhtJ/sZoLaawlCcZrxsTkTysIumIAhyILG0Iox573FrZQyLJePQQ6VX+YTNm3YbB7FxJJDAK6IuZ6WqZ3OOSbMVQNUS/Do62GqKRCJIiBaUmG+1u4esTaaPJRI/cg0IDb5sEzhAdL3G60P7Ne+rHnbyQeKTgyBBDDjITvwZmVaBNMI1At4zhngcf6IQUrckAMpiwcDwkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/PepK+BsQUF6r8qf+uEI10/9bKiD3KRxnKY3e13OXcs=;
 b=oqMtMmw8Wn0BnKvycdfyZgPyVOmz56mzkPQNKTrP42OI4eA/V7dk1M42NUjAv6uknhxQWp54v16qknT5EutlqRVhCzrFnZeHh+mlsnsIc0XfpWuLuJfwVs6bjXQuDjGAAlBoe8tTgIBrF0ePS3ZpT0hu3xmopC2YfaRcEAU1JtQ/aHtSUgz6KpsFpd6Va59b+P5BEO6Jy1PUvUdTBcVvX4yl+3uCkF1Ezxf8/1Br4s+fGR5qx99auPWo2rMNu5okbgto9AjLXjKptm/77Olk2YVZbtg0FWagPoDIoQbX2VyX3X5bf2N8tryDZgVfhOIlEz9rGQ25yI6Ex61NceCU7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PepK+BsQUF6r8qf+uEI10/9bKiD3KRxnKY3e13OXcs=;
 b=KDs7Da1NsXIbi6N7UyceZ2seTu2UIubjas2T7fJhPzxf8svE8PutX/PZ/i0ZgeMPQaF2Jej011Jqbkvy9SCWOxcakdeicwY0P4dePsw0fLbVJp5P7rhhC/V4EVOkibg8IDLllq1RVE/7oGHtYnJVMk3R4WtUemBMaamgutxO/s8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4333.namprd12.prod.outlook.com (2603:10b6:208:1d3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.23; Fri, 20 Sep
 2024 10:07:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7982.012; Fri, 20 Sep 2024
 10:07:41 +0000
Message-ID: <376713b2-6703-4fd2-b99f-cc67de4f267e@amd.com>
Date: Fri, 20 Sep 2024 12:07:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] PCI: Allow extending VF BAR within original
 resource boundary
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 linux-pci@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kw@linux.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matt Roper <matthew.d.roper@intel.com>
References: <20240919223557.1897608-1-michal.winiarski@intel.com>
 <20240919223557.1897608-3-michal.winiarski@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240919223557.1897608-3-michal.winiarski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4333:EE_
X-MS-Office365-Filtering-Correlation-Id: b7073752-a6c8-418d-8922-08dcd95c100f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkttSlVEakZoTzdrTGlWQlJhS29mR0J5MS9kM0ZZVkxONktSUVZDK3A5NWU4?=
 =?utf-8?B?ckxqNjJlTXcycEFYenJUYnhhMTV0TGNrNk9FKzVOZk0veThKcDZCQlN5TWpz?=
 =?utf-8?B?MTkvZXNpNXA1NlBKL200bFVVdW1ST2tzdXc1TGZ2QjM4K09jeVhBZFNadkkr?=
 =?utf-8?B?cGVheklTaGJWQ3lrNEVMVTFZb2RJNnNiZzBxTGRQU2Y2MjRVTHoxTXFiTHZK?=
 =?utf-8?B?cnlhNXFOTVZpVHVaeCt1VjBoT0o5UVNHRkRPUFlGMFBGRUJ2Mk1oZ0ZZd0tK?=
 =?utf-8?B?RkVBbHQySWxnU3A3b0tRbEE2VU45MFlsUmFicjRvcGdsaEs1eUZtVVptb3NZ?=
 =?utf-8?B?NG9VWXFQMUxUNk0yUmxqTXQyYU91TFptUDluQnBmVysvcjgyNzdQbUVjWnd1?=
 =?utf-8?B?TTZ4U0E2enI0a0JHcHBHSXdwWXdyNms1MFFxWGtmenJvY3JrSzJOWjRuRU9P?=
 =?utf-8?B?RHREZ3l1a3ZmZ2k0Vm1wRDl4ZGt4aDI1ZlNjMzBUUlJ3Zm1wNUgxUXhFNlp0?=
 =?utf-8?B?QUlOQ2o2cjZ2SkJvUWs0bnNnbW5XZGhiSkRrcERza2dEOS9sVXIwTlA5N3VK?=
 =?utf-8?B?dWdTaHB0SmVaOFAxZzltUUhBUHNZWUdHLzdPUlJGRkNJaExSTkNsY2EvN3dR?=
 =?utf-8?B?SUxmV29BNG5sMlZjZGNJTTk2N0NIdVZ3KzN4Q1I4RWQ0ZitGTGZ3NzB6dUx1?=
 =?utf-8?B?emdES1lIK1V6SEp0QUh2UUdJdC9KdXRMYm5oRGhsM2NzWERMU240a1BmOGVS?=
 =?utf-8?B?QzBZSTdUT3hlQzYwdmJtMHdmK1lGbmp1eVo5dDBZS082YWsydVFzcFlqd2dO?=
 =?utf-8?B?bDlORU85VXlhME43bkZTZ3JHczB5SjdIdzU0VUU3NTJVUzZYUFRzZElDWkty?=
 =?utf-8?B?ajdUb3E0bjJOb0FtQkJ1K3hLQlZNdEx2dk83UHdncWk4OWg3VWlGdTZkR3FH?=
 =?utf-8?B?aHdmekhVNjdFb2FCa3ZGbHhnV05QNXJUbysyWExPSTVXVjBrQ0ZmU2V0Qmp6?=
 =?utf-8?B?UUg2L2puc0ZkQ3pMY01OV2RvYTZtWTRLMDBqZzk4VjltR2xvdFNVSDNxL1M3?=
 =?utf-8?B?a0wxRmoxdFhiZUJQdzU0ODRpakh5Tm8wczNVRFNlRlhnd2xwbE5BS2NqWnll?=
 =?utf-8?B?YWhxbnlZMm9jVjBEWGV3clk4NWtCd1BDelpmZHRqZGdiTXpkOU10NndDNGdE?=
 =?utf-8?B?NHVSQitZcVdiRDl5RERaRmIrVSswbzRsanE3OTA2TWt4SERWTlkyL2xZSkQx?=
 =?utf-8?B?eUQyS0RRNU81cXVSMk9TU01UOEVWMHUvUHdZU0Jac2psOTcwUzBYWUVyVjRM?=
 =?utf-8?B?b3NNQTRkUytjb05LVnd0R0s1VFpKdFlXMjhwdEQrZEkvempTamN1dGxJWFRW?=
 =?utf-8?B?OUtkd3V5M3YzbThaWTJEcFpKYjBJV2p0V0ljazJydDB0eEx3NHpEbkZFcFgr?=
 =?utf-8?B?UHBGZzdoQ3IxNWRUTjdYVkpmYUdGdEJtTldhME8vQy9IdllVSjF5Z1VWdHRH?=
 =?utf-8?B?bkt4K2FpejBiYkRISWVWb0lUT0h1czJqYUNUS1k3K211c0ZrMW5GT3haa3hz?=
 =?utf-8?B?c0lpaGxIYjlQbERjUDhiaU00S2JYKzJNd21na2J5bVROQmlyNVJOYkw0UDFq?=
 =?utf-8?B?TXNQazY4SEFrd2poZCtNSkJ0dHdEOUkwa1RuaXg3VEcwYURjaWtTbHVZOVky?=
 =?utf-8?B?dVR6OHZpQXA2RE13UnNKaHlxM3VGQnVYYUNSbFZtM0lUR2M1dkNTSGN4a3k4?=
 =?utf-8?B?STBkeTc1a2pzakNFYnRhYzQ1Z3VLaG1hYlh0TE1JMTRIaUd4aUNtZTRHQURG?=
 =?utf-8?B?VWoxd1QzZ1QxUmZkY3VIdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0ZrbnlPa0ZsSm1OVmxudEJJVzM5UE1oYlB0Y3lUdHJ5cUFjT0VSaENOMzdr?=
 =?utf-8?B?MnpYSlVXOHVUMXZuMHo2bXVVMFl0TVBTbU5aeUp3QmlIZERUL3lmU3BKSTEx?=
 =?utf-8?B?eEJwUGJJUkI2TlBlZTMyejZPaVFqNjdSd25RYktOdWVSK2N0cnpUejVIZG04?=
 =?utf-8?B?eWNRaGIvTkt4ZGNIOHpWRktoUjhaTGZYTlRDN0Fka203K0JLRGQzY21oSU5o?=
 =?utf-8?B?dzR1M1Fzb1c4a0pRNURDZm5kNWNHS1dmTm9vS3BuTkJZY1RHeUJiK0JDOXFP?=
 =?utf-8?B?cEZCZXpHMUVBQm9qYnlmV0JpQ3VEM0JxL3hCSzZSYmZ2S0xrc21LbXFxMHVD?=
 =?utf-8?B?dTJTVExDVjBvcDA5MUdERzF3MEFKMWpqeElCQWtJcHJteVJBMjNuNlFvbTJP?=
 =?utf-8?B?QjdCY1JWd2plVEY2aTdNeUFoaWI5b0hvaWFjUHpoREtlVHBsVWZGSElqb0x4?=
 =?utf-8?B?ZlhPWGcrd0dzR1YyTGlmdExIVDgxMUI2aVVrMktxZXBOMnd1R3E1aXU0Q3Vs?=
 =?utf-8?B?eEozSGhuQWoybGEzNnlFc09DTUFzV0tZQTNMUWFtTEJFa1Ftck94Tm0xVVU4?=
 =?utf-8?B?YWlGQ3VoaWRRQjB6VkZvUkZJZ25qSVhwNUVBcThscDFoQk4xUUFTRU1sSlhp?=
 =?utf-8?B?M1d5SzljbFdacHJPSGlKd3huMXpoOGxMNFZEOGRkellKZ3piYXJzSnRkZ2FO?=
 =?utf-8?B?aG9BRVpLTEVYbzAyUU9GTlI4QjlGWHZ0S0RiNlBNQ29pRFUwZEJXREQ1eGo5?=
 =?utf-8?B?azRNdW1rVEFudnBXSzFSNmh2QUg1c0RNL21JSUZSbDh0bWJvREJydjJqRmFl?=
 =?utf-8?B?Wm9GaTZkZVVSY2FtcE83aGNkL2ZreWluSEIzRUQ3aUpQL04zTy81WmxXRXZZ?=
 =?utf-8?B?WXBFQlkrR1F1WjlEN25lR01YWVNjMTRFVjkrYjlyTkJldEI1MUVkaTlwNXkr?=
 =?utf-8?B?aWpSNUVVM0ZDNnNtYmoyQll0NlFBWWJoaDhJM2VySUloM3krOUJRQmRZRk9v?=
 =?utf-8?B?K29HZ1pmZTZsZlVRc2svMmJ0eGUxaFc1dDljdlh3SkVYYVQvazNlRzVTeHJW?=
 =?utf-8?B?b1hwNFpGMW5LSDBtbzdyUEo0ak5sZks4Q2tROTRFUUxaT296b0EvaEREY3dL?=
 =?utf-8?B?eDZ5YVljcnZ1bnB4MGMyZGNZUHFVZUp4eDRmSVppSUZLaWtHZXRrS2d6TnZ4?=
 =?utf-8?B?aWYvdkNKRlhQS2daSlRPazlCWk1vYlpZd1hsMjhPQ3lWNkhzUDR4UUtuK0ts?=
 =?utf-8?B?VmU1MEhDeVVUZlNRc3BSZTJDd29mMEFUbkV4NnNPaEF2aVc3K2xDVllBSWxQ?=
 =?utf-8?B?NnVQNnJ5RWhvSnl3dVhxNGdMblNKb0lOZXZPdk9CbGpWaUVIOExtQ2ZlZWo3?=
 =?utf-8?B?OEdLVjJuZER3NDNCdWpFSi9IN0pVbUVUSjhaL0JjWEJFZituNHRGOUVQS05o?=
 =?utf-8?B?ZUt3MlBiQzhod1BROHljTmZldFBaeG0rOVcrdVc4M2U0YzVQUmx3ckRoTHJz?=
 =?utf-8?B?SWdxaWJhT3JmcTlJL051L3FsY3JLblJ0UlMzcGVmVVQzUk05c2liV2lPOGxq?=
 =?utf-8?B?aE1vL21JNDJrb0lUQ3piVEFyaWRsR0trWDVjSHh3cXFxbDlZQllMSVEvakND?=
 =?utf-8?B?OCtzQjR2YzlST2dCOGxmWnMzTDl5TGg3VDM0S0doMUh0YXI3WXJoQlV6Nk9S?=
 =?utf-8?B?OEF1MitzK0NwSSt3b2hhUXd2YnhOT1ZudGt6eEs0VDNnQWZUZHpVK2pDMmxo?=
 =?utf-8?B?ajBWaHl5YTAyamV4Q1hmRnBOZ0dDck9XMUVJNmZzdjA1c3lqRXorcHZrWEp0?=
 =?utf-8?B?dHRzdnVRQkRQZnN1WitXNDNEUmVBMzF6ZU5kWm1JOU9YNUN3VGpMSFRBNGNU?=
 =?utf-8?B?dGYybzRaMVlRU3VkSExNQ3ovb2RsZTRqRkZwb0tuL1NwUE1GVXhoeFpDU3RS?=
 =?utf-8?B?RnRBcUxleEpYQjh5QzFta3lzekVhVGdGZm1ld1RrWDBiZml1RVk2ZHpUZU8z?=
 =?utf-8?B?RHVVeXFLbzZSbmhBeVJtOFpLeXFrcG1tRXZVdFcySEhDeGIyUHJhMk5wZUg1?=
 =?utf-8?B?MnI3anZrTEZ3NjFJS0t6RmRTbTE3VnI3M29oeWpORVQ1VHh1M0djaGhkYXRq?=
 =?utf-8?Q?pVW4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7073752-a6c8-418d-8922-08dcd95c100f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 10:07:41.2005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GpgGCuY1F1FVkf5UrQz+SBIJhmriMXmdjsO5nV3jnE5SyyxuxcRe6tsriePk9EPn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4333
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

Am 20.09.24 um 00:35 schrieb Michał Winiarski:
> VF MMIO resource reservation, either created by system firmware and
> inherited by Linux PCI subsystem or created by the subsystem itself,
> contains enough space to fit the BAR of all SR-IOV Virtual Functions
> that can potentially be created (total VFs supported by the device).
> This can be leveraged when the device is exposing lower than optimal BAR
> size as a default, allowing access to the entire resource when lower
> number of VFs are created.
> It is achieved by dynamically resizing the BAR to largest possible value
> that allows to fit all newly created VFs within the original resource
> boundary.
>
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>   drivers/pci/iov.c   | 92 ++++++++++++++++++++++++++++++++++++++++++++-
>   drivers/pci/pci.h   |  1 +
>   include/linux/pci.h |  3 ++
>   3 files changed, 95 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> index e8ccd2ae0f024..d88efbfa70e42 100644
> --- a/drivers/pci/iov.c
> +++ b/drivers/pci/iov.c
> @@ -181,6 +181,86 @@ bool pci_iov_memory_decoding_enabled(struct pci_dev *dev)
>   	return cmd & PCI_SRIOV_CTRL_MSE;
>   }
>   
> +static void pci_iov_resource_do_extend(struct pci_dev *dev, int resno, u16 num_vfs)
> +{
> +	resource_size_t size;
> +	int ret, old, i;
> +	u32 sizes;
> +
> +	pci_config_pm_runtime_get(dev);
> +
> +	if (pci_iov_memory_decoding_enabled(dev)) {
> +		ret = -EBUSY;
> +		goto err;
> +	}
> +
> +	sizes = pci_rebar_get_possible_sizes(dev, resno);
> +	if (!sizes) {
> +		ret = -ENOTSUPP;
> +		goto err;
> +	}
> +
> +	old = pci_rebar_get_current_size(dev, resno);
> +	if (old < 0) {
> +		ret = old;
> +		goto err;
> +	}
> +
> +	while (sizes > 0) {
> +		i = __fls(sizes);
> +		size = pci_rebar_size_to_bytes(i);
> +		if (size * num_vfs <= pci_resource_len(dev, resno)) {
> +			if (i != old) {
> +				ret = pci_rebar_set_size(dev, resno, size);
> +				if (ret)
> +					goto err;
> +
> +				pci_iov_resource_set_size(dev, resno, size);
> +				pci_iov_update_resource(dev, resno);
> +			}
> +			break;
> +		}
> +		sizes &= ~BIT(i);
> +	}
> +
> +	pci_config_pm_runtime_put(dev);
> +
> +	return;
> +
> +err:
> +	dev_WARN(&dev->dev, "Failed to extend %s: %d\n",
> +		 pci_resource_name(dev, resno), ret);
> +
> +	pci_config_pm_runtime_put(dev);
> +}
> +
> +static void pci_iov_resource_do_restore(struct pci_dev *dev, int resno)
> +{
> +	if (dev->sriov->rebar_extend[resno - PCI_IOV_RESOURCES])
> +		pci_iov_resource_do_extend(dev, resno, dev->sriov->total_VFs);
> +}
> +
> +int pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable)
> +{
> +	if (!pci_resource_is_iov(dev, resno)) {
> +		dev_WARN(&dev->dev, "%s is not an IOV resource\n",
> +			 pci_resource_name(dev, resno));
> +
> +		return -ENODEV;
> +	}
> +
> +	if (!pci_rebar_get_possible_sizes(dev, resno))
> +		return -ENOTSUPP;
> +
> +	if (!enable)
> +		pci_iov_resource_do_restore(dev, resno);
> +
> +	dev->sriov->rebar_extend[resno - PCI_IOV_RESOURCES] = enable;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(pci_iov_resource_extend);
> +
>   static void pci_read_vf_config_common(struct pci_dev *virtfn)
>   {
>   	struct pci_dev *physfn = virtfn->physfn;
> @@ -445,7 +525,7 @@ static ssize_t sriov_numvfs_store(struct device *dev,
>   				  const char *buf, size_t count)
>   {
>   	struct pci_dev *pdev = to_pci_dev(dev);
> -	int ret = 0;
> +	int i, ret = 0;
>   	u16 num_vfs;
>   
>   	if (kstrtou16(buf, 0, &num_vfs) < 0)
> @@ -487,6 +567,11 @@ static ssize_t sriov_numvfs_store(struct device *dev,
>   		goto exit;
>   	}
>   
> +	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> +		if (pdev->sriov->rebar_extend[i])
> +			pci_iov_resource_do_extend(pdev, i + PCI_IOV_RESOURCES, num_vfs);
> +	}
> +

That sounds like a really bad idea to me.

Basically the suggestion is here that the PCI subsystem should silently 
extend and shrink the VF BARs when the number of VFs change?

Bjorn has the last word on that but I would say that instead the driver 
owning the PCIe device as hypervisor should resize the VF BARs to a 
desired size and that in turn restricts the number of VFs you can enable.

Regards,
Christian.

>   	ret = pdev->driver->sriov_configure(pdev, num_vfs);
>   	if (ret < 0)
>   		goto exit;
> @@ -881,8 +966,13 @@ static int sriov_init(struct pci_dev *dev, int pos)
>   
>   static void sriov_release(struct pci_dev *dev)
>   {
> +	int i;
> +
>   	BUG_ON(dev->sriov->num_VFs);
>   
> +	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++)
> +		pci_iov_resource_do_restore(dev, i + PCI_IOV_RESOURCES);
> +
>   	if (dev != dev->sriov->dev)
>   		pci_dev_put(dev->sriov->dev);
>   
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index e763b3fd4c7a2..47ed2633232aa 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -385,6 +385,7 @@ struct pci_sriov {
>   	u16		subsystem_vendor; /* VF subsystem vendor */
>   	u16		subsystem_device; /* VF subsystem device */
>   	resource_size_t	barsz[PCI_SRIOV_NUM_BARS];	/* VF BAR size */
> +	bool		rebar_extend[PCI_SRIOV_NUM_BARS];	/* Resize VF BAR */
>   	bool		drivers_autoprobe; /* Auto probing of VFs by driver */
>   };
>   
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 4cf89a4b4cbcf..c007119da7b3d 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -2364,6 +2364,7 @@ int pci_sriov_set_totalvfs(struct pci_dev *dev, u16 numvfs);
>   int pci_sriov_get_totalvfs(struct pci_dev *dev);
>   int pci_sriov_configure_simple(struct pci_dev *dev, int nr_virtfn);
>   resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno);
> +int pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable);
>   void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe);
>   
>   /* Arch may override these (weak) */
> @@ -2416,6 +2417,8 @@ static inline int pci_sriov_get_totalvfs(struct pci_dev *dev)
>   #define pci_sriov_configure_simple	NULL
>   static inline resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
>   { return 0; }
> +static inline void pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable)
> +{ return -ENODEV; }
>   static inline void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe) { }
>   #endif
>   

