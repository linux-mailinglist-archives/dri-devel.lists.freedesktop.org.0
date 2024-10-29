Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ADC9B4AC1
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 14:18:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87A010E64B;
	Tue, 29 Oct 2024 13:18:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NqK7FGCL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E1410E64B;
 Tue, 29 Oct 2024 13:18:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NDf6VShFG/EMTWNEtYwDzPRqRv7XOCmE7ZCbLunxYDKLq1u+Enu9Uzt0Uqby52/+4P8R77P8IjOR/nnF3E+bRaAhJDsnnnhVomIc9coKA7A1JBzHrm3EV5Dh0bjRwKWlsDSj+v0djKALTPb5IPGxsNpLeUxDq1YEO+fp3JTqnISQisbQ5xNw6dEoEwICUzbuM+oZDNl1BTll0OKvL8YQy/O+djz5D6bVCHcOZ2RDt+HCOU64ZIS7WqJ3xULQG5hjJD5O565nOaejQc4M+84MiJkpOr0SflgW017Uf7aSfN9A3qGdEl6iQV+9rlLLBgJ+BLufWoBY+SjaMO7Vp6OvyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLDEyt73k555qbz38MXyfZEcnxtzuc8fC7eUIMPHtmQ=;
 b=dlppzlrw936w20wA1OAasXK9b/CTrpqU9AefjA6aTiTf+Ojv6ITDmLckfyoqLJK5RnO1/sOgOnv3HS7zcpseaksq1++SbFeuEhZt7+4XSFUY0yhF73tF6OEa1QPA732CHAH73GOeW9nkDbpT/tDbqQEjoWBGHqbM0kGE1IzObDnS04MKAhHVOxCb0q5cHZYIr8/XGXGgleLKCQc9noqobxDFDW7ZHE9b6d0GO0bu5WkAfVnOVUMsK7uIEv3gSw8XKDW4VnN+hg4LwY6aWzDZWqufCEYL14Xx8LGvUcLi6jZfvVHaOyzKKICyyNYC6C7Zi3BcaIXXHbmvKYAAJYNhxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLDEyt73k555qbz38MXyfZEcnxtzuc8fC7eUIMPHtmQ=;
 b=NqK7FGCLczos9I/QEPjedLhX1nrXeb/lvSNaZn4kh4nQwTc4vkIQeW2U/DQ8rhlkpW5xzwjiUaucX9IB0TelSyFI2B2QbqSwFZ6qhfM9h46R47FbYrM1klygbZzwhNHUH8EKDHlUQXEnbH5rZhudRQ3sIId6bQNrt3R4YNxXGBM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB7199.namprd12.prod.outlook.com (2603:10b6:806:2bc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 29 Oct
 2024 13:18:40 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8093.021; Tue, 29 Oct 2024
 13:18:39 +0000
Message-ID: <bc5473f8-1c40-4e50-bf8b-43233b3d53a5@amd.com>
Date: Tue, 29 Oct 2024 14:18:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] PCI: Add a helper to identify IOV resources
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 linux-pci@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kw@linux.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matt Roper <matthew.d.roper@intel.com>
References: <20241025215038.3125626-1-michal.winiarski@intel.com>
 <20241025215038.3125626-3-michal.winiarski@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241025215038.3125626-3-michal.winiarski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB7199:EE_
