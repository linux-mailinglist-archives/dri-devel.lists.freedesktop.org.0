Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDC0A99F37
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 05:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA6410E710;
	Thu, 24 Apr 2025 03:06:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mTmClR0b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA6210E710;
 Thu, 24 Apr 2025 03:06:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QDyNoxIg8vd6HRXaXCS/hKu/Z0VM3gYqwx2QRD943u8Ns11E/rq1ONVSN7YuWyzb8eSL3ECXgJdWVZnFusgWpza5QDECpo7NeNACpkz5cqP2vQ7Zk5RxjnZzgvu/7rHZj97J/q3BxiClr9VxUlj8jQ9+v4MAYEHwSlDjHFH1v26Cf1m6PS93w9yR4BHYCYb+lUMCxh76W1H67L8hhrNY9nwkMTIPvXHsQUUv/Cp0AmgMKpJDeEUwAroBNz6touJGa6VfmdhHgKh4zih0gb3anv76/ee3xo+zYrTA5NQGgzxOASnSEsJ3S3N13GhZbxsk0+ae2i9zPu/ZS6PECmVvUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lA076WNq8k8azTqZi7LCtloxbap6Eu6zLLI/OsPaJ3U=;
 b=TOvv+1arKCFmRexBnhPxk6e6R+5PkrSsoIuYDNTy9jw/Vpx87aZ4b3E+af0+z40SCcIS6c81nfXO7aNLb0nU3iH/F2Rk7Ex0Uw3hiaQzN9D0S9+AcccFAOsJTmZilJrAm/T1bgSu2uhmw/w94nVkegHFUdGYMiBJSvny878ffEAXUNpxtSyVheddVVmBs2zSyqXbXA0rbAH6chCvZ+IR1TNcqzqaRbEkz2BWd+NQuFkjfaPJcF+DmCzM0aFfbyRDcZkO6ifbHMfHAVnLJ+wACI8f/XPPq35JEzXuWy6Mz8Sd5bZmqmWDPG4UxaYLrzT+dbSiSYwng9TWz3JZuSbJTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lA076WNq8k8azTqZi7LCtloxbap6Eu6zLLI/OsPaJ3U=;
 b=mTmClR0bG7DJw88oU/KolkmlYPhdQOqLDMo6+Rc7CYhk9IQnJPlJ28bPRJFLSYBvqL015GelsY3n5Arf5sbW4W3df2MRsWI5WDr+FZC12AjK2ZbfgSF4LATIFlz7p6NVV5Aagh4fCWP0C3QjD924I7LTGufZH54UEY783EOZmz6TfO1WOEZsrEcvRAKEzqEvvRuwBh/T9vqddMnkLrhq+ve/YysgQy3p8CqSpcFeKYbi6KQeR+aRIzDNebiZ3BwOtb3ZUld8KIXOLwnmIOx3B82vzP+pNog134y0nTTDGS5nSkz3oxK8Gy9xVGLJ0tDvtZn/xkq/GL+CqM7xSAh+dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SA5PPF590085732.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8ca) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Thu, 24 Apr
 2025 03:06:36 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%6]) with mapi id 15.20.8655.033; Thu, 24 Apr 2025
 03:06:36 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "John Hubbard" <jhubbard@nvidia.com>,
 "Shirish Baskaran" <sbaskaran@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Ben Skeggs" <bskeggs@nvidia.com>
Subject: Re: [5/6] gpu: nova-core: Clarify fields in FalconAppifHdrV1
Date: Thu, 24 Apr 2025 03:06:33 -0000
Message-ID: <174546399398.876.3516508778193165894@patchwork.local>
In-Reply-To: <D9EH1WXQOIO7.3RHFKYSFPBXE4@nvidia.com>
References: <D9EH1WXQOIO7.3RHFKYSFPBXE4@nvidia.com>
Content-Type: text/plain; charset=utf-8
X-ClientProxiedBy: BN9PR03CA0117.namprd03.prod.outlook.com
 (2603:10b6:408:fd::32) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SA5PPF590085732:EE_
