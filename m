Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 496B8CFB67E
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 01:03:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9487410E124;
	Wed,  7 Jan 2026 00:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Au271Fjb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012067.outbound.protection.outlook.com [52.101.48.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC7010E124;
 Wed,  7 Jan 2026 00:03:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FbjmOnnihY5dJq4ixnZj+YlIV+g15ohC+niijQUsCTNPjY0DXwt4URDrRYx5UzDlC7fCiab9OTVlBp03XH4FvR0/U14UpE9fFFfGd4ItuFigboFyLYTB5zNLRCclZbvViNHYZXPUIyGdN1c8smSJTtgFwXsIlZ5yAHCjSZMa2SmphSxbmmUM6o/efD12lo7e3TDxxd9JUl5c86rIJvSoLU/d+PAK+ZW/zXBky1PZLBIvhAV4OTIXqyj6e1ENRlMuBg84pdF5Cxy5P6hSEtRhq5WC8/Pl+d9nkiNqiU6t4yQXV4Ft+CoBrguT+2YPvDM1rcUiLLg4kHCt5WSVEnBLaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABuIQgU/4D9ZfEW+RVnZYmmn0hLsmmiYTKlQfUchjGo=;
 b=lf10CDS8mtGTHWKXdT8/lPPGReaPOIsmgA5TNBy+J+m4UAlRi0A+GXjLdSxJSgj3WIKLRR6K9hDsBWlr3r5jU2HTLDJNE5RfdRoSqjnNC8ZvKTYhgLBKK1r0xBNirsEZJW2u7GdFBKOxmgoV5xG6ZcE4ayQHSqriL2Be1O52UvhgtlODQ7pSwhLyMpPLDvKrk/2kEvMOHvlINAZqCs4GJQlJxUS01O35zc0SAn0jfGsxGaPsEHjvenVrPtfCxDHsruQr7PNt5PESb6NBplCvQcM1r/FYAW0MRd3DrgygWR6bAeQ+grWZgdDYr07l9aC5JwAFfgE7OwJIr0lLK/zzCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABuIQgU/4D9ZfEW+RVnZYmmn0hLsmmiYTKlQfUchjGo=;
 b=Au271FjbSeU8aYNukwGNYfnekGjpfFjEjV4xE3y6tnCKwnzpXD3dNh6PdIZQ3WO9r5oyaqKYC3ZVNqWme2l08z1AUw3kQrEjBlLnswRz5gOnxUF4IE7xu68n6fy9uyJIHNApQf3E9SIODvLNdiVPp5VyJDjBoNPinToZHwRYShc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by PH7PR12MB6787.namprd12.prod.outlook.com (2603:10b6:510:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 00:03:45 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 00:03:45 +0000
Message-ID: <fbfe2d45-a966-47ce-8584-740fc42fdb7a@amd.com>
Date: Tue, 6 Jan 2026 17:03:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] drm/amd/display: Hook up colorop destroy helper for
 plane pipelines
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 daniels@collabora.com, uma.shankar@intel.com, suraj.kandpal@intel.com,
 nfraprado@collabora.com, ville.syrjala@linux.intel.com,
 matthew.d.roper@intel.com
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-8-chaitanya.kumar.borah@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20251219065614.190834-8-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0294.namprd03.prod.outlook.com
 (2603:10b6:303:b5::29) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|PH7PR12MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: 031e549f-29ed-44d9-6a3c-08de4d8039ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVhpQUduTCtrTW9ZN3MzVnB5QUw0aWVSZElMVTB4NkNzbmdqa1I4ZzNRTmt2?=
 =?utf-8?B?MmkvclJNWU5IMTRtUUNRTDgvdyt5YWI1WFQxZWRsUzhSbVRKSWszUlhaWkl3?=
 =?utf-8?B?MmtxeXVjOUlURzhkU0FERW5hdnl1bUNFbURTNm9qVmk0V0c4WGd6ODh1ZWl1?=
 =?utf-8?B?WWQ0UFE2cnh4SU40VDlhczQvRTM0KzNqR2JKaDl4SzAvRWFUOS9ZZlcyRm44?=
 =?utf-8?B?VmpwaTZzdGt5YnpiZWlzNktLVlFNVllVQ2JsTG4yUXYySmtvRXk3L1kvaml0?=
 =?utf-8?B?cFRzcjZEd3JvTHA2QUMzZDdDTkV6UVE5S2Uvd25nVmtoaFFUT3pTSkZleHpz?=
 =?utf-8?B?RHVBdjhFd3hRYitkVml3MHF6endhRVlrOVQrY1pzbmpVTFlaVDJEVE1oVXBu?=
 =?utf-8?B?MDZWMjdudGlxWGJCUXNISDFxYVoxVkhkblppYlRQcHl6V0I0Ri9McmZDTDVX?=
 =?utf-8?B?MkkxK1piUGNONnN1QUplNWsrT1F3RnVhVUNjRDFWZ1RnNzdvaktaQTRack1G?=
 =?utf-8?B?WVYyYVRqVU90S2ltM0swcnpsWTEySkNtaVBWaXhSSWMzTzNKellsdHNLTEdU?=
 =?utf-8?B?TTdwVjdDMWh4Qks3OHlvVnZVczk4bnprMGEwamVMak5KUHd2RjNkcUZWOVQ3?=
 =?utf-8?B?em5LVWRRZFA0ZXpaV0tRUXdybHE2dzl0YzNtQjJOMXNsS3NkMGRUQjB4MVdH?=
 =?utf-8?B?NGVlY3lpQUlmdy9iRjVvd0t1eXhGV1JQTnptNXlyVG9nZFhzTlhlN0NwYkxl?=
 =?utf-8?B?R2ZWRm9pSGdjTlF4alBrZUVsMHVMZkVGMmMwTUpQeS9RbGorKzk2N093UjJo?=
 =?utf-8?B?ZDFNT2lCc2FjbzBHc0JBZXhzK25WcTJWSkF3MmJkY05jU2hleFhuMHlSdmZr?=
 =?utf-8?B?VDlUY3dFZGVVL0Z4Mnp4d1NJR3dBNm1HaDVaSG9DTHpQdEdJNlVrZFZZZWZ4?=
 =?utf-8?B?aEFhUUZkSHdFYy9BQUJpZzRyQURwc003Y0pWYUYzWUM0V0FmWXNxT2VLSmMx?=
 =?utf-8?B?cWI5dWUxdjZybWZBYXdFYzAvbnYweFFmL01YYWZsZmpQMXF6RzJyeisvM3l2?=
 =?utf-8?B?b3p5bkhLc21kVXpCNHZ2QzNtOXQ2VUM0QmtySVE0blZtNUhvTjdKN2VORnRU?=
 =?utf-8?B?dkwzN3FYUmdxWDczdjJnR21Ca0Nsb2dEUkpvMm9VU0lwTEhFUDRhbjl0NzVT?=
 =?utf-8?B?VVRDdkg1OVBVdVlCSmQxbTRXL3RxMjJBOHlrTXdxOUVkS1E2TjNyazQ5NWxF?=
 =?utf-8?B?c29OdjVqSnEwUTYzQ1hZWEU0Y2FLeGZURFVkT3FacWdXUE1Yc0c0cmt0SERz?=
 =?utf-8?B?ZGQyTjZSVmJSdy9PanEvRzF1Y0JldkZJVHFkUnVoSHZWOWphbUZJaFdNdzU5?=
 =?utf-8?B?OFd3U0lEa29ZbUg1Rk9CMHpUdXBJMENSMGlhNkxDOVFTZEp1eFpFZ2xVTXBC?=
 =?utf-8?B?VERyNUNQcTlQRjBjZlcvNUFqNitIUE9zR2pQSDRiazFjMWNEcDdVOUxuRVZz?=
 =?utf-8?B?d1BFQ2xzNDN4UVdBbkRLUXBVOWZkRUdVU1BTemJCeVJ5OW84alRmRTJJMUhJ?=
 =?utf-8?B?SkMwUE1xbWdPZ2crYkpGM3YwYmpsLyt5Rlhja3ZCekdlQ004azhFaWdiL0Qz?=
 =?utf-8?B?T3Q5K0JmR25RWWZTcG02Q3kvUzNkclM4UmxsMTl6cWZ6WXFhMng2c0l2VERm?=
 =?utf-8?B?djZsci9FRElTQVlCU3ExN0lQQnk1WjJRVGpCQVVVQUhPNDg4VjNsZFlUd3E1?=
 =?utf-8?B?SWJnMkJHVVkzWEZ2cXhZVHpqbzFYdVI4WVRnR1B3VUFLZW1xOWlleEx4c0hx?=
 =?utf-8?B?bVMrR1l3NWFtVEU5S3NFTlZPUHdmZHkya2ZyQkNBSWJFUFRLbkdEa1NPQXFJ?=
 =?utf-8?B?aEc3NmJqUGxVbFBmTHhlSDQ5TXVDTmpac1Ztdk51ZjF4Vys4MGFJbTFZdVAw?=
 =?utf-8?Q?fX22HKUdCWlnX5X3xe9QzaVeHDEVf4jO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHVOckdtRkRXQWlqOUtoalNQQm50Tk5wTTRWOEtaTldoV0wzNkFaMUlmdm5H?=
 =?utf-8?B?VkJmWUxrWWM0ZkxDaWJWVDRBT051THY3M24raCtZRTJ1cHM1OGxVa3lIdVN6?=
 =?utf-8?B?dFhxbTdQazJXeTFQOGVRalZEWU5FdFV5WmRFRy9qN0dkeTVHemdXalByZnZI?=
 =?utf-8?B?MWdLa1R2eE9STmdlcU00SGgxd0svOXU5Rk90cnFDNGZUR3NvdmFNL0xSVHZo?=
 =?utf-8?B?cnlzNWdrbmVOOGE4cHEwb2NyeUQ5U2hMTXYveDZpb3Z2L3lHZGNKTUwyN1g5?=
 =?utf-8?B?elkyN0JXR1crNDd2cVNaWnlDaGdPSEc3UXk3YU9vYW1lSUN2c21VaC9tVFNX?=
 =?utf-8?B?VFFscytKYU9tdkhGK1liREdtQUhtWFQ5NmI1YmlCMjRwZWx0Y3VyMTBQUmlT?=
 =?utf-8?B?Mm1YNFkzdWJWZEdITFhQbDcyOEpMRU1lcitXT3p2UDZBZUtLdGJEOFlPMjhw?=
 =?utf-8?B?akl1dGdtNytINS94VFZoNWkvaDl2OGZMUHUrV2svMlpVZW0zbm1EaU1FSU82?=
 =?utf-8?B?QjBoWXdkSTZrUUxaV0p3NzZHRHhNZ2JwcFM2K1NXYkYrbjdmM09uQXpCNmNu?=
 =?utf-8?B?eERyUUtITTI4c29OWEdYZnR4eUM4TmJ3dHdncUlSN2VzVWFJN2hsaFlOdVB4?=
 =?utf-8?B?eG43bU40OU44WHlzSGxhYjlTa2hJbXNlUWZ6UFRENktCNm4yKzdibmlTYUo2?=
 =?utf-8?B?cVZ4N1NRdm1ldzZXczVhc29Bb0x6MWZoZFpnWkNoZ2Y2TDk1QnFBUlZOOXFD?=
 =?utf-8?B?ZktrZ3hmYzEyUUVpOE9YVFduZTJacjIyd2VyYm5STHRsL2NONVRWeERWb2Qr?=
 =?utf-8?B?R3A3TTFJaVhHY1BhSkI2U2NOQmlOdnpQVTVzMk53SFFiUkFjcS8wVUZyMWQ1?=
 =?utf-8?B?Rm9NVXd6UkZDc2JBZTU4VStvb1AxaUhJSEtqRnIxcmxWOUVMMDBCdUhsVExG?=
 =?utf-8?B?bC9YNmNXSUJRdG16OHpNb1NLNEc1a1FvYTBnekJaNTNtdkhhYUV0TXNlelRI?=
 =?utf-8?B?Lythd0J2bTBYSThXWCtzOXZSamgzWnBuZ240elY4Tmg1emVLZFVGRnA3WDk4?=
 =?utf-8?B?WHJ5Wm5rSzZJMU9lQVV4eTZMa29xQmxQRDcvSlpmSW9vcnhLZ1hoM1dKWmtw?=
 =?utf-8?B?dHNBZFFyMmhNTDc3R2JnTXRGMTdocXQvdGFYaXB3NFIxaE9hVnpWVVcydjB5?=
 =?utf-8?B?OVNlNW5WSVJ5VXJ4T3IzQmFERkZ2VTdjb1dFOXBnY2VKY3dNem94bGV0ZFlY?=
 =?utf-8?B?aVFCL0xMUWVULzBKYTA5UldpbTBUM0ZWZmhyd1dPcTV6MjA3TXVTZ2VxOEJU?=
 =?utf-8?B?OUNiTmV3cFRKdXB5aVp3bGVUQy8zNEFDNTdkNUFVWFFzNG9sTG1aTko0bVBZ?=
 =?utf-8?B?dThtSUJjMVYzZ2lZMGNnNVBPVk5lM1NVaitBaDloaDZOaXBqOVV1UklOSjl1?=
 =?utf-8?B?QjJOV0NXV0JFWFdjcG02VU5YUzVGbjdJbW0vK3FsOCtUa0REVWI0c3BOREUv?=
 =?utf-8?B?MVNZdHpZSVR5VTJvZTFlOG1rdnhIUGNRWjJpMHlEcG5ua2crREZzWUkzcEZ6?=
 =?utf-8?B?MjFHUG5zK2VFeWJ3ZW5zVmZTNGtmdW5QVlAvNTZaVEJBbGh0QmdsaytiVkJo?=
 =?utf-8?B?cjZlSVUyS2lRNzk0VERCR1ZvMkRjbkhPZU1BYTVYL0RWbW8vSERySjJiWjRt?=
 =?utf-8?B?NzdKRmJndUdwZERseXM2T0U4WXc0TENkYjFOYzE5aURDSFZGbEg1VUE4d2Zl?=
 =?utf-8?B?bDl6Z3NjeHNGelVlamYyeVlpZmNRRUk5ZmphV0xha0Y1eVpuZU9zejloUERr?=
 =?utf-8?B?cTIybC9yQXg3ZnA1eHJWblkzUmdCOUZPSGVGQzJFY2p4TTBlQlBQcTZqWkZn?=
 =?utf-8?B?emdaTVp4SmhMTUVmM2NlRkpKRjNQNUdLZ0dWcHBBQWI3SlNJYVlJYUpaNHdm?=
 =?utf-8?B?bG9PRS85RHlkUFZVSEhWZytuQ0Fzd2VPcXVjM3phYnpIR25qdVg2VjZmbUg1?=
 =?utf-8?B?RVEwQ1BBd1FjQTBWZDN0c0NYUGRXV0ZPTHViRmpTL1llcEcxcXp6UVhvcUp1?=
 =?utf-8?B?cjF5YUpZNWNYRUs3Uno1MFQ0U2RkaThSelYxS2tia0QyYTZiZG9BVXp4ZWp6?=
 =?utf-8?B?UGlVU0laWWFnbHgrKzR2bEJZbW9TZ3dOYnBZRDVDM2lDSmw3YnZ0VXpRV3I1?=
 =?utf-8?B?blRkOHJDcWkvcWpXc1IrRk9HbFRveGloN09Ea0RMcS9MNmJtd1lMZStyT0g3?=
 =?utf-8?B?SE51c3B0VHdQdjNuRlY0eHROSHFIUzYzZEp2TUtDU3pyQTl5Y3lmUzFMNnlp?=
 =?utf-8?B?SjVKLzN6UjNEQk82NTYwSHNuR2UzdHp0T1JWZmNFSjhKbmFOQ0dwZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 031e549f-29ed-44d9-6a3c-08de4d8039ac
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 00:03:45.3880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JU0BunOoPXg8LqcArFu/rc82G3MudPieF20y/AUbd9AUmpIQznQ/c43stUOHH1b+QUs5tQNEmI6NicWrAXLZ/w==
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

See my nitpick comments for patch 6

Otherwise it looks to me.

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 12/18/25 23:56, Chaitanya Kumar Borah wrote:
> Provide a drm_colorop_funcs instance for amdgpu_dm color pipeline
> objects and hook up the common drm_colorop_destroy() helper as the
> destroy callback.
> 
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 25 +++++++++++++------
>   1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> index dfdb4fb4219f..5130962193d9 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> @@ -55,6 +55,10 @@ const u64 amdgpu_dm_supported_blnd_tfs =
>   
>   #define LUT3D_SIZE		17
>   
> +static const struct drm_colorop_funcs dm_colorop_funcs = {
> +	.destroy = drm_colorop_destroy,
> +};
> +
>   int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
>   {
>   	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
> @@ -72,7 +76,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>   		goto cleanup;
>   	}
>   
> -	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
> +	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, &dm_colorop_funcs,
>   					      amdgpu_dm_supported_degam_tfs,
>   					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
>   	if (ret)
> @@ -89,7 +93,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>   		goto cleanup;
>   	}
>   
> -	ret = drm_plane_colorop_mult_init(dev, ops[i], plane, NULL, DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	ret = drm_plane_colorop_mult_init(dev, ops[i], plane, &dm_colorop_funcs,
> +					  DRM_COLOROP_FLAG_ALLOW_BYPASS);
>   	if (ret)
>   		goto cleanup;
>   
> @@ -104,7 +109,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>   		goto cleanup;
>   	}
>   
> -	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
> +	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane,
> +					     &dm_colorop_funcs,
>   					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
>   	if (ret)
>   		goto cleanup;
> @@ -121,7 +127,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>   			goto cleanup;
>   		}
>   
> -		ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
> +		ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, &dm_colorop_funcs,
>   						amdgpu_dm_supported_shaper_tfs,
>   						DRM_COLOROP_FLAG_ALLOW_BYPASS);
>   		if (ret)
> @@ -138,7 +144,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>   			goto cleanup;
>   		}
>   
> -		ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, NULL,
> +		ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane,
> +							&dm_colorop_funcs,
>   							MAX_COLOR_LUT_ENTRIES,
>   							DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>   							DRM_COLOROP_FLAG_ALLOW_BYPASS);
> @@ -156,7 +163,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>   			goto cleanup;
>   		}
>   
> -		ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, NULL, LUT3D_SIZE,
> +		ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane,
> +					&dm_colorop_funcs, LUT3D_SIZE,
>   					DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>   					DRM_COLOROP_FLAG_ALLOW_BYPASS);
>   		if (ret)
> @@ -174,7 +182,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>   		goto cleanup;
>   	}
>   
> -	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
> +	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, &dm_colorop_funcs,
>   					      amdgpu_dm_supported_blnd_tfs,
>   					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
>   	if (ret)
> @@ -191,7 +199,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>   		goto cleanup;
>   	}
>   
> -	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, NULL, MAX_COLOR_LUT_ENTRIES,
> +	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, &dm_colorop_funcs,
> +						  MAX_COLOR_LUT_ENTRIES,
>   						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>   						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
>   	if (ret)

