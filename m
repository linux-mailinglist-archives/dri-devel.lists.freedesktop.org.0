Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BY2AbT6m2l5+gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 07:59:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4052F172783
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 07:58:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1574410E249;
	Mon, 23 Feb 2026 06:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4tMZ6ZWX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010068.outbound.protection.outlook.com [52.101.201.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B35010E249
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 06:58:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcCD51hcGmWDgAp4PLrsX/gj5/aFYKD1p1wjUxAarwAOX59EfE+dytAa3yX7vSD6VJpYVedVyVLq1ZagU1JNzlMLySSHN8WgJ0BnsszhuVGo9Qhi6h2e5QnKKer22705uKNe7qvB0gm5bBkfxqBgJLO8WVY+47NqX+ze3STuIuUFZg7FQxZBimDBC4AvYF7oq+s3Udeinzp3JEq8XQ4jmexL0hYdrg+akzFgYh1nD2r9TruJ+tBNvvPAlSEJWi2iEaQUfB1CCgq9AUsWSpxcsev+TXXJ5kwlxVg54oemu93cVYV4x0s45+dwTZOF2+SWNw4nqTYtJX8BAPuYmF6vRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvFrl0uxcxbkAQpmse0jyafUyauihQmocnLqIr1exss=;
 b=GzP/dEKgWmU0dAzj2BT2AbU0DYaFDHrNn2Halq6orJS9uc00yQrcVzFlbbwWJ1dZyitY/gwcAU2nr6rwuR3HIr8dYauG7ADaH6PO3kVrWUh53yhAtVZ5eMZkNCNBJFtbk17qaY4MdUIJ1Q5eWmDuswuylzDdtHTHSlvZWjopoBiAjP9m6HNT7BAb6XkvxHPAp6s8FipmVvWlOHFbLVBQeqp9zRZ9skK/KvYhf4fSXOvNRMI8UvF8ST1HebTOx0S3tduJ4xDbvEUlCibomVzEIJWMwGFLJCHUw6oCPe/HrsuM0rZzuJk2tvcIMrhtEZeTz9SdcJjqpqqBrjoDVwDMIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvFrl0uxcxbkAQpmse0jyafUyauihQmocnLqIr1exss=;
 b=4tMZ6ZWXvylll1M28wrHpbiC6El0TJVi9WRKHBfsQ6xC+P+Fv1TQgmFayn2CxH6oAGIlfjct+QG1v7cgm3hDAtIKlgsD5km0sOEDHz+ngAsJSQrPVF6Z0Ym9tzWlfCSujCfcEcWC3Sn83uZM/wgXIJOjJC+QOQAF2dmBGwnaLvs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by PH8PR12MB7183.namprd12.prod.outlook.com (2603:10b6:510:228::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Mon, 23 Feb
 2026 06:58:52 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::8434:dc50:a68d:7bdd]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::8434:dc50:a68d:7bdd%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 06:58:52 +0000
Message-ID: <80b7da8d-3826-4573-ab2f-a4cf6848468b@amd.com>
Date: Mon, 23 Feb 2026 12:28:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/buddy: Add kernel-doc for allocator structures
 and flags
To: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: "Auld, Matthew" <matthew.auld@intel.com>
References: <20260212092527.718455-4-sanjay.kumar.yadav@intel.com>
 <20260212092527.718455-5-sanjay.kumar.yadav@intel.com>
 <e9df7116-e33e-4571-966e-c5e8b4528165@intel.com>
 <c17088ee-70b0-4ff4-b5ac-b8f9612230ef@intel.com>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <c17088ee-70b0-4ff4-b5ac-b8f9612230ef@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0058.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:270::15) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|PH8PR12MB7183:EE_