X-MS-Office365-Filtering-Correlation-Id: df909dfd-2fd8-48a4-3983-08dd82dd0623
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjBpM3U2NkJxNU4wM3VjaGc4STFqTkJMWHZxazkwTkNuSUw5WXEzb1dlRVBr?=
 =?utf-8?B?T05qeHhsRHd4UzBHVUpqZGE5Y0N3VnNPTE15NGVhZ0J6R3doZTMvVDdJUGZ4?=
 =?utf-8?B?bUVsRHU2bXJlREozZWt0VkROMlpsU3QyOXpEZW00UGR2UTBwa1dzNEwvdm9G?=
 =?utf-8?B?ZDErWFV0VzNESy85RG1oWXR4L1BCYitmZmRmWUdWWVhXR2VMZmRCOXpFTnVG?=
 =?utf-8?B?eEFHUXp6elc5elU3UW5jZ3JDbWdpeVlGUUJQM2NlaHBtR2VSdlNPbmxSRWZG?=
 =?utf-8?B?SXhUQTM5SnVNTW15czNva1ozVnJqQnlwcFdlckpqNEtTM0lQWVFOZW42U3ZS?=
 =?utf-8?B?eFhXSk5pcDc1bThobE96RHZnOHhkc0dZaFA3NUNrSFV3RVNtQnFRZzcrZk1H?=
 =?utf-8?B?bmVLNTVnQVRzMlRkV0lPUVV2eEk2NExHVTVhOTNXWXF5S21paG0yYnNKVFBJ?=
 =?utf-8?B?K3dpL0ZvQzhtaUxsaS9zNElxRGFyKzNHZ0poUVVSUG1PUDdYM0dkOWJISlRU?=
 =?utf-8?B?S0dldyt0WGdmZ05GajRoNTJnQWdmZGc0aWl5dStzOEdLZG1HOG9jeEpJRzZV?=
 =?utf-8?B?Y0E5cDMzb3lzWXdNcE1qM2l1RFZhb0ZOcEJXWnlqbElOOVMrc0dtL3J5NU8r?=
 =?utf-8?B?NWJCOHlDVEVwNTRxNVVvSnJhd3NRZUIydmRRYlpxbkhDVWEwK2VqdzUxTFVw?=
 =?utf-8?B?V2U1bUtnM055ZHYwd0F4bE5rVjN5c3FCei82c1N2UlJSWUFwR0xCaW1SaGkz?=
 =?utf-8?B?VkRzVmdwdWdZMUs1VW0yMG10djc3c0t1RWNhSU9wTDJpT0ZJcWYvTHQ4ekMz?=
 =?utf-8?B?Wm0vb0t0T2k3ZUxtYjgvZDdZZXREZVlRaTN5RDZZdTBUL0g1MUhkMy8zYUUx?=
 =?utf-8?B?YkpIVTd3dURhZFRmMzBmY0Q5MnZuL0NZNmFYL2xYZnlkWTZjQTJ5WDBFcERH?=
 =?utf-8?B?OEM0U1I2am5ybWp5ajZ5UWNFdkJwL0JxNmlkZXNTT0xGS2hwaFhHVHQ3dSsy?=
 =?utf-8?B?VVdpSWdDNUFYOGJZNmJpc0QxTXBkTFV4SGF3dEFUR2h4K3g4ZTcwUWpCK3hN?=
 =?utf-8?B?SDZET25wK1dpU2lEOHU2anVKSDEvVW40YTJtRC8xTWJZSTlTL25xZFphamNG?=
 =?utf-8?B?UmxoRm01aGVjczRGaC8rNkxKakdRTVo1THlIVHJIcFRmQXFCOHByREdSZFpi?=
 =?utf-8?B?RnRBOWtqWWo2anF5NERpZUxVeWdNbjZLWkd0K3RyUXFGdzJmM1owUXIyejQ4?=
 =?utf-8?B?YkVUV0tuQ2Q0RXdMbFFaUTNyeE5aYmYxRVRoNzk4RWIrMlpndHV4dC9iZTZE?=
 =?utf-8?B?YjJvMFIyQzVSSXowbHg1SzhNQUMxdlZad1JxWjdlVXBWeUwzZUFTcytLd1VV?=
 =?utf-8?B?TjJ3YUIrMUNNVGdWdFFlUXhKU0Fndmc4VmQrRXZJS3ZYbFV4RzUwZ0NSVVVa?=
 =?utf-8?B?RVBHUXNUMnpDTVUvQU55ZmJRVldpRDlNWkMxaDAranlweS9Va0h2aWhnb0JX?=
 =?utf-8?B?Mi9ubVhuQThHN1NXeEFSeEZ3ODIwc3F1UVlSVTI0YVloN0ZvRUx6MHQyRjdp?=
 =?utf-8?B?ZFNVSmpPaHFYYmF4RlR6cStwYmZJb24rR1ZVNEJIUFpybk80b0xxeWFzYmdm?=
 =?utf-8?B?Q3FUWW01dmIvM25YU2c5VzVydWY3THZMTGs3eEhaQVFUdmN3dXVSWkJVV2tr?=
 =?utf-8?B?QXlKOVpld2FBdlEzVjF4Z0VpUnhRQkJKdVQxUHN3QnlzcHl5UUFXbmR5a2h2?=
 =?utf-8?B?cXJaMFgzeFlsMmhQQThFNWpDTTdFanR2VHhsaDdHejJEY1JSYzhVUW0xMWlM?=
 =?utf-8?B?U1hBbjY0NXlmRE43ZUE3RUFLNHdvWDJEQmJHVmhoY3B1MG50aDloZEZpTnVB?=
 =?utf-8?B?ZmNRQXJKUUhDWWk5TWZ1RnlDNTFqSE5aaFc5Tk5UTkdNeHZDK01FeEZ2RVJ6?=
 =?utf-8?Q?UDiA91FjsTI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjkzT0ppYmZDc29MUFZOME9qTHRrU010Mys2RGExUmVjT1dDMGk5N3lLaTc3?=
 =?utf-8?B?MFhwazVDcGs1amtYTnNYVnlnSVcybWpWLzdpam5TNXZhSDJ5d0JoODFKbXFI?=
 =?utf-8?B?SXFFNFAyTFlEM2JLbVN5cHlFMklPKzJSOVp2cXhjWEZWdGIvcnBiOFBINGJ3?=
 =?utf-8?B?akFWMnVzM1BXdjR1emkyWlFBamM5WVJ2WjJrU01WYWNMVGFQZ3kyQ0l5TkRB?=
 =?utf-8?B?WVR6b2xYdGZOemVRTzlaRzd0TExpSjN4cGYxNE1XMzZsWFJuWnVhOEF2MFp6?=
 =?utf-8?B?aWlLL3cxL0dvVGxZeWVOc1huSEhHRm1nV1M1aE81QkZIQzJMYU5qYnZiWmpH?=
 =?utf-8?B?L3RlN1piNzR2SGpGOGh3cGk2dld0TVY2OXZFcG1XeUlXTkpYWlhGQ3pidkdV?=
 =?utf-8?B?TDltMVA0ZXpaRmdtWEk4eXFBemxNK0pJeVJsRzNReXdNNko2QWNFRUt6QW9x?=
 =?utf-8?B?YUxXRDFhR1BESjNaRWh3Y2hGcDNLSDdOd1JtRVpoZkQwd1FDWWY2L2d1b2Vx?=
 =?utf-8?B?bS9QN3Z3c1pkb1pqQklvaWtjOEV0TTk1ZkNGeFZEME1EWmtvaDdpVFFBSmlr?=
 =?utf-8?B?UmdCRkk0S1FlcEd6V3dxc1owZjgyNjhiK0ZYWElMZnpSRFl5Tk5HQ1pZV3A0?=
 =?utf-8?B?VEdhSmQrSWdJdVh0MDJIR1h5M3JNODhrd0krbGJUWkZDUm5NdjJLd3V3a2dZ?=
 =?utf-8?B?WjNOd0RLYWVqSll0U2tVais2Tm9rZ0Yra1o4M3ZPaVdUblJIRmhXR1IzdXR6?=
 =?utf-8?B?d1dKMEl1azYxRGVWajArRVVKWVdtR2pTNER2dkZncVloTkloSG9zdTI0S3Qw?=
 =?utf-8?B?OXFIaDJtcytjV3ZWRHEvUFZBTzJ0ZlJQWEoyaHJ3ZEl6SUdzR2sxeDJSOGE2?=
 =?utf-8?B?M250L2RwcEViS1hCWC9mZTQ2ZDA1TVJMQmFkalFKR3h6VHovUHVLUjNBUyth?=
 =?utf-8?B?SnVVMExmKzNNV1FIa1pCckk0M0dYWktoRzVuZ3RnSVVNYUp1TlRONHJzS3Jq?=
 =?utf-8?B?RWNLeldFVlFMOXNLNEJlK2VxNUlhVmtIcklTSFFPdnJmUjRKdHkzdUpxMU5D?=
 =?utf-8?B?bDdodVRuNC85ZDQ2LzljVGxOZjdTbjlsdXozb09sdXRmdXJBd29DYlhGVkd6?=
 =?utf-8?B?bnAxWWdzYktXYXRGZFgvcXU3SHVDTmxJZlZxZERZbEZBc1Jhalh1Z0RCUk1D?=
 =?utf-8?B?ZTVLMzE0VitNd1hjM094UXFpT20yVDliaEx0bFVJWlRBTXBac21qN3hjVEcr?=
 =?utf-8?B?a0JPcm1zZlVvRTJSOHExOWNNUnMzZEFrbDVFenVUbFNRaXM4a2g3Ump2TUFx?=
 =?utf-8?B?MVNlMUs3YUpvRUNMQ0RlMlg1clNqbHF1anhVYXV3THpYbHpvN09ta2VsUjRD?=
 =?utf-8?B?SzJXWTMza3cvbThjcGtJVzk1MjdxWlJEUEVpNWxKMEZIaFFJZ1ByMkhPeFFT?=
 =?utf-8?B?bHl4VWdnRkpmUHgrZTFrZTIzSmFFSzhHYVNLMGIzOGdBQUhSRUxXbldmd3F2?=
 =?utf-8?B?bWUvQXE4Y0pNR1lTcEZOc0VFUGVvVzJWQ0V5N2g5bitaU2RrU01UQ3NERUhI?=
 =?utf-8?B?R25adzRJb0xKckxYWjZZN05xVlZPSnRxSHBXSDM0SWdwY202K0pibWE4dTVG?=
 =?utf-8?B?dzlLNnBxOEFLYStMR3ZZemxaZlUrTHdsR21vY1FSbEthQ2FhZEFuY29RYmc0?=
 =?utf-8?B?eU1yMUNId1pRbXJnUDRHSjdyUWI2ZXRJRHNzTUk3Z0VnUk92Q3o5cU1Jbjkx?=
 =?utf-8?B?N2x1b0lkUklEZitkQml0MGVvTWZxTHRjRUlYSG9XUHkxSUVRb0R0T1liRWZj?=
 =?utf-8?B?NjJ3TU5UQWhlY1NxdE1hMVB5aGtCelFUOTJUcUd0cHVlREVyTDRCSmFSdUlv?=
 =?utf-8?B?VlNVL1NEZUNzU2J0c0VHaUoyWVFjTnM4TTFkZ3lJTDZUY0xMbXh0VE5CS3FZ?=
 =?utf-8?B?UGltWUdSSkNQbmZQMHlDb1JEMHRCZDlhajdmQWVGVHZQOXdPYlZ3SklFODBw?=
 =?utf-8?B?ODVMUVo2Q3NVWERwWTc5eDlyT3RPUkZVQ3I3LzBVdTR5alBPUHQrU1dKaFFO?=
 =?utf-8?B?SjJqSmF5OHhvTXJya3dLWExaR3J6N3FjMVBzblJOUFhuZ0VPanorMTBaRE50?=
 =?utf-8?Q?m8G42z6R1EMJbEoqo8Fj6jtvn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df909dfd-2fd8-48a4-3983-08dd82dd0623
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 03:06:36.0106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pfu3dKeZsShPIKAZV628P4zBWG+F6tc2/Y7Ore3XZBSoh++/VF2NTbVuZhgjMGKsJw8XcEmGTFEGc6TsK1+PRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF590085732
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