X-MS-Office365-Filtering-Correlation-Id: 765504b8-69dd-4887-a889-08dcf81c3411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3NaVG5HVUVFUlI4TWZteDkrYUZRSTlaMFhnc3B1bU0wVG5XUGY5dWMyM0NU?=
 =?utf-8?B?M2JRZXV6MEs3R3pPY0hCVDZyZ3RiRjRpUHhWTWozajNmc0NFRElDY1hDVTRn?=
 =?utf-8?B?d2toTHNzazI0am1KbTI2ZmdQMkZwRWRnaEpUVkZTSFI2T0tYT3N1YTNrSzNv?=
 =?utf-8?B?ZmFkWXdRNHMvdExGdWxrTkJSR1NtVlR4aXo2by9ndWYzNkhZQjd1QmhzYTRS?=
 =?utf-8?B?MERjQ1FuK3lLb1hGM3d4WlBSRVVYR2FGZUxqb0NaVGJUTWJScmlqejkyaTgy?=
 =?utf-8?B?ZTZyTXh1YnZ1RTIwQTd5Z1BKeEtvRFFGMC9wUGU2MWpOMGxDY04zQ2lvQzBr?=
 =?utf-8?B?cFdzeEgyUDd2eXpQYmx1UVFVWXpxZmlBMXBXSzBVTjNjRk0zUHl4akF4Smll?=
 =?utf-8?B?TnRiVWFVc05xZ1BYOW5welc5Z1E0VnNjOVo2V2FkU0ZzS3RtZDFlTXdjRDVH?=
 =?utf-8?B?alBoWWRsVklYU2tValZMc3MvOGNmanZEaDdDREJJbTQ3cTJ6djNLOGJqMy91?=
 =?utf-8?B?QWJWZnBVNUc1elRKSVo2Q0p1VlRpMmlORVROTXFzQ1p0eXJrSjV5Y29lSmxz?=
 =?utf-8?B?T0hkQ29ucTBucG5LVEZxbXpKQjBlVXk3MXBqQXgybjRaVWhHNVdBcjV6QzJa?=
 =?utf-8?B?ZVNyS2ZON2Fzc1lmbUdGN05RbG9Nb2JFYXUwR0lnUzZCcnZ1ZVJDbFRKcy9q?=
 =?utf-8?B?YlBZdlVjUjY1S3JCMjlWeDdoeXVCejRSSDJXbzJFR0pEUU9KR3hDNktYNHM1?=
 =?utf-8?B?SkZXQm9nM1YxdytmcmxQc1NqSGVCaWlPZXV6RXY3YVA4WXMyT1Z4Mlh4SHly?=
 =?utf-8?B?TzcyNytXTUd3VllqLzF5Q0JYT2poaWY0L0wwSk85SkhVSUg0MFlOOHRaQ0hh?=
 =?utf-8?B?TStsL2xCbG9zZ1FLVUE5Y243ckxoNWp2UWliY3l4UkRLbGJ3Uko0MWJhcVRp?=
 =?utf-8?B?RmxSYUNQRFEzTTRTN0EzYTFOSlBGbHJ2cWh6RTdYVFU2dExoamIzMnNFNkdX?=
 =?utf-8?B?T2FwblRERGxSa0Z3d3ZJbU91aXZaZVV2eVRWQTFNaXV6djE3bnUycE5QZmx0?=
 =?utf-8?B?MXZLYWZoZ1c4SGZvcFpHTmd5UktYWEY2VUlwajZ6Y1NaYWFzRktyUkpNN3ZT?=
 =?utf-8?B?ckJHcDNPSmhidDJmNHgrM1BBVWNLYVlhTXFTeHUybGtYdUE5TWlRcStpQ0Y5?=
 =?utf-8?B?Y2xjR1V1cHRaR0V2ZkZPNEV2L3FHRkM5QmpBY1gvSGh6ZG1lSmpaUy84NWNT?=
 =?utf-8?B?YVFSckpOdXB0M3R1K3h5d2JDaEtsMy9tMENZOC9hTVBxTHRhNDVnNE9QY0s5?=
 =?utf-8?B?by9SdkJwdDFUSTdVL2ppcjR1WmxXNHQ4K3FNeWgwd1BMU1lLNFI2VjVrRjRs?=
 =?utf-8?B?MXJ4dmp6aEplTWJOZ1BnWk5Ha2dRNU1pZ0tWMWVja3dRQ3dUS2hsUFo5U3k0?=
 =?utf-8?B?STd4WmZKZ0IrTjJSVlRzMU4xZXhKeVY1ajhPOW9tQ2szbDc5dkNNS3BmbVhN?=
 =?utf-8?B?WWNSVG93azBmWjdqRU5mdmcrYTR5aGpxdVNTYUVoc1RuRnMxRGJGS2xNWHcz?=
 =?utf-8?B?dklHVzUxRHYvcXdOZUNEQWF2YnZReUswR1R3ZTdEWnJwcmVlTVoyVGpyYXFq?=
 =?utf-8?B?Wms0QnBkU2VoTXNuYmRmcjBwNTJreW5Ec2VSaGtUMEJEUmRZZWd1L1pMY3BV?=
 =?utf-8?B?c1FWTFlkZkZYSlZ0SmdrSkNFVyt6WkdaYTJzNFlmdEw5WXhJQ3J5QUJabCtC?=
 =?utf-8?Q?jac4ywinL8L5VF7bsR3SRGCv1Tk2KZibpVZW8Pa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eExObFBsUE93aFkyNFkrcXB0dkhNUEVzbm01bURZc3NnQ2V4dXptN2JaUzJv?=
 =?utf-8?B?Rkc1VmRpWTNqcDRDcWE2WEJpdCtuVlBKdUwwV2dyRWs5dXBxUEZkYXowdytO?=
 =?utf-8?B?WkVYVzF5TmlwdkZ2OHhaQVhEblVZOVk0cVByMkhWNGE5YldwMnh6a1Jra0o4?=
 =?utf-8?B?MVYwcXVUY21paUJJN3YwVThQUHR2Ulh3MHB2OVBSSkxnM2h2dXVxVzNPby80?=
 =?utf-8?B?TFlwMmZSb1Rla1ZIcUh1cGFjSlJZdHVGMG5Jak04Vk5STXFvMnRPN2FvSU1j?=
 =?utf-8?B?ajdEYnN4T3Zub2ZRK2haVGJCUm01enhXQXU4Sm9UWk1NaGZmeXd5djAwMmNh?=
 =?utf-8?B?Z1UxRU1OY2xlWWFyV2wxVWJoUjdWUE54cTRpYXJKQ214RERaeS9WM00ydS9T?=
 =?utf-8?B?VU9oTWpaaU1vTEdBNUk2RnlxdXd3cVpZdGlWdE14MHNKVENiUkViQlNSQWxW?=
 =?utf-8?B?bGpmcDF5U1E3M3ZxcWc5NVJvZFQvaEp5ak90d045UVJOY012WExWNnFvWTZx?=
 =?utf-8?B?T1BqRWpac1RoNG5ydmlTQnBVMGdBbkdhbk5od1I2UmdKaE8vYWtHMXE5ZWR2?=
 =?utf-8?B?dnBmQmQ5Nmo5UGhTaXdzQ05kUnNpQ1dGOU4wTXlhN2laWGx3QVdlQ1dCT3kx?=
 =?utf-8?B?YmR2K1kvVTNuUGNrRXIrbDhWaGZFWEpRM3JnMHVaSzBIVDUxNDFTVFBISEto?=
 =?utf-8?B?V1hCQW45bFRib25obVlIN3h2bXh0dlMwdnZRZm1UaW1vNWFKcTZLMVFTcE54?=
 =?utf-8?B?QjhJajRiN1FqSTZIQmZRYXFiT1g0U3lOOXY3ZnAvNXAxcDhHazd5RUErb0Nk?=
 =?utf-8?B?ZldjSnE0ZlljZnI0cHF1Vmg0RDNBejFSUjBxb3NoQThrV093MzhKL2JobUNN?=
 =?utf-8?B?ZzFtMmZCYzBiVjdxVlJMMlhtVHhiZ0xBREQwSEN2TkVodElMRDNVZDVEb3Z0?=
 =?utf-8?B?K1g5KzlJbWRpK3JXV0ErTTZTRGhIRXM4QlhTcVl0emNNcFo2NE9XeXkzZC82?=
 =?utf-8?B?cGE0UitPZ2VSMkZEblNsM2Z2L2s2cm5LMUNzb3VUd0tzdXFNaFlPZGI4VGNZ?=
 =?utf-8?B?L2N2dkpYeXkyVTJNbGVxbTVxVWlpS3BUSjdjZW1QM3E3c3VvMkhDWGRiWHRl?=
 =?utf-8?B?Myt1aFF2NXNGNlpJSzRCYmVFd2ROZXhBY2lpbmtSZEhGdTllb01Ca05xcWRS?=
 =?utf-8?B?U1ZxMTAwRW04YVdwVGRxd2NMWWNKNUJScStRaVVSaXEzUExsL3dnV2tNNG1y?=
 =?utf-8?B?VndLbDVVWHE4TTRDaFRnQUJJdUs5dEZvRGJhMUwwbDlMS2JNZ3hlY0R3RTN0?=
 =?utf-8?B?a0l0ZitZOEJKYUtRZEl3RFMzTjNMVHlDMzZpTGFEN1ZwSTNXMTR3Sjd2TE1v?=
 =?utf-8?B?WFpIQlNNQ3YxWXRreFZabTc5V2RLWlM2Vm5mOUFFV0NTdTJhejliSndOdmVO?=
 =?utf-8?B?SXY1THhIWnNLbEtLci9ndGNVQ1g3aVJEZmFEWmMyb3p2a056MWVadnhHbnpa?=
 =?utf-8?B?cXBBOXhQL1JXUTU1M1U1OUQ0clBhTnVtNmlCVEk0Y2VLZWFRQTEvd0VOSmgx?=
 =?utf-8?B?eEVFeFF0eXlCcmRtR2ZSS2JBV3MrRmxISnpnVXNUMXNYdUlOMVRZRTJ4M3dY?=
 =?utf-8?B?cUlHYWU1VXBrZjUwU0xIMVB2ZXQxQ3JHanI0Qk9KejZURjRWQWlEdm50c2E0?=
 =?utf-8?B?azVZRk1GZHpYMnp1UEZOaGRmdGl4RVNlaVhrQ3ZHVmhwZ1Jqb215WXFRWmln?=
 =?utf-8?B?RGRWMG5GcEZCVk1FU1pOcHFLeW1Gd1hmK08zUWZ2M2VzK2lSL00vZ0lqTjdX?=
 =?utf-8?B?NVk3VzRuWTNTTkpaVGwwTEhWdDN6NG1rcXRsOE91d0lUNS9rWWhtYVcrTG9P?=
 =?utf-8?B?QWhYWkVhc3NrRloyNUpZUExQeHRhZmxpYWVBTzhPb2FhcVdKNU1sTDM3QUxX?=
 =?utf-8?B?Q1Q2aWhsQnk4TythVi9mYitlYkdQQkd2ZnlJbWZCREFPU3NHYzFCKzVmSjd6?=
 =?utf-8?B?YWxuUTN6ajBDUVhDYytiMm8wVDZqUlprQU1pZ3NQWmNJMGliTnF3RkZta0Fs?=
 =?utf-8?B?RUxnYVg5cW5LN3VPM2RSS1E5SUFWSWtNNldyVXJVcWFmd0l2NzVtRWVtUVlI?=
 =?utf-8?Q?5Pzarhwb6xreQm9u8boRyAk6h?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 765504b8-69dd-4887-a889-08dcf81c3411
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 13:18:39.8065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EYQT3q6yNTESBsMPrM+ziHsA0CfbGVVsHfVVPK1gJbDZ4Ijjcx7sojv0DNKN+rnd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7199
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