X-MS-Office365-Filtering-Correlation-Id: f5b10931-10e0-4c16-fa24-08de72a900c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXNBWEw4bTlrU25scyszZktTalBlYnZkTHZYWkFVZ2hBRFpab3IyQ01hZ044?=
 =?utf-8?B?MXYrdi9sN1dCZFRXaUl4cTEya2x2N3ZHSzgyaGtRZGhSb3c1SHpVbXJQS1BE?=
 =?utf-8?B?a0VUZTdUVDVuSTJTWjRkSHltY0Z4RzhRNi9YL0x5MVI3QVY3ZlVPaHFYSm4x?=
 =?utf-8?B?RURqalRQeFBkam5PYXJEVDZRQ2ZPYWw3d0NBcitTdURwRld4SXZTdDhVL3BD?=
 =?utf-8?B?djQxZkljaHdCTFg0ZlNkVS9HVFUySzFTMVBoanRSVG5RVHlaZ0YvQ0NsSTk2?=
 =?utf-8?B?R0RLUndFUlFpY2RnY0tmZ2ZucnRWdzJQWUkwR1lHMm9IN2o1QjBLZmtvekdK?=
 =?utf-8?B?SFdUaFMwMmNYUjVBbk5vaFIrcGlHWHlGR2RlbXJYQjJ1TnlEdFZPb3NEOVRX?=
 =?utf-8?B?Tkx5TzNoWW5kMmpCOUNLd0F4TUFOWGdHTXRjM1dnMSs0TGN6QUNNRjVtOTFy?=
 =?utf-8?B?M2xvTWNXSDgwQUw3a25HRWNVZXAwQ3NBY2tkYTZOR1dCUFpyUFlpMUkvd1FK?=
 =?utf-8?B?N0MvdHlGQUdnRmRtN3prU3MyR1VsWnFwL09UZ3NWRlZRcmdxS2Vwb2hPU3E5?=
 =?utf-8?B?S1EwRW0xa3hIMWJuN0hhVHBwM1BUR1MrMy9xSThYN08rK01IZGFuUXlZeFp5?=
 =?utf-8?B?ZlpkUW5OKzBYeHY5eitNdEU3RGJoOHBENzNKTE41NzdWeE0yMlBrNFkzc21B?=
 =?utf-8?B?SnVDWnFkSUNsY0s0bEl2TEhoVCt6WXgweDJ2YndTaXgyT0dUdDhPelp4cDFy?=
 =?utf-8?B?NmcrRTRCMTZnTXNaVXNCM3NUMi9XTGo2T3ZvejA2VEhjWWYvWDlUcC9BNmhn?=
 =?utf-8?B?WUxOY1RSTVRTaXBoYk5VbVc2NlJmWWw5cjlacXZCOStqVzNGMXJldGgrV3Z2?=
 =?utf-8?B?WDVmNEZFZzdJMnFhaTlVOVF3SFlEeVRUMnV6MHVCSE5tN0RZdVJPeGdhSVMx?=
 =?utf-8?B?RURWOEF3dFlZQzdGVUE3V1p4ZWYxOHJIZG1ueDI2VTVtdE9uU2F5VExYS2gr?=
 =?utf-8?B?all2cktTYWxIbGxiNGxwNWZnNUVTS0k0Y0Z2ZmxBQ0RNNUQ2NktvWVZTWkdM?=
 =?utf-8?B?RGJEanBKNVFvZ1hyRWlaQWQyZHlrVWM3K2d4NGxSZXp0dHFxMW9IdW5OWVRj?=
 =?utf-8?B?d3Z4V3N0cWlXeGIxbk45TjZzUnV5NEFFblBPcExKYVZ1aE55Sk1pWjZ1YnpI?=
 =?utf-8?B?RWlrRms4TWtVY0s4TjV6dWN4WFJ6NDNKTCtSMDdWVlNzdks4ZEptWG5rUFVM?=
 =?utf-8?B?eXZZZDZkWUlLR1IxNG91eElZZnlGZUFrVnBVNlRhVW42ZlhRc0VCcjZuM2k0?=
 =?utf-8?B?OWRRN2F2bURBQTVmOE8vcmRKeHJ3VVp5Wk5PSngzM2FXaXo5cTlmQUJLWlV4?=
 =?utf-8?B?VGI3VkRGbXQ0Zmx2OXVsMHZGYVk0azlVWjBkMTZFRGd4OXROa2Q0bmwvakdE?=
 =?utf-8?B?bjROUGd0WG00bW1QdnRoRkluRHVPSmpLclpzRmRvRE9hMEFzMXpyUW9aSGdL?=
 =?utf-8?B?dEU4bHFjdXdVS3hmWHNtY0h4ck5MU3pCTHF6M0xCSVFQTVlWS1J3WHFhbXhB?=
 =?utf-8?B?VmdCdFNpbElRZTBDaFlqRVk4U3hKNjNnOU1yMmVIMFZJKzRYVm55RnJkYnhk?=
 =?utf-8?B?TGY0VFNDaVRrTGt3Y1pUTjJrTkt1QSs1dDlGYW1zTlZKVFhWVDNSU3VuMWwy?=
 =?utf-8?B?YWduWEdGckdpYmVuUnVXV1JoTjJ0elhoQ0JJdVNqaVp5dENIMG5TSWM5Tkhn?=
 =?utf-8?B?Y05HMmRaa3ZTL055d3lhcjdNeEIza0tkdDE2TXBnWE12RlJMWkpXZ3dCK0d2?=
 =?utf-8?B?VTNmWWFoREFOcmtSSExvNnp6L2N5cDFBSUJ0b0haUzZEbFdWeW5PTGZKZXdw?=
 =?utf-8?B?U0diZjNSaWNWYXhYL3hJalpPS1crNkJiTUxMY1B4OG5YMFAzRVliRVlHZk1C?=
 =?utf-8?B?bHVEdUpIc3FsSmVEY2ZXSzNYRFZKTW1lTjYwNzRjZndtUitQdG9zbm02b1Qz?=
 =?utf-8?B?dGtPTi9JR0hkSTk5TUVRN3AwaHBscVVPeGdMNHg2cVEyOENqdGExdDNzSXpH?=
 =?utf-8?B?YmExVGtWdVQ5M1QxVURGVDArcjAyYnZBeGp5YU5IZmsrWVYvcWp5bWYwME9E?=
 =?utf-8?Q?KIeI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0NOUW1wbEVQeU95bkZKVjhQTmVaK1FxRnJYbEN3ZGJIMW9IRWZFbERSOUxL?=
 =?utf-8?B?M2tFT1ZRUm5SZXBWUStnM1VhN3NqUkJYUFoxNmI0ckMrM2tLcUFKRVNMTUdD?=
 =?utf-8?B?YzZNTW04OWhlS3VQVHZ2QkVwMU96SlV5L21XRDVjcUlWWTNRK051aEJuN291?=
 =?utf-8?B?THpvS1daNWl2bXNLbm80QU5rWjA1aVczZi9OSHBWVFVjNlUxUDB2cG1keW9u?=
 =?utf-8?B?RHZGblRIMlFPelFRRUZnK2ozSk9qSnZLSWgrRmpMRUJmRlhHWGVUbFNEejIz?=
 =?utf-8?B?TkN3UXBwb3U3cllteFFGd0JybStNUlVxbGh5NXQyRFYrV1FLWkh2bDFSb2o4?=
 =?utf-8?B?QnBOZUEvWE9jeXFiM29WOFNQV2dnNE5sL3JEOENNMHZsOWdtOFpiUW5QTGlJ?=
 =?utf-8?B?N0RLMzlOOGR2Y1U1SHVWME1XOFZPWXo2MTRWbU5zWUhkaHR6N2VsSHlFZGVS?=
 =?utf-8?B?TTJoVTBwamZJTjV2dnlJYXNBR242elRnL2VMbDNFQnkwdHMzVGlZT2h2aGlM?=
 =?utf-8?B?NGhlNk9VV0grd2RuYmNXVkJzM2hUR1FBMzU2U1NnZmtTNjZBMVhkV3o0RUkw?=
 =?utf-8?B?aWZWTDdmcVJKYzdHQ1RjN1NsaDA5aDFTY3lHUkMySXJrQWswaXhGR0N1NDdq?=
 =?utf-8?B?WnVoclg0aVRUalpiTTZrNGNINURHdDZHZ2dSUyt1Q2I2aDIxZWtscWJHbGp6?=
 =?utf-8?B?K2JQamZIQUlOT05xQ0lMOWszenRYM0JzbkFGSTVReUJaQ1JMQlF6bGthckQ3?=
 =?utf-8?B?Y1BxZEFsMHRib0JzQ3I0ZWUwNVJEbkhTQStJM3ZPRTE3Z0FUbVdUZDYvaWla?=
 =?utf-8?B?cHRrMkNuUllUUTFWWkJCNkFNYVNXM1ZuTWJPNnRwTnlkQXRSTEp5YzlTQzZo?=
 =?utf-8?B?eHVUekQzMG5wbyt0UzFJM0JzeWNwRjF2d3NEcFM2K1BNbDRNNUNudjJnM1JT?=
 =?utf-8?B?TE9LbmdjSE8xZzRLMGk4MGVFenlFMjdJWGlrQy9PS1JKRjdkdlB2UHBiUmtE?=
 =?utf-8?B?d2dXcGRBRVJGTk5SbjNJR2paUUpPYXB1QVUrOUpYL1FnOGVWTTVBZkMwUWtu?=
 =?utf-8?B?R2h0U2Q4OEd5RHV6WDVXMDFaQkRLQXIwMDEwOG9qemNBclk0ZzhxdTNaMVFm?=
 =?utf-8?B?YWc3YXJIeFBGazRrYUhHend6Uk5CQ2dGM2RKOWc0b01UVi9mMVJTVTFLYU4w?=
 =?utf-8?B?RFdRY3ZOTHBTM0tRRGJuN0JqVFlaUlJ0SE1LblRZZ0IrcjhVdmxQWUxHeGhZ?=
 =?utf-8?B?aGtWRk90NTdhMVZpaFZ0WjI2S08rYzJPMlRjMnUyWFVaaHBVbjBjOGNSRzFl?=
 =?utf-8?B?emRBT1diRmNuOUdhY3BBaXdLalRsVWo3YW1GVmZkUytPcEQxRGsxNHJicURG?=
 =?utf-8?B?NEdnb09CQWhlUjM1UzdneVI2Y25WZnY0UW9lTXIwYnpyclFsVXp1Y2I2dFpl?=
 =?utf-8?B?eUpoY0FVT3VpOXNudU8zN0lFZjlYbWNzaGlSV2tjNkk0N3YxeGZDeHR6NGMw?=
 =?utf-8?B?L2x0SVN1M1BZdHArZlZyYkZLOVBBcTlOTlY4dFBNakhpTGdjUnNWNWNIMFZR?=
 =?utf-8?B?blBTNEU3TEE1K1g5bHlvanBRUUxuVlJKTm5ucmdHeS95TUE0dVpmemZYeFZI?=
 =?utf-8?B?MzFEaHJIMWFlN0RYZEsrb0Z6em5WZWdXcGtVYk5tZnlVYldmZ29od2hHb2U4?=
 =?utf-8?B?aUpoUmw5Zm94cm9YamhHd3dqTWVSenJNVUVJKytRcTlkS0k2RU5mWUFKcU1q?=
 =?utf-8?B?cHFpeUQrY0JpZW1QRnI0Ynd4OVNFalJTUS95U1gyVDVhcEFDN050S1dKeGhP?=
 =?utf-8?B?QkxZTUhjanZxays2ajMya29SQm53cnU1bm5ET05qWTRhRjVndUZDZmdGNFly?=
 =?utf-8?B?b0tZZzZHVXJFRnlaeGdlbVJ5VGgxUnBBYmlDaUpxSVlUMEJTTUMvVlB2VDdS?=
 =?utf-8?B?VlIwWGNBaWdLZ1k5TEIvMDByQzIzblB2L1pMbU9qazlRWEh3Q29JOXNwb2hX?=
 =?utf-8?B?TDRpTWNLUCsxdWtRaXZtMERCMmV6dk9NeVI0NG5nZUlSQzFEa2R4MU9MdVMv?=
 =?utf-8?B?U3JaNW1xNGNHeUR4K3ZLVXRPLzNsZHNwNmFXWGJnZGQrNHhyU0x2Skl6WjJI?=
 =?utf-8?B?elZCSjYvSWVoUjBvS29LOHdVL3dqUFlwWWVueU5SSVhOT0xQQURiRFhHWDkw?=
 =?utf-8?B?ZEF3ZW9Sc0d4N0taN2lGZExvcXFIUUM1K0JZdWkzaW05WS9oRGQ5QW9vT2Nj?=
 =?utf-8?B?MkJYbS96UDQyMkh1VlJzSmxRZ20yK3RGWTd5UHZGYnI2N1kyVHNrYkVWMUFa?=
 =?utf-8?B?VEdhb1ZteXN6TytpR2g3d0xTZFd6d1lPbTFZcjZEaWtKZ004VmJndz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b10931-10e0-4c16-fa24-08de72a900c9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 06:58:52.4905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+rFw1pPD54+HQ+GJyTqCik1RQzmP3CLmsIz3GXcaUfEGbEmT5whBJwSXzf04Lkl6lFcpd2W16ZPy6GUF2lcEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7183
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
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[arunpravin.paneerselvam@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:sanjay.kumar.yadav@intel.com,m:matthew.auld@intel.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[amd.com:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arunpravin.paneerselvam@amd.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,amd.com:mid,amd.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: 4052F172783
X-Rspamd-Action: no action



On 2/23/2026 11:53 AM, Yadav, Sanjay Kumar wrote:
>
> On 19-02-2026 16:15, Yadav, Sanjay Kumar wrote:
>>
>> On 12-02-2026 14:55, Sanjay Yadav wrote:
>>> Add missing kernel-doc for GPU buddy allocator flags,
>>> gpu_buddy_block, and gpu_buddy. The documentation covers block
>>> header fields, allocator roots, free trees, and allocation flags
>>> such as RANGE, TOPDOWN, CONTIGUOUS, CLEAR, and TRIM_DISABLE.
>>> Private members are marked with kernel-doc private markers
>>> and documented with regular comments.
>>>
>>> No functional changes.
>>>
>>> v2:
>>> - Corrected GPU_BUDDY_CLEAR_TREE and GPU_BUDDY_DIRTY_TREE index
>>>    values (Arun)
>>> - Rebased after DRM buddy allocator moved to drivers/gpu/
>>> - Updated commit message
>>>
>>> v3:
>>> - Document reserved bits 8:6 in header layout (Arun)
>>> - Fix checkpatch warning
>>>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>>> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
>>> Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>>
>> Hi Arun,
>>
>> Could you please merge this series if its looks fine? Thanks.
> Gentle Reminder! Thanks
Done!
>>
>>> ---
>>>   include/linux/gpu_buddy.h | 123 
>>> +++++++++++++++++++++++++++++++-------
>>>   1 file changed, 103 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/include/linux/gpu_buddy.h b/include/linux/gpu_buddy.h
>>> index 07ac65db6d2e..bf2a42256536 100644
>>> --- a/include/linux/gpu_buddy.h
>>> +++ b/include/linux/gpu_buddy.h
>>> @@ -12,11 +12,58 @@
>>>   #include <linux/sched.h>
>>>   #include <linux/rbtree.h>
>>>   +/**
>>> + * GPU_BUDDY_RANGE_ALLOCATION - Allocate within a specific address 
>>> range
>>> + *
>>> + * When set, allocation is restricted to the range [start, end) 
>>> specified
>>> + * in gpu_buddy_alloc_blocks(). Without this flag, start/end are 
>>> ignored
>>> + * and allocation can use any free space.
>>> + */
>>>   #define GPU_BUDDY_RANGE_ALLOCATION        BIT(0)
>>> +
>>> +/**
>>> + * GPU_BUDDY_TOPDOWN_ALLOCATION - Allocate from top of address space
>>> + *
>>> + * Allocate starting from high addresses and working down. Useful for
>>> + * separating different allocation types (e.g., kernel vs userspace)
>>> + * to reduce fragmentation.
>>> + */
>>>   #define GPU_BUDDY_TOPDOWN_ALLOCATION        BIT(1)
>>> +
>>> +/**
>>> + * GPU_BUDDY_CONTIGUOUS_ALLOCATION - Require physically contiguous 
>>> blocks
>>> + *
>>> + * The allocation must be satisfied with a single contiguous block.
>>> + * If the requested size cannot be allocated contiguously, the
>>> + * allocation fails with -ENOSPC.
>>> + */
>>>   #define GPU_BUDDY_CONTIGUOUS_ALLOCATION        BIT(2)
>>> +
>>> +/**
>>> + * GPU_BUDDY_CLEAR_ALLOCATION - Prefer pre-cleared (zeroed) memory
>>> + *
>>> + * Attempt to allocate from the clear tree first. If insufficient 
>>> clear
>>> + * memory is available, falls back to dirty memory. Useful when the
>>> + * caller needs zeroed memory and wants to avoid GPU clear operations.
>>> + */
>>>   #define GPU_BUDDY_CLEAR_ALLOCATION        BIT(3)
>>> +
>>> +/**
>>> + * GPU_BUDDY_CLEARED - Mark returned blocks as cleared
>>> + *
>>> + * Used with gpu_buddy_free_list() to indicate that the memory being
>>> + * freed has been cleared (zeroed). The blocks will be placed in the
>>> + * clear tree for future GPU_BUDDY_CLEAR_ALLOCATION requests.
>>> + */
>>>   #define GPU_BUDDY_CLEARED            BIT(4)
>>> +
>>> +/**
>>> + * GPU_BUDDY_TRIM_DISABLE - Disable automatic block trimming
>>> + *
>>> + * By default, if an allocation is smaller than the allocated block,
>>> + * excess memory is trimmed and returned to the free pool. This flag
>>> + * disables trimming, keeping the full power-of-two block size.
>>> + */
>>>   #define GPU_BUDDY_TRIM_DISABLE            BIT(5)
>>>     enum gpu_buddy_free_tree {
>>> @@ -28,7 +75,28 @@ enum gpu_buddy_free_tree {
>>>   #define for_each_free_tree(tree) \
>>>       for ((tree) = 0; (tree) < GPU_BUDDY_MAX_FREE_TREES; (tree)++)
>>>   +/**
>>> + * struct gpu_buddy_block - Block within a buddy allocator
>>> + *
>>> + * Each block in the buddy allocator is represented by this structure.
>>> + * Blocks are organized in a binary tree where each parent block 
>>> can be
>>> + * split into two children (left and right buddies). The allocator 
>>> manages
>>> + * blocks at various orders (power-of-2 sizes) from chunk_size up 
>>> to the
>>> + * largest contiguous region.
>>> + *
>>> + * @private: Private data owned by the allocator user (e.g., 
>>> driver-specific data)
>>> + * @link: List node for user ownership while block is allocated
>>> + */
>>>   struct gpu_buddy_block {
>>> +/* private: */
>>> +    /*
>>> +     * Header bit layout:
>>> +     * - Bits 63:12: block offset within the address space
>>> +     * - Bits 11:10: state (ALLOCATED, FREE, or SPLIT)
>>> +     * - Bit 9: clear bit (1 if memory is zeroed)
>>> +     * - Bits 8:6: reserved
>>> +     * - Bits 5:0: order (log2 of size relative to chunk_size)
>>> +     */
>>>   #define GPU_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>>>   #define GPU_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
>>>   #define   GPU_BUDDY_ALLOCATED       (1 << 10)
>>> @@ -43,7 +111,7 @@ struct gpu_buddy_block {
>>>       struct gpu_buddy_block *left;
>>>       struct gpu_buddy_block *right;
>>>       struct gpu_buddy_block *parent;
>>> -
>>> +/* public: */
>>>       void *private; /* owned by creator */
>>>         /*
>>> @@ -53,43 +121,58 @@ struct gpu_buddy_block {
>>>        * gpu_buddy_free* ownership is given back to the mm.
>>>        */
>>>       union {
>>> +/* private: */
>>>           struct rb_node rb;
>>> +/* public: */
>>>           struct list_head link;
>>>       };
>>> -
>>> +/* private: */
>>>       struct list_head tmp_link;
>>>   };
>>>     /* Order-zero must be at least SZ_4K */
>>>   #define GPU_BUDDY_MAX_ORDER (63 - 12)
>>>   -/*
>>> - * Binary Buddy System.
>>> +/**
>>> + * struct gpu_buddy - GPU binary buddy allocator
>>> + *
>>> + * The buddy allocator provides efficient power-of-two memory 
>>> allocation
>>> + * with fast allocation and free operations. It is commonly used 
>>> for GPU
>>> + * memory management where allocations can be split into power-of-two
>>> + * block sizes.
>>>    *
>>> - * Locking should be handled by the user, a simple mutex around
>>> - * gpu_buddy_alloc* and gpu_buddy_free* should suffice.
>>> + * Locking should be handled by the user; a simple mutex around
>>> + * gpu_buddy_alloc_blocks() and 
>>> gpu_buddy_free_block()/gpu_buddy_free_list()
>>> + * should suffice.
>>> + *
>>> + * @n_roots: Number of root blocks in the roots array.
>>> + * @max_order: Maximum block order (log2 of largest block size / 
>>> chunk_size).
>>> + * @chunk_size: Minimum allocation granularity in bytes. Must be at 
>>> least SZ_4K.
>>> + * @size: Total size of the address space managed by this allocator 
>>> in bytes.
>>> + * @avail: Total free space currently available for allocation in 
>>> bytes.
>>> + * @clear_avail: Free space available in the clear tree (zeroed 
>>> memory) in bytes.
>>> + *               This is a subset of @avail.
>>>    */
>>>   struct gpu_buddy {
>>> -    /* Maintain a free list for each order. */
>>> -    struct rb_root **free_trees;
>>> -
>>> +/* private: */
>>>       /*
>>> -     * Maintain explicit binary tree(s) to track the allocation of the
>>> -     * address space. This gives us a simple way of finding a buddy 
>>> block
>>> -     * and performing the potentially recursive merge step when 
>>> freeing a
>>> -     * block.  Nodes are either allocated or free, in which case 
>>> they will
>>> -     * also exist on the respective free list.
>>> +     * Array of red-black trees for free block management.
>>> +     * Indexed as free_trees[clear/dirty][order] where:
>>> +     * - Index 0 (GPU_BUDDY_CLEAR_TREE): blocks with zeroed content
>>> +     * - Index 1 (GPU_BUDDY_DIRTY_TREE): blocks with unknown content
>>> +     * Each tree holds free blocks of the corresponding order.
>>>        */
>>> -    struct gpu_buddy_block **roots;
>>> -
>>> +    struct rb_root **free_trees;
>>>       /*
>>> -     * Anything from here is public, and remains static for the 
>>> lifetime of
>>> -     * the mm. Everything above is considered do-not-touch.
>>> +     * Array of root blocks representing the top-level blocks of the
>>> +     * binary tree(s). Multiple roots exist when the total size is not
>>> +     * a power of two, with each root being the largest power-of-two
>>> +     * that fits in the remaining space.
>>>        */
>>> +    struct gpu_buddy_block **roots;
>>> +/* public: */
>>>       unsigned int n_roots;
>>>       unsigned int max_order;
>>> -
>>> -    /* Must be at least SZ_4K */
>>>       u64 chunk_size;
>>>       u64 size;
>>>       u64 avail;

