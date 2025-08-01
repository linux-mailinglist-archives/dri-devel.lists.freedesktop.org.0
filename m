Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3F4B1881E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 22:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F87510E0B7;
	Fri,  1 Aug 2025 20:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="O2TY598T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27A910E0B7
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 20:29:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eB9Pwf/37D4v8ZsF3MKZDrF8vPaRBT0yp/BUJiPcbaW2hS8RuZrdqgsjPvrDgmu8ePjAabSYbYz9nz38/80pUz4uEYBQfoGpxJA+Annb4jQo7tinPhoCj6iqTLEoCY62g1LlpoaniIO/5uxi+gp7XP//Mg/e/OGpflKPGjytJFNAjg1oBRK4OzLIPjQ/Fx80pu3ZRTijo2iXJ5iSBTYdU8rmiUO/97o2U/7gANBGlo3B6Mv6ccB1icWa+z9hkV3aJ56Nnx42YddYMJbsOYjGWycG5e1Kq7SYaRxJ1wFGBh2NP+djamS4D5ISSaKHUa6A/Wc847GbcXG+dyQs0P/w/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhZfx4t8QWOabfEBGx9nRr/WadCMyEMfEHiUAf+2qWo=;
 b=xBrdXdImkt8/8BaT0vOkEKQ+ulB0EPwMAT1RfJUI42sHDwL67PlkxUScudR8Lt90Afv1v6kUvzY1pIwmaqCXDd/Q3/maNrwwkanhUKgUCyXCuqM0H3+kCP5GhfrjJciB28S8BX51B1XAAi+KUjUoVw208WNO6iONa7CtAgMC90vdVrjol48JtnmzIW6qQxwr3KSa4Vq5bN7q8AHlCPLanm3vYgzCn1RdwyzY+OydeE1a1WmANfsSCJrCJxEby9jMNq5Y2f1xDxzd7wFoCmX93AqyIIXS15mWADEo0cXoqCnr/NhyB8xXMuHLR2i9p/qngH+IrwXyVGadHkOXN0oPAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhZfx4t8QWOabfEBGx9nRr/WadCMyEMfEHiUAf+2qWo=;
 b=O2TY598Ty00uf96pE+lEAsQqK1Ern4D5F7dZQ5rx1s/wT9ch5D+b8StF4Eml4GXzxE0YvAS9j0e3O0kipNFlrklB88o04H3fqVLf7AzNbtQvqoFC7F1gsL3/3YeDsULXVBXc/UM7wNZXc2mWR8BzjLWtsJX4/KK1Mz9s0HGrTqcuy1CCcvd0n9L9o6moo/XaTxCTjUNE0aoS66e4cAJVlUeG+gZtEES5k8CZb5ZeL01n16SZKh/hB5Coi/S+EfWfhE42RbN5qhv/pFgsEhMBLfvQMZGfnT1yrN/0FqqJMJWGT7EjreuhT2iRtULpSe1HpYXdDM6LNFokfP9dMyugtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB6701.namprd12.prod.outlook.com (2603:10b6:806:251::18)
 by CH2PR12MB4296.namprd12.prod.outlook.com (2603:10b6:610:af::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 20:28:58 +0000
Received: from SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a]) by SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a%6]) with mapi id 15.20.8989.010; Fri, 1 Aug 2025
 20:28:58 +0000
Message-ID: <4d7990e8-d8e5-4a8f-9350-176fbc866dd6@nvidia.com>
Date: Fri, 1 Aug 2025 13:28:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/nouveau: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
To: Imre Deak <imre.deak@intel.com>, dri-devel@lists.freedesktop.org
Cc: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
References: <20250728101603.243788-1-imre.deak@intel.com>
 <20250728101603.243788-3-imre.deak@intel.com>