On April 24, 2025, 1:18 a.m. UTC 
Alexandre Courbot wrote:
> Since this just renames fields, would you be ok if I squashed this one
> into the relevant patch of my series, alongside a
> 
> [joelagnelf@nvidia.com: give better names to FalconAppifHdrV1's fields]
> 
> ?

Yes, sounds good to me. Thanks!

 - Joel



> 
> On Thu Apr 24, 2025 at 7:54 AM JST, Joel Fernandes wrote:
> > Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> > ---
> >  drivers/gpu/nova-core/firmware/fwsec.rs | 17 ++++++++++-------
> >  1 file changed, 10 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
> > index 664319d1d31c..79c21db9d89d 100644
> > --- a/drivers/gpu/nova-core/firmware/fwsec.rs
> > +++ b/drivers/gpu/nova-core/firmware/fwsec.rs
> > @@ -29,11 +29,14 @@
> >  
> >  #[repr(C)]
> >  #[derive(Debug)]
> > +
> > +/// The header of the Application Interface table, used
> > +/// to locate the DMEMMAPPER section in the DMEM (see fwsec.rst).
> >  struct FalconAppifHdrV1 {
> > -    ver: u8,
> > -    hdr: u8,
> > -    len: u8,
> > -    cnt: u8,
> > +    version: u8,
> > +    header_size: u8,
> > +    entry_size: u8,
> > +    entry_count: u8,
> >  }
> >  // SAFETY: any byte sequence is valid for this struct.
> >  unsafe impl FromBytes for FalconAppifHdrV1 {}
> > @@ -169,14 +172,14 @@ fn patch_command(fw: &mut DmaObject, v3_desc: &FalconUCodeDescV3, cmd: FwsecComm
> >      let hdr_offset = (v3_desc.imem_load_size + v3_desc.interface_offset) as usize;
> >      let hdr: &FalconAppifHdrV1 = unsafe { transmute(fw, hdr_offset) }?;
> >  
> > -    if hdr.ver != 1 {
> > +    if hdr.version != 1 {
> >          return Err(EINVAL);
> >      }
> >  
> >      // Find the DMEM mapper section in the firmware.
> > -    for i in 0..hdr.cnt as usize {
> > +    for i in 0..hdr.entry_count as usize {
> >          let app: &FalconAppifV1 =
> > -            unsafe { transmute(fw, hdr_offset + hdr.hdr as usize + i * hdr.len as usize) }?;
> > +            unsafe { transmute(fw, hdr_offset + hdr.header_size as usize + i * hdr.entry_size as usize) }?;
> >  
> >          if app.id != NVFW_FALCON_APPIF_ID_DMEMMAPPER {
> >              continue;
>
