Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CDACFB66A
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 01:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F249610E040;
	Wed,  7 Jan 2026 00:02:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PoJWLzE2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013071.outbound.protection.outlook.com
 [40.93.201.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341C310E004;
 Wed,  7 Jan 2026 00:02:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bvoB2E8eFgv5QoMPIp2Ak8liDzf1GFQ1WyoZXMXb0Iq//Ft0MaAK3N42MGb1DfgdwKUctYkH7kEGyecZTytgbZRdt7+QhwA6xM+FVPSLbu6Lz31sayD2O18l6q6rlX83wAC9QRCDuGaEKHtQAbzU4vUcb1DgEL8G9eINzyGXP5awc/S0a+DqAeWkdI5CTag/IktYEtWnjUj4huPnpSk6FxMkx/ncx3vM8ks8TrtmGN4KHUCbhU6UjiZuFG9sfTswBNlwpsFfEBhwyoFqAEH+e7K3cv6aSKEs6Onw3iy2pvDq+Dl33eOvIUtVi2YFNvvJwiCSz90E3BWL3ftAmxjDBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1n48UA7DQh1I8+oePIJxclpPeCZpArbyR0/tc3SjSKw=;
 b=jL/HZv85C5WrkT4c0Opqnh52wZbzX7Nc9AlcXfb6SmI+PN+huM19/8thTD/KhMrFPjftLWsJFBlfzq/FwIypzr9U3bxkot3RiBQl0JK0+6zNW3YjavMwRkmTWW8BU77XzYsWDVi4rW7pQvG0JWxyIWW4IR8M+nI7f3XxY44jj8dzBZdd6Hh3FvSkZTiXI7aWjfRlvptsFDbcqDRUFQZ/IQT7iN9x06bJSSKUoSQQFcKVbJUPacIYn+x+/REgr7hexDX9ZO797wfAnKf8uJbilomPr/+3BLHWCS/G676TykKukq8Wy12tD85ccC2JLEPrn8h+qpyYdrXUTRCMMpx9zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1n48UA7DQh1I8+oePIJxclpPeCZpArbyR0/tc3SjSKw=;
 b=PoJWLzE232NVN7zx2qqakSGOZfoeq8KRctrCbymkUKLO/fCDFlTmrv40LU7fXHc81XQV0A1eFVVGT8RLSJT34IXfPJ4kDn2DFno3vSaAhmp5HWW24IaRsCO6KlgO2XePEn1O+3U+Gi2TY6hHvdQXR0Kr4RgSVBG4XMm+b12eBqM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by PH7PR12MB6787.namprd12.prod.outlook.com (2603:10b6:510:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 00:02:33 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 00:02:33 +0000
Message-ID: <4b71d7cd-72d4-4666-8f9e-81a30ce1817f@amd.com>
Date: Tue, 6 Jan 2026 17:02:30 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] drm: Allow driver-managed destruction of colorop
 objects
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 daniels@collabora.com, uma.shankar@intel.com, suraj.kandpal@intel.com,
 nfraprado@collabora.com, ville.syrjala@linux.intel.com,
 matthew.d.roper@intel.com
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-6-chaitanya.kumar.borah@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20251219065614.190834-6-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0277.namprd03.prod.outlook.com
 (2603:10b6:303:b5::12) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|PH7PR12MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: fb05009d-c710-421e-43e3-08de4d800e9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEZQUWI0ZTY4WDZMZTlaYzkyaGtVVUpVd3d1eXpIMjFva3hlcms0cnZmTVpS?=
 =?utf-8?B?MitLRWlWYkh2TDl5NWd5d0VvUkFMMVU3c2VubkFiWlJoWTg3Um5ieHBrVzBx?=
 =?utf-8?B?c1p0WU0vUlFZZ1dCY1JsRDFhSWxEMThhZlhlZ3BCN3BEMmxBakhIVFFJS21L?=
 =?utf-8?B?OGl6ZTZkK3JzVXY5YURVbjRWeVJOa1NTTElIWnVneGNWRStiTHdPQmoxYXE4?=
 =?utf-8?B?dVRGV3R4K08wbE8vcENBT3p6eUEvY2tKUU5tYzNQTWtDbm84Si9wVXBMMGp0?=
 =?utf-8?B?N2ZvNUNKSDB3L005TVdUcTEyRGZ5V29idkZQZy9yRC9rRElHZ0lVNXhXb1Zs?=
 =?utf-8?B?R3VJVEtJdFp5bWRUMjNxMnhacWJYSTZncjhxQzJlZU15eGVNRFF4d05SUXQw?=
 =?utf-8?B?TDl6SEIyc0tQTkJ1d1kyQ0JjUW1BK0ZjSGM2UlNwTFBIeU1UUjVML0h4M3gz?=
 =?utf-8?B?bFU4dDJGc0p2eE1WUUFvMWF4UCtWbktHUEpYcjhOK0dWaFl5YkgxMjRZR2hF?=
 =?utf-8?B?SUo0Uk1abHhhU1d5dCtUb0cyWVRHZFYwZjlwU3d6Tkh2QTlFelppWGJGYUZo?=
 =?utf-8?B?OElGbjMrQTlOdHE0MUtRZ0ZBVkZkT1ZoeDl1Zkk0R0ttejFwcjRieTRTanRL?=
 =?utf-8?B?UWE2ajE5VlJQK0RJbHRZTEdMVnI3SFluZXdEWHJzeFczR3dHN0pYWUxMOHc0?=
 =?utf-8?B?SXJlL2ZKMkNZTlZaYlJ2YzZGZE8zcXY1ZkZPNVpmUmxMVXBxYjcyWUpsSFcy?=
 =?utf-8?B?UTNaUnhuUFB6UVh3RlFWUHFiazRRWlBhYzJJWitZTWhyUVk1dGxIWmwvOE0x?=
 =?utf-8?B?S2s1YytweVpWaC9CT01pZHNBKy9KOEc1dWdSVWpydm9nallsNnF5am96NmlI?=
 =?utf-8?B?SHlTTEZybnFEUFExMlhOb24vWWFOc1FzNVY5cDBXUXU0a204Rm4xRHkvWjUv?=
 =?utf-8?B?OEtJbytWQk5BaUJaUmd1UUc1STZSOWI1SHNKZmRPUWFYbTdqdHNpcGJsdlhy?=
 =?utf-8?B?OWt5SEttNE80eHNSdDlWRXFmS1diZjZXd0licVpwaHBzeXhTbGcrTnFpY09m?=
 =?utf-8?B?VFRJYzdOQXZMR3ZMcExNalVhUmdyNXFDRnhFN3JickVGSGFrTlBjdk0weHpj?=
 =?utf-8?B?a1dPRUJMd2NYWnVWN3c5TVkzUWRIZDBobGwxVFhQRTZScUcydG85eWFKYnR2?=
 =?utf-8?B?QTl3Ymw4Wlp5b2NiUFIzK2hRSkdBNEw5SWJyUkp0eXdaTHIvK0FEOXBNOGwv?=
 =?utf-8?B?MEluUVJoRnRYZXRtV2poeWFTNFB6Z1dKdTh2enMzbncyRWJ0Z2gvY0pYdm9v?=
 =?utf-8?B?V3NyYXIySEpJRjNkTGkwUk9mVEs1OHNSVm41RFVTdHk2bDBaVktZR1dKcWdw?=
 =?utf-8?B?clN2QWlYVVBXbWFhR2NlVDBlVm9xSmVGSFVqLzRHY3VUak9malVNVFBNTDFV?=
 =?utf-8?B?dGFSaHA4eG4zMi9yTGtDclk4NE84ejF3L1pWcyt1UlY4dkxxa1VVK0R4K3M3?=
 =?utf-8?B?RG1DVXhjRllaMFpUa2JXOFdLeEhSZGsrWVo3dWhOemRFdER1UDIvejRHZUxV?=
 =?utf-8?B?K3phL2xJNUUrdmx0MFp6TEhQeGIxSlRzcnpXV3VJdjlzMDlwc0N4c213U2du?=
 =?utf-8?B?Z2twUTd0Q2NSNEVnRW1NSEh5RVczdEhlSEJWSzNiWXM1cmd4NWdjeDhmY0dJ?=
 =?utf-8?B?N1pWRE9uVFJaRnVVQ1ZBcHFKY1JEb2NaQUNJb3E0YkkyRHhyY1UyUU0rMitl?=
 =?utf-8?B?a3d5dlpIeUdWWEdmL0UwQkE2KzZNekhtVGVwaXpNMWlYd25BTDdWY1A0SHJz?=
 =?utf-8?B?dUU2OUhqQWpZUnh2cnpuNEVkb2xKdlpBdG1UMEh0SzBlejM1My9iZU9NYVVO?=
 =?utf-8?B?MXVEeWxRU3p0dGFWMjQ0RzNoN0NHNEJHKzdabFJRZyt3QkN2SERldUdLd0ZW?=
 =?utf-8?Q?snHarRUcWJ24hj/HnbMFKNm70eTtLWv6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXlpQkp0SHplUjd0a0R6RyszZkFmcy9Fa2Y0MzRxc3UwUFpTeml3RzBBVmcy?=
 =?utf-8?B?bGZJM2lRcm5vVkJIL1JyUmFDZmhNMWFTNUhhUDBYaTRRazRKU3ZiUCt4NGtr?=
 =?utf-8?B?M2VzVzBvYlNzbi9WU2pDT09sZERmNDE4TUZBTGRGSXQ2M0VZWHlFWVBNb010?=
 =?utf-8?B?M2hYUW1sbkJDRU1oTDBmMlFOcU5RSWg3VlYvL1ZwdjUzR0VWQWI4d0JUTFVW?=
 =?utf-8?B?cDVEbXo0bGFsY1QzVCtVSU4vTWZScnI5czRYUFZVQkRqNzFxeHZhQTJReVFi?=
 =?utf-8?B?aSsxNmc0RkRpYWZEaS81S3VxcTU5Y1dlYklOQW53OWpXMUlSbnJRdTVYR1Bn?=
 =?utf-8?B?VFBYR3J6L3hBbWhCRnRpbmVzV2FTZHdMUHl4TmFVcGtBbTRKYld6L3Vta3FK?=
 =?utf-8?B?d2NaSHdDZWRCaWYwczdVNm5oVUkzQy8xdE8vUjB2cXZmUGxJZ2lxc01HaXdJ?=
 =?utf-8?B?QzNGYVZSME4xTE5Vei9TdUM4eGduY3lXWkZjK3g3cFlNUjNDWWUra0VFckFI?=
 =?utf-8?B?ekUyVGk3cWc4dDBmY2dpbUZLNkY1VWV0MVkvampwNkRscFZ0b1lYbUxxYUNE?=
 =?utf-8?B?Z0dIWHEwTGZmNHBsZjNXeW8zWlJIdS9XS3V5emptc0VPb0tFa1IzRzFrb2tT?=
 =?utf-8?B?NFZ6T1RweVZLS3FlSWd1emtPWE9QZHpJSGtxOWsvOGc5b1pzU3ZNdjlybmtx?=
 =?utf-8?B?LzdsblFGK1lscEJlRnRybU5XYVVBbUVYOGNzRVNLZ1hQN3hkcDJBQnh1d0dk?=
 =?utf-8?B?R1dVRDRXcG8wcXhQY1k0bGVlYmV6M3A0cCtFd1BZTU9oNkRDaEJPVFNmb2JD?=
 =?utf-8?B?ZWpsbDhjNGFtUUtHZkRUL1VNNUtXdTRIdDdpaHkvS24zVDFXVEI3RnFRekVo?=
 =?utf-8?B?WjM2b2dqWUh1Tyt4YTNXMzJvZ1NPdm54YkdpZE9CSFl3YStoT3lDbVBxZSsy?=
 =?utf-8?B?eEdCaDMxOUlKcU90cEpjNXhOTXQxL29VR2tpc2pqVjM3TE5kRGFiRk04Q29V?=
 =?utf-8?B?azdJMUszWEdyRmlCTlBDY2k4TG1ONmQ5eVM0c08xR3FyUk5qNUpQT0JMQkFk?=
 =?utf-8?B?Kzc5azZUYTExbVVIZ21sSUxCeFliYmlMbkE0LzNiTk50WUpEbEdjUExBaE83?=
 =?utf-8?B?eUg4eFg4cGJLQmhONy9HeldMQTdPeU9rc1V3cjRqa05WeDhKVTh5czVMMjlw?=
 =?utf-8?B?Qi9jWHVJa3VFNXVSVE9nSEFPUlg5em5EWG9kYWEvMnpUVjRQdytoS2tBdnM2?=
 =?utf-8?B?d25UbTFOdVA4VnNKd1Bpd1dlNDBSak9vV2hKdFRUaEhlcVZXanVlZGtRWWdu?=
 =?utf-8?B?Y2wveW1NcHNSaE5oTzFKck00Z0k0emovSUgxSU5HaC8zaW1QTlREd2dBdDdj?=
 =?utf-8?B?VGJlUDc5V0dqekp3bjhVTFM1M1VucWFDbXA5QWo1S0QxZlJXZmFkNGVRQ0FW?=
 =?utf-8?B?Nk8yRnB4UFl6SnFGSXRjQjd4bzlpeWsxVmhHbkhaKzZFa3o3UC82QldiTWVo?=
 =?utf-8?B?REVwalFGdHNhVnNIR01jVHhCMXloTy92RnpOcjlZejg4UTRQN1ZHN1VCbCs4?=
 =?utf-8?B?K1JJZlpseElFSm1PdTJyMHFkc2R3T1hzRy9CTHJUa3l1dmNvR1UwWVRrK1Jx?=
 =?utf-8?B?MmhxM3pMYUhkcG9NTVdGekhlR241MEFJaHhvRzVZNlZvSXUyTS9NZUNZQThj?=
 =?utf-8?B?SlBZb2JNMEVYTmFxUVNTbkJWM2VKcFdNWTFGRjdvdUZpZ3hDZjJXOGZzRWhS?=
 =?utf-8?B?RFJiNEpEWG5RVEpGZjcxYU1ZNWtJMHlENStncUkzZ0lnWUNaVFh2ZXZlbHp2?=
 =?utf-8?B?ZnBEV1Jldi9BTGtOaVpmWTRRS1BObFlWajMxYnlEU3dJUUFzUkI3anowSThX?=
 =?utf-8?B?NlhSTVA5RC9LTzAvOXJIaXV6eVl2eVd6YnNuY21mYlQxQS9WL3J4YkJDU0py?=
 =?utf-8?B?anFTL2VkcjhBaFMrelYwZzE1dWozL1hIQ0NBQm5OZm1FWVZBd3hZbXZyeU4x?=
 =?utf-8?B?ZFoySHZPNkx4K2JXcmY1S21tc1NYTStDUnEzNlhDZndJK0ZzVWFPWkRGQmtx?=
 =?utf-8?B?WWFxcWozMkFTeXJDN2xHdzhFUHRxRm5WTEtjYUZQMEcyazFkZVJRMEM0UUhw?=
 =?utf-8?B?bUNZRUh3S2F0cEFBSG10ck5NbkNOUk9VMS9rN2d1Nk1kdE5QM3hrSis3MklS?=
 =?utf-8?B?aDhyd3hyM3BrOXV4dGVTdm0yZ0Jram4vTUZ2UVFVZEdERHdIcW9UckNNVTE5?=
 =?utf-8?B?a2ZDK1piTW9lM3V2aTRFYmx3WFZNWUxtbHhobXVIQ0dwa2RQV21velBnNmNZ?=
 =?utf-8?B?bkxScW4wVGxhQVRUOEU2MzkwcUd2WHF1YjB5MFlQaFVZaXlaSkRFdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb05009d-c710-421e-43e3-08de4d800e9c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 00:02:33.1121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uO5ESEkTTiuKYmmSiw1LRJEIGeGlgJqUAxsfatu9HsW8JEp+i6yDVh+P1gt/Unqg9Rl1er2/LaSFuV1vv1Ahcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6787
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

It is a nitpick, but is it better to have patch 6 first, and then 
separate changes to drm to a single patch, and move the changes in 
amdgpu, vkms and i915 in the following corresponding patches (7, 8 and 9)?

We can avoid passing NULL to struct drm_colorop_funcs *funcs.

Otherwise it looks good to me.

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 12/18/25 23:56, Chaitanya Kumar Borah wrote:
> Some drivers might want to embed struct drm_colorop inside
> driver-specific objects, similar to planes or CRTCs. In such
> cases, freeing only the drm_colorop is incorrect.
> 
> Add a drm_colorop_funcs callback to allow drivers to provide a destroy
> hook that cleans up the full enclosing object. Make changes in helper
> functions to accept helper functions as argument. Pass NULL for now
> to retain current behavior.
> 
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 18 ++++++-----
>   drivers/gpu/drm/drm_colorop.c                 | 31 +++++++++++++------
>   .../drm/i915/display/intel_color_pipeline.c   |  8 ++---
>   drivers/gpu/drm/vkms/vkms_colorop.c           | 10 +++---
>   include/drm/drm_colorop.h                     | 30 +++++++++++++++---
>   5 files changed, 66 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> index a2de3bba8346..dfdb4fb4219f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> @@ -72,7 +72,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>   		goto cleanup;
>   	}
>   
> -	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
> +	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
>   					      amdgpu_dm_supported_degam_tfs,
>   					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
>   	if (ret)
> @@ -89,7 +89,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>   		goto cleanup;
>   	}
>   
> -	ret = drm_plane_colorop_mult_init(dev, ops[i], plane, DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	ret = drm_plane_colorop_mult_init(dev, ops[i], plane, NULL, DRM_COLOROP_FLAG_ALLOW_BYPASS);
>   	if (ret)
>   		goto cleanup;
>   
> @@ -104,7 +104,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>   		goto cleanup;
>   	}
>   
> -	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
> +					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
>   	if (ret)
>   		goto cleanup;
>   
> @@ -120,7 +121,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>   			goto cleanup;
>   		}
>   
> -		ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
> +		ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
>   						amdgpu_dm_supported_shaper_tfs,
>   						DRM_COLOROP_FLAG_ALLOW_BYPASS);
>   		if (ret)
> @@ -137,7 +138,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>   			goto cleanup;
>   		}
>   
> -		ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
> +		ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, NULL,
> +							MAX_COLOR_LUT_ENTRIES,
>   							DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>   							DRM_COLOROP_FLAG_ALLOW_BYPASS);
>   		if (ret)
> @@ -154,7 +156,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>   			goto cleanup;
>   		}
>   
> -		ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, LUT3D_SIZE,
> +		ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, NULL, LUT3D_SIZE,
>   					DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>   					DRM_COLOROP_FLAG_ALLOW_BYPASS);
>   		if (ret)
> @@ -172,7 +174,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>   		goto cleanup;
>   	}
>   
> -	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
> +	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
>   					      amdgpu_dm_supported_blnd_tfs,
>   					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
>   	if (ret)
> @@ -189,7 +191,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>   		goto cleanup;
>   	}
>   
> -	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
> +	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, NULL, MAX_COLOR_LUT_ENTRIES,
>   						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>   						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
>   	if (ret)
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index 44eb823585d2..efe61bdd9b24 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -93,7 +93,8 @@ static const struct drm_prop_enum_list drm_colorop_lut3d_interpolation_list[] =
>   /* Init Helpers */
>   
>   static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
> -				  struct drm_plane *plane, enum drm_colorop_type type,
> +				  struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
> +				  enum drm_colorop_type type,
>   				  uint32_t flags)
>   {
>   	struct drm_mode_config *config = &dev->mode_config;
> @@ -109,6 +110,7 @@ static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *co
>   	colorop->type = type;
>   	colorop->plane = plane;
>   	colorop->next = NULL;
> +	colorop->funcs = funcs;
>   
>   	list_add_tail(&colorop->head, &config->colorop_list);
>   	colorop->index = config->num_colorop++;
> @@ -203,6 +205,7 @@ EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
>    * @dev: DRM device
>    * @colorop: The drm_colorop object to initialize
>    * @plane: The associated drm_plane
> + * @funcs: control functions for the new colorop
>    * @supported_tfs: A bitfield of supported drm_plane_colorop_curve_1d_init enum values,
>    *                 created using BIT(curve_type) and combined with the OR '|'
>    *                 operator.
> @@ -210,7 +213,8 @@ EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
>    * @return zero on success, -E value on failure
>    */
>   int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
> -				    struct drm_plane *plane, u64 supported_tfs, uint32_t flags)
> +				    struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
> +				    u64 supported_tfs, uint32_t flags)
>   {
>   	struct drm_prop_enum_list enum_list[DRM_COLOROP_1D_CURVE_COUNT];
>   	int i, len;
> @@ -231,7 +235,7 @@ int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *
>   		return -EINVAL;
>   	}
>   
> -	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_CURVE, flags);
> +	ret = drm_plane_colorop_init(dev, colorop, plane, funcs, DRM_COLOROP_1D_CURVE, flags);
>   	if (ret)
>   		return ret;
>   
> @@ -288,20 +292,23 @@ static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_color
>    * @dev: DRM device
>    * @colorop: The drm_colorop object to initialize
>    * @plane: The associated drm_plane
> + * @funcs: control functions for new colorop
>    * @lut_size: LUT size supported by driver
>    * @interpolation: 1D LUT interpolation type
>    * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
>    * @return zero on success, -E value on failure
>    */
>   int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
> -					struct drm_plane *plane, uint32_t lut_size,
> +					struct drm_plane *plane,
> +					const struct drm_colorop_funcs *funcs,
> +					uint32_t lut_size,
>   					enum drm_colorop_lut1d_interpolation_type interpolation,
>   					uint32_t flags)
>   {
>   	struct drm_property *prop;
>   	int ret;
>   
> -	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LUT, flags);
> +	ret = drm_plane_colorop_init(dev, colorop, plane, funcs, DRM_COLOROP_1D_LUT, flags);
>   	if (ret)
>   		return ret;
>   
> @@ -339,11 +346,12 @@ int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_color
>   EXPORT_SYMBOL(drm_plane_colorop_curve_1d_lut_init);
>   
>   int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
> -				   struct drm_plane *plane, uint32_t flags)
> +				   struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
> +				   uint32_t flags)
>   {
>   	int ret;
>   
> -	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_CTM_3X4, flags);
> +	ret = drm_plane_colorop_init(dev, colorop, plane, funcs, DRM_COLOROP_CTM_3X4, flags);
>   	if (ret)
>   		return ret;
>   
> @@ -363,16 +371,18 @@ EXPORT_SYMBOL(drm_plane_colorop_ctm_3x4_init);
>    * @dev: DRM device
>    * @colorop: The drm_colorop object to initialize
>    * @plane: The associated drm_plane
> + * @funcs: control functions for the new colorop
>    * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
>    * @return zero on success, -E value on failure
>    */
>   int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
> -				struct drm_plane *plane, uint32_t flags)
> +				struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
> +				uint32_t flags)
>   {
>   	struct drm_property *prop;
>   	int ret;
>   
> -	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_MULTIPLIER, flags);
> +	ret = drm_plane_colorop_init(dev, colorop, plane, funcs, DRM_COLOROP_MULTIPLIER, flags);
>   	if (ret)
>   		return ret;
>   
> @@ -391,6 +401,7 @@ EXPORT_SYMBOL(drm_plane_colorop_mult_init);
>   
>   int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *colorop,
>   				 struct drm_plane *plane,
> +				 const struct drm_colorop_funcs *funcs,
>   				 uint32_t lut_size,
>   				 enum drm_colorop_lut3d_interpolation_type interpolation,
>   				 uint32_t flags)
> @@ -398,7 +409,7 @@ int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *col
>   	struct drm_property *prop;
>   	int ret;
>   
> -	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_3D_LUT, flags);
> +	ret = drm_plane_colorop_init(dev, colorop, plane, funcs, DRM_COLOROP_3D_LUT, flags);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> index 04af552b3648..d3d73d60727c 100644
> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> @@ -25,7 +25,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
>   
>   	colorop = intel_colorop_create(INTEL_PLANE_CB_PRE_CSC_LUT);
>   
> -	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
> +	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane, NULL,
>   						  PLANE_DEGAMMA_SIZE,
>   						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>   						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
> @@ -39,7 +39,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
>   	prev_op = &colorop->base;
>   
>   	colorop = intel_colorop_create(INTEL_PLANE_CB_CSC);
> -	ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
> +	ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane, NULL,
>   					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
>   	if (ret)
>   		return ret;
> @@ -52,7 +52,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
>   	    plane->type == DRM_PLANE_TYPE_PRIMARY) {
>   		colorop = intel_colorop_create(INTEL_PLANE_CB_3DLUT);
>   
> -		ret = drm_plane_colorop_3dlut_init(dev, &colorop->base, plane, 17,
> +		ret = drm_plane_colorop_3dlut_init(dev, &colorop->base, plane, NULL, 17,
>   						   DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>   						   true);
>   		if (ret)
> @@ -64,7 +64,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
>   	}
>   
>   	colorop = intel_colorop_create(INTEL_PLANE_CB_POST_CSC_LUT);
> -	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
> +	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane, NULL,
>   						  PLANE_GAMMA_SIZE,
>   						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>   						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
> diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
> index d03a1f2e9c41..9e9dd0494628 100644
> --- a/drivers/gpu/drm/vkms/vkms_colorop.c
> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
> @@ -31,7 +31,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>   		goto cleanup;
>   	}
>   
> -	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs,
> +	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL, supported_tfs,
>   					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
>   	if (ret)
>   		goto cleanup;
> @@ -48,7 +48,8 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>   		goto cleanup;
>   	}
>   
> -	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
> +					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
>   	if (ret)
>   		goto cleanup;
>   
> @@ -64,7 +65,8 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>   		goto cleanup;
>   	}
>   
> -	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
> +					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
>   	if (ret)
>   		goto cleanup;
>   
> @@ -80,7 +82,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>   		goto cleanup;
>   	}
>   
> -	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs,
> +	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL, supported_tfs,
>   					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
>   	if (ret)
>   		goto cleanup;
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index a3a32f9f918c..45d1b1d3faf9 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -187,6 +187,19 @@ struct drm_colorop_state {
>   	struct drm_atomic_state *state;
>   };
>   
> +/**
> + * struct drm_colorop_funcs - driver colorop control functions
> + */
> +struct drm_colorop_funcs {
> +	/**
> +	 * @destroy:
> +	 *
> +	 * Clean up colorop resources. This is called at driver unload time
> +	 * through drm_mode_config_cleanup()
> +	 */
> +	void (*destroy)(struct drm_colorop *colorop);
> +};
> +
>   /**
>    * struct drm_colorop - DRM color operation control structure
>    *
> @@ -362,6 +375,8 @@ struct drm_colorop {
>   	 */
>   	struct drm_property *next_property;
>   
> +	/** @funcs: colorop control functions */
> +	const struct drm_colorop_funcs *funcs;
>   };
>   
>   #define obj_to_colorop(x) container_of(x, struct drm_colorop, base)
> @@ -390,17 +405,22 @@ void drm_colorop_pipeline_destroy(struct drm_device *dev);
>   void drm_colorop_cleanup(struct drm_colorop *colorop);
>   
>   int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
> -				    struct drm_plane *plane, u64 supported_tfs, uint32_t flags);
> +				    struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
> +				    u64 supported_tfs, uint32_t flags);
>   int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
> -					struct drm_plane *plane, uint32_t lut_size,
> +					struct drm_plane *plane,
> +					const struct drm_colorop_funcs *funcs,
> +					uint32_t lut_size,
>   					enum drm_colorop_lut1d_interpolation_type interpolation,
>   					uint32_t flags);
>   int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
> -				   struct drm_plane *plane, uint32_t flags);
> +				   struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
> +				   uint32_t flags);
>   int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
> -				struct drm_plane *plane, uint32_t flags);
> +				struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
> +				uint32_t flags);
>   int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *colorop,
> -				 struct drm_plane *plane,
> +				 struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
>   				 uint32_t lut_size,
>   				 enum drm_colorop_lut3d_interpolation_type interpolation,
>   				 uint32_t flags);