Content-Language: en-US
From: James Jones <jajones@nvidia.com>
In-Reply-To: <20250728101603.243788-3-imre.deak@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR07CA0039.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::7) To SA1PR12MB6701.namprd12.prod.outlook.com
 (2603:10b6:806:251::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB6701:EE_|CH2PR12MB4296:EE_
X-MS-Office365-Filtering-Correlation-Id: c5339342-55a2-4054-3d9e-08ddd13a0b12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y296blVpb0pqay8wa1BGd3QyM3c4S0RZajNSeVZOUWNQN2NiL0pGaHJ5U3Q0?=
 =?utf-8?B?Tmk0RWkycldJM1dBalloSzJpY2VWMGx3RnRLaVhxNFN2Q1lDYWtDSGZBSTc4?=
 =?utf-8?B?blRDNWtYR3dKMU9NVjFpWlEzVjk2SWpaUmdMQldJYkQxQ3oyTkZ6Ums4TnRD?=
 =?utf-8?B?V3A4dFNPZUtlN3NBanNCb24vVy9ST0QyZDdGVFBoR1dqeEQvNDhqWHVRSXRm?=
 =?utf-8?B?Mk9QRS82Q3E4b0h0eUt5azVKb2VuVXlsT211RS9nNlB4UkdlejFVMU5weUIv?=
 =?utf-8?B?Q1QyTGZMZ1pjTVhsbCs2eVBXbDdRRmtrcXhud0pCVDBhQUtOdjhhM2FwMDV0?=
 =?utf-8?B?WExQL05XYUM1NXBaL3UrK20zdkl5WXArRUpTOEtPZE5kREdrNDZzM04zOUpD?=
 =?utf-8?B?QXYxWUlMZjVCajFWOVNBNENreGVyYm1SZEhqY0s4SDN1U0k3VW01RmQ0c1d3?=
 =?utf-8?B?QUNDWFZQVXQ5NmxNQWJEZVJtOE1mbDZlL3NqRVJodityZzIwMDg1My9leUt0?=
 =?utf-8?B?d2ZoV051TmNGdWc0ejJDRHcxWUJxSTNPRVUzdXUwcVk0VFpIUndnUHBGZWdD?=
 =?utf-8?B?NXAwZXgzbm1GN2ZZekpBVTl1c0JkMml3SHB1MjZTS0dzeGx0alBSaHYweFhK?=
 =?utf-8?B?Q0RMcTZlT1E4aTNQNVNiVEdYblpHNmswaWEram82YW9uZFBtMk9qWXNXOGZE?=
 =?utf-8?B?dUdxa3Vob3Y3UnF1TWZBU0ZGZ3RqM21naWdGSGpPK1Yzc1Z4WFZIWTMwdnAv?=
 =?utf-8?B?bkxjSEt0OHRMNFNGc25rS096Uk5aWUhCckEvYzlUUi9QNHYrQW9VOGRPQTll?=
 =?utf-8?B?ODlYMjNPL3lNRmpxeFdOVmhGL0VUOTFtTnBmK3NGbVE4d0k3bDV2UENiV1RK?=
 =?utf-8?B?T0hIOXI0ZFZGUEhyQ0s1YWJTQkFqc3pmMkJocFNTeEoxS1JsWDNVeEo3NlFD?=
 =?utf-8?B?N3dHSEhjbWg2akI4K2xqZVVLN3RVY3NsVjlsR2d4TGczU25CSW9FQ3FOTjZW?=
 =?utf-8?B?ZVVIeVpRcEd4RHlXVE91SmdBY2t1aHBnWXB0dVJod1hTbUI3Uk5qR0RCTHhY?=
 =?utf-8?B?MFFEd0ZkRmdkZCt1cG5hZllkdHowdVJ4dEFjOTI0eEJxWjROVHRtbStpajlr?=
 =?utf-8?B?dG9MYjBnek1BVjRXK2hvdXBudDladElkZTc5RXJSR0xtcEErUUl4ak9TczU5?=
 =?utf-8?B?K2hWckMwdmRlVGt3bmxORzF3ZnFjYUZWQ1FmdVhwcUMwVitodytJMGNDN0xJ?=
 =?utf-8?B?bnB2eHhPMkd2UnpmamhETWdyTzBKdmpCeEw4YkZvVEl6cFphd2tEQ0RzZUIx?=
 =?utf-8?B?L2N1ZjVZa1A5VHpJeDg1dE56cWNlbnY2aXY1UytkRmZsTlA3bWlGZTV2MWZ3?=
 =?utf-8?B?WDBFckVodXpueXBLRmpmRmFleTdpbFdDZy9ucXF1VG9UKzBvdGNDZHU0dFo0?=
 =?utf-8?B?UmVJamwva2NmWUxPYitkY2N3NHZYZkVOM2hseU9tZ04xamgxeDdZM3BuNVRP?=
 =?utf-8?B?ejdzWGNFb2R6RWVuVisrUFhFb05EVnMrQWZvZnZnNHAwNURXNGU1K3dDSDVt?=
 =?utf-8?B?TTlFYzJvTng1VEpNc0J1OUY0WmxoczZqRW04OGU5QzZZUHV5TDlBVkUvWGxC?=
 =?utf-8?B?S0RheWZMN05JNGxkdmpQcjFjZGFrdmVjSS8wVSs3cHcyN1VGS1JFdmNDTjFW?=
 =?utf-8?B?bFVTMHlXRm5CRXY2dXRkSXJNUzJwVk56Rno4QVM0c1h3RVRQc3p5QllxUlRE?=
 =?utf-8?B?UWd1OGxrZXZGLzVrakluRWF1SDJtbzVMUk9VbWJ0blQ2a1pKMFVWSXNvc2I1?=
 =?utf-8?B?T3V6cnZKQ2FKVTFwQmt4RzJ5TFlFL2h5TjVkSXdhcHRGemhkWXdxN3ZUbmpG?=
 =?utf-8?B?NTIyVVNjTG9MOXphNkg2WXZ5U3F5cUxVd0tYVUdzMXhiUHVjeDdYSDJlS2ZE?=
 =?utf-8?Q?BBXuBW1JMh4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6701.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkZqSWllUks0bzRFWkgxM054YkdNK0wyRFZlUFZIWUhYK21STEkvYitDcEla?=
 =?utf-8?B?ODBmZUY0eWtUMUNxSHhGUDVCZnRTTThHZW52ZEtXWW5zRWJIVVQrL3ZhUnI3?=
 =?utf-8?B?N1Z1bEFaK1picnJtaU9GMkk3K1dCREIxeUo4bi9tS1pNNm1MWU9Ib2d6VTI1?=
 =?utf-8?B?SGlnWFZQMjNjbEpDTWVXWjd4RGN0MGxWd2FlKy90VjFOUEVrWG1vZ1I2eTZV?=
 =?utf-8?B?TVdFUHdKRXpzRDFJcGhQeFVmeHpmMGIwNkFvVWZkN1RORjRiaHhYVkdVUlhz?=
 =?utf-8?B?eXRWdTNtVm1ZeE1QZlNHaGpmVkdxd2tJQXBuM2VMZjlRSXMvL056a3I2bDdP?=
 =?utf-8?B?bkxLQ0JYN0h3czB1Yms4cDRNTnJvaTIzUkJaUitZMlN0bG1NaTFJOHYwYVBF?=
 =?utf-8?B?a2xId0FqMVJQRk85SlJGbS9kVnhrbTd4T2VRNVlaSGI3Y005elF0N0dzM3FG?=
 =?utf-8?B?QU03Q2dTV1dDWWNVWExORU5nTFJJQnNoTkZ2UUJJb3QxM21CSUtjKzM2Nk5R?=
 =?utf-8?B?eWRRRDFmVVdDZCtUVnlhMGtpM0l6UkFQaDhZUXVRWWFCZ1JveGxiRHJCeTI1?=
 =?utf-8?B?aUZFVnFyNGFFMFQ4UU5HeUlmVGdXSzBSdy9IcXN4TEkwYVc3K0d4L1A1bnlV?=
 =?utf-8?B?UU5razBlZzh5ZEVpUTlrazZXdE9Ua1RlNFBJUCs4YmlXbmZTM0UyenB4Ym90?=
 =?utf-8?B?NTVzZ0tSVTNOcXh5OENjb09HZ3JpdlJmU2FTbkpOZzVIM3U1QUt1UnJSU2Mv?=
 =?utf-8?B?UVRNQjV5YlBnOW5LSi9QUWpGZW9sZjdiNmpOamJYSzlCWHNPbnVVMkxiUW9M?=
 =?utf-8?B?cnRWY25xZDJwejFva21pYnVvNUV2ZkZNbUpmL0NMYkYwY2hTNlRXS3NSek9o?=
 =?utf-8?B?cDVRejJqL2F3QXhlRldUNTBiYi9IR2JQZmhWcDVWZVd6NXNkdU5YMjZvcHZS?=
 =?utf-8?B?bnQrZWFHZFMyYkNibGNWYVFHSHRjbHlYcWNRTHFXSThuZG9lYlg5U2VYbnc0?=
 =?utf-8?B?NkloKzR0d2tIZ3hNc0tQTmVvclpOM0dQL2ZUNXlwcHUyNHdTek81NlRwaFMv?=
 =?utf-8?B?M055WmpUYzNHOTRraTgwM3NOcmM5VzRXbng1UXZQUmR5T2FZYlZTNm4wcjUx?=
 =?utf-8?B?THhnL1BrREw2RXdUc2cwc2xNQ1c3TlRxd3laa1J6S0JHL2VNUnhxK3FVdFNI?=
 =?utf-8?B?SGQwaFB6ZjRsRmV1RkFyeTBlL1h1SklXR0krbUEvTFRtc2pQZU5waVNGL1lC?=
 =?utf-8?B?c2dEL0xDZW5SVkVuZDNLSzRQbVJ5M3FpMS9EWW1UUmVnUm42enBrKzloY0h5?=
 =?utf-8?B?dEVWVnJLeUNFQnNyNGR2d2lSaWhKUEhBaGpSZ1hHRWw1cUZJQ1BsWStKd1Mr?=
 =?utf-8?B?UHRLS0UrS3NxWGdlMEZsem94NHRnZXJtMVlFMWV1RUN5Y3RLdTJlM3dIdVAr?=
 =?utf-8?B?OEhiOXlFaXBKa3ZZMlpnNjJmc0g2TkdXclhTM3lkcDZqWHRaYytlWE1XSzhu?=
 =?utf-8?B?dGNDWGpvdml0cHI1V2ZKV041VUFzdzZreENraVV0R1NZZjR3UEdQcnFDemxz?=
 =?utf-8?B?czd4Q21saVpwUUJjRzQveURYYnNqTE1QSDF6YnVSMmIrV0I4QVF2bmltQ3hB?=
 =?utf-8?B?ZWROWFhqbDJtMzdtcFBhZlVGZzVpUGpSbFRsVjVFTkJ3bHBkY01uVy8xUGVX?=
 =?utf-8?B?RGpjTGJod0FsS3lIZjhRMjRzcy9mMnJJbnVNVGU2WGY3QTVOMlExejErM2Fi?=
 =?utf-8?B?MjdwK0JaQmR0U2VZeU9tK1ZQVWhabEdiV0NhclYwbzliN0IxYzZTWXdHUTlq?=
 =?utf-8?B?UjBZWWUySzZuTmtFNHJxejFiQytIYVhudzRYK252UldlRVhjSkdraHN2d01m?=
 =?utf-8?B?RllUa0U0WVFKdGtZaEtjMlhzenBZYkFRMmNTZEEwQnhiVlMzZTBHSlM4MUJH?=
 =?utf-8?B?bzloSVBWVXhyTWt2ckRJQytIOFBRRk5SREYyemVZaG9teU9rV0dLeXVkSDlB?=
 =?utf-8?B?MzRjalU0MVRFSGxPZnZ6aDBtYXJDdXFzRHlWV2JaTmhFUjF6UURXdDdabE5W?=
 =?utf-8?B?aWlOOXFRQUE3T0IzOXFhWnZPNnBQa3ZCd09lTjlmN1VabVdVU0xJTCtrVmNa?=
 =?utf-8?Q?icB29v+yr1lucQnktIfI1VspZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5339342-55a2-4054-3d9e-08ddd13a0b12
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6701.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 20:28:58.3070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5JRatCs4qF0F3e0Ji8Bi0v8C/8IsWLeGw8c5pv4adPQbxJfGC4eH05sMC/geV14P3uWuAGdZ13aw5fV1lXMQ8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4296
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

Review-by: James Jones <jajones@nvidia.com>
Tested-by: James Jones <jajones@nvidia.com>

Tested on GB203, TU102, and NV50.

Thanks,
-James

On 7/28/25 03:16, Imre Deak wrote:
> Plumb the format info from .fb_create() all the way to
> drm_helper_mode_fill_fb_struct() to avoid the redundant
> lookup.
> 
> The patch is based on the driver parts of the patchset at Link:
> below, which missed converting the nouveau driver.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Fixes: 41ab92d35ccd ("drm: Make passing of format info to drm_helper_mode_fill_fb_struct() mandatory")
> Link: https://lore.kernel.org/all/20250701090722.13645-1-ville.syrjala@linux.intel.com
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>   drivers/gpu/drm/nouveau/nouveau_display.c | 9 +++------
>   drivers/gpu/drm/nouveau/nouveau_display.h | 3 +++
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index e1e5421263103..805d0a87aa546 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -253,6 +253,7 @@ nouveau_check_bl_size(struct nouveau_drm *drm, struct nouveau_bo *nvbo,
>   
>   int
>   nouveau_framebuffer_new(struct drm_device *dev,
> +			const struct drm_format_info *info,
>   			const struct drm_mode_fb_cmd2 *mode_cmd,
>   			struct drm_gem_object *gem,
>   			struct drm_framebuffer **pfb)
> @@ -260,7 +261,6 @@ nouveau_framebuffer_new(struct drm_device *dev,
>   	struct nouveau_drm *drm = nouveau_drm(dev);
>   	struct nouveau_bo *nvbo = nouveau_gem_object(gem);
>   	struct drm_framebuffer *fb;
> -	const struct drm_format_info *info;
>   	unsigned int height, i;
>   	uint32_t tile_mode;
>   	uint8_t kind;
> @@ -295,9 +295,6 @@ nouveau_framebuffer_new(struct drm_device *dev,
>   		kind = nvbo->kind;
>   	}
>   
> -	info = drm_get_format_info(dev, mode_cmd->pixel_format,
> -				   mode_cmd->modifier[0]);
> -
>   	for (i = 0; i < info->num_planes; i++) {
>   		height = drm_format_info_plane_height(info,
>   						      mode_cmd->height,
> @@ -321,7 +318,7 @@ nouveau_framebuffer_new(struct drm_device *dev,
>   	if (!(fb = *pfb = kzalloc(sizeof(*fb), GFP_KERNEL)))
>   		return -ENOMEM;
>   
> -	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
> +	drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
>   	fb->obj[0] = gem;
>   
>   	ret = drm_framebuffer_init(dev, fb, &nouveau_framebuffer_funcs);
> @@ -344,7 +341,7 @@ nouveau_user_framebuffer_create(struct drm_device *dev,
>   	if (!gem)
>   		return ERR_PTR(-ENOENT);
>   
> -	ret = nouveau_framebuffer_new(dev, mode_cmd, gem, &fb);
> +	ret = nouveau_framebuffer_new(dev, info, mode_cmd, gem, &fb);
>   	if (ret == 0)
>   		return fb;
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
> index e45f211501f61..470e0910d4845 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.h
> @@ -8,8 +8,11 @@
>   
>   #include <drm/drm_framebuffer.h>
>   
> +struct drm_format_info;
> +
>   int
>   nouveau_framebuffer_new(struct drm_device *dev,
> +			const struct drm_format_info *info,
>   			const struct drm_mode_fb_cmd2 *mode_cmd,
>   			struct drm_gem_object *gem,
>   			struct drm_framebuffer **pfb);