Am 25.10.24 um 23:50 schrieb Michał Winiarski:
> There are multiple places where special handling is required for IOV
> resources.
>
> Extract it to pci_resource_is_iov() helper and drop a few ifdefs.
>
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/pci/pci.h       | 19 +++++++++++++++----
>   drivers/pci/setup-bus.c |  7 +++----
>   drivers/pci/setup-res.c |  4 +---
>   3 files changed, 19 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 14d00ce45bfa9..48d345607e57e 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -580,6 +580,10 @@ void pci_iov_update_resource(struct pci_dev *dev, int resno);
>   resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno);
>   void pci_restore_iov_state(struct pci_dev *dev);
>   int pci_iov_bus_range(struct pci_bus *bus);
> +static inline bool pci_resource_is_iov(int resno)
> +{
> +	return resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END;
> +}
>   extern const struct attribute_group sriov_pf_dev_attr_group;
>   extern const struct attribute_group sriov_vf_dev_attr_group;
>   #else
> @@ -589,12 +593,21 @@ static inline int pci_iov_init(struct pci_dev *dev)
>   }
>   static inline void pci_iov_release(struct pci_dev *dev) { }
>   static inline void pci_iov_remove(struct pci_dev *dev) { }
> +static inline void pci_iov_update_resource(struct pci_dev *dev, int resno) { }
> +static inline resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev,
> +							   int resno)
> +{
> +	return 0;
> +}
>   static inline void pci_restore_iov_state(struct pci_dev *dev) { }
>   static inline int pci_iov_bus_range(struct pci_bus *bus)
>   {
>   	return 0;
>   }
> -
> +static inline bool pci_resource_is_iov(int resno)
> +{
> +	return false;
> +}
>   #endif /* CONFIG_PCI_IOV */
>   
>   #ifdef CONFIG_PCIE_PTM
> @@ -616,12 +629,10 @@ unsigned long pci_cardbus_resource_alignment(struct resource *);
>   static inline resource_size_t pci_resource_alignment(struct pci_dev *dev,
>   						     struct resource *res)
>   {
> -#ifdef CONFIG_PCI_IOV
>   	int resno = res - dev->resource;
>   
> -	if (resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END)
> +	if (pci_resource_is_iov(resno))
>   		return pci_sriov_resource_alignment(dev, resno);
> -#endif
>   	if (dev->class >> 8 == PCI_CLASS_BRIDGE_CARDBUS)
>   		return pci_cardbus_resource_alignment(res);
>   	return resource_alignment(res);
> diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
> index 23082bc0ca37a..ba293df10c050 100644
> --- a/drivers/pci/setup-bus.c
> +++ b/drivers/pci/setup-bus.c
> @@ -1093,17 +1093,16 @@ static int pbus_size_mem(struct pci_bus *bus, unsigned long mask,
>   			     (r->flags & mask) != type3))
>   				continue;
>   			r_size = resource_size(r);
> -#ifdef CONFIG_PCI_IOV
> +
>   			/* Put SRIOV requested res to the optional list */
> -			if (realloc_head && i >= PCI_IOV_RESOURCES &&
> -					i <= PCI_IOV_RESOURCE_END) {
> +			if (realloc_head && pci_resource_is_iov(i)) {
>   				add_align = max(pci_resource_alignment(dev, r), add_align);
>   				r->end = r->start - 1;
>   				add_to_list(realloc_head, dev, r, r_size, 0 /* Don't care */);
>   				children_add_size += r_size;
>   				continue;
>   			}
> -#endif
> +
>   			/*
>   			 * aligns[0] is for 1MB (since bridge memory
>   			 * windows are always at least 1MB aligned), so
> diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
> index c6d933ddfd464..e2cf79253ebda 100644
> --- a/drivers/pci/setup-res.c
> +++ b/drivers/pci/setup-res.c
> @@ -127,10 +127,8 @@ void pci_update_resource(struct pci_dev *dev, int resno)
>   {
>   	if (resno <= PCI_ROM_RESOURCE)
>   		pci_std_update_resource(dev, resno);
> -#ifdef CONFIG_PCI_IOV
> -	else if (resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END)
> +	else if (pci_resource_is_iov(resno))
>   		pci_iov_update_resource(dev, resno);
> -#endif
>   }
>   
>   int pci_claim_resource(struct pci_dev *dev, int resource)

