Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAF49E1909
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 11:18:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2259410E32F;
	Tue,  3 Dec 2024 10:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YFB3g0dx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D7110E0C7;
 Tue,  3 Dec 2024 10:18:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YDKI4dTIYUxZkh2BbO3Sg9UFDBs7kelmB26o7iHPKAtSBtDpemACWvun1SCC5QVT/QDc8XWhqb3GfrPjiRyWUccO4PrMMpg8iKM8PQAqMlJXA8xWz1oMEWmDXvlgHG/fvtWkacaIBzfD0PMOtOl6qWakf3+dKgMyr9i9et3cD7BPAs25acZpYakQEGj7gG954MuFaJL70J9olVUu7FtKA5+uISOXDEhVf0pZxeO7iUodnHi1YWYWIjestonxH/gP1PfZqhlPzScLvetnx1D1n2je2wVDhOMZfKko7osdA/AYz78kLmky2bZSGumjv98kEhAheU0O6ihnuuuvUz6BIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FnHZO4Sm5m9j36g2ybwaWFBpGwi++NxOvhXE95V+bo=;
 b=AKgp24Kn5n8srJd1HK3X95QlZasgxfIzBzf7CIFjEHrR1392vEcMyT72iPKeBqoM7qznn6GMvZZk/z1QWWWedvONB8eOFPRkAZgznmGPXmzPAi/mMRkizQ9kLGye34omk7uhQ3TOhhWiSGT/lIqgpqeLk7TRGQSSFzgtN25owboJqlXvdqlnJmlUkEcuRv1JJF7RLjx4HEMxVQmlX2BSq/vGk4iU0X3EtA0wqdzbS0t0H8MitiPgNERA9oh+tH8kgeYOoh8sAsJz2e5Uf32C+MGvG7XhRexB2w9FaoxUPwXEq28bncOKrctvHKpMD64UFW0WoE1gwb9ibqjWKwqINw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FnHZO4Sm5m9j36g2ybwaWFBpGwi++NxOvhXE95V+bo=;
 b=YFB3g0dxMxMbgDg1xx8V3GkOCD/1rGD4ncmwdYNn8B3wTtj6FzsUG4F9dBDrsck6M7BZkOLye6ICxHvo/rDSDJlA01Vju43aoDkXSrL3cM4YlxA3phTaAVV5gNR3DLH4oOzXPXH34w2xeHw0+MgWQij5Lqgh2VWUqR6UNWDvcLo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7438.namprd12.prod.outlook.com (2603:10b6:303:219::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 10:18:08 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 10:18:08 +0000
Message-ID: <7d0660f8-ce78-4458-a084-b65ab71e8243@amd.com>
Date: Tue, 3 Dec 2024 11:18:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/4] drm: Introduce device wedged event
To: Raag Jadav <raag.jadav@intel.com>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, rodrigo.vivi@intel.com,
 michal.wajdeczko@intel.com, lina@asahilina.net, anshuman.gupta@intel.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, airlied@gmail.com, simona@ffwll.ch,
 lucas.demarchi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com
References: <20241128153707.1294347-1-raag.jadav@intel.com>
 <20241128153707.1294347-2-raag.jadav@intel.com>
 <1d448e67-0c28-4e21-afdd-223495346921@igalia.com>
 <Z01q1-7OF7jgANEM@black.fi.intel.com> <Z06QUpm3o_izNjoV@black.fi.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Z06QUpm3o_izNjoV@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0301.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7438:EE_
X-MS-Office365-Filtering-Correlation-Id: 13955447-dabb-4533-9f5e-08dd1383c864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MCtpVWp3MTdSSmkvNHE2a1MydWRhZ2ZPdUpXemwyc3pqV3VIVnp6a0dIV2lp?=
 =?utf-8?B?djJQVC9qTVg2TWZxZlgyMm5NbGJmc0tyL1JEOXcrT2JNYW5VYkN5RmNacHB2?=
 =?utf-8?B?YWEvc0pONmMyQW93Y001UlNwWTBCTHRHNEVVQmNiNUFScms1ZXFFbkdRVzk1?=
 =?utf-8?B?VXBEMmsxd1NMakI0SHQvTTl4UFpwQlJEaWVnM2ZmU1JzSEUyUENveHh2U3Vl?=
 =?utf-8?B?T2xtZ0xWQ0QvdVZ6ZEk3dFpMMVpZcVNobG1aVVVBUVQvanBYZGJBTTlQa2lL?=
 =?utf-8?B?R1kyYnNLdThQbmZleSs5QmNiQTBJbEFQRElUL09BNW5HM1pNSUpOdnhYcXFB?=
 =?utf-8?B?OHpDUFRwemlGUFVRY3lKemMyMExnSWQ0eENCSEdhYlBsZGRsd01yWExQdjdX?=
 =?utf-8?B?ZW1NK2RvUUk1cUVHMHM0cnhFU0N5MHU1RFk5dkpvY20vcmVYTW5aVWN6NzVI?=
 =?utf-8?B?TWJQN3ZDZG8zSWt2Y0hybk1qYVA2VDA2QkZNRHVCUk10U3R5aHl0a01DUFBh?=
 =?utf-8?B?aVZwTFcvYld1TFJDbDhBaXQyS21lMjF0OTBJY3BBQU5SSlV5RG1NYVJGVGNL?=
 =?utf-8?B?c0t1L3FwTTdrT1IreFdlV29uR2pSMXptM2oxQ3pFQ1VhaFdtL3prekdVR3h6?=
 =?utf-8?B?cnJmSEpIbEQxS25RLzJmTWs3M0RHSnZsV0VOUU1lVWFyZ3k5L0tNQzU5MDdG?=
 =?utf-8?B?dFhlcmp0MWNycDRxSTg2Z3lMSkVJcnZnaDJQTVlOcFo0ZEJnWThEZzdaSUhG?=
 =?utf-8?B?N0JNRkxwd3JXVktaeEo2K3BCcW1YZU8xekNpdmwycTNsUm10NkVQTmwvc0Ni?=
 =?utf-8?B?eVRNWVhoYXJrUWw0RXJpMWZJc0FIVjFwb0RhMGhvNUxKOEh2WnY5bW9HVVZ6?=
 =?utf-8?B?NkdxS09jMTNFNC8wdE5aU056UVB3Zy84alRqWDVHdHRkOHV0QzZVR1VsUWdE?=
 =?utf-8?B?MlR6em1ZeURUNEVKajQvakNHV1d6UE5KMzUyWFNJcjRteEdiYldXcXhiczl3?=
 =?utf-8?B?ck5Ba1IyOWNoRHdJSnZWVWl2dnZuYld4NFhyb2VNMXB6aU1ZaVBObXNFUWxk?=
 =?utf-8?B?QS9neWVPOEhYaEdONnBBY3dtSDJYSEJ3dXZRbzV4TENROVJib29GYWpoenlT?=
 =?utf-8?B?T01sUERRUFpVMVNONVcwdWYrMElzV1lPYS9MSGFiMml4MUY1aUV0YzQ5OVZ5?=
 =?utf-8?B?SVZpNGYrZmtrS1VjbmhuZllLOGZIUWJEM1diMnF4YjIvNkZZMzF2RjB5REox?=
 =?utf-8?B?dXkxZ0g4NXpUZ2lydFFpbm9rLzlNU0M5SnJ4c093amVSbG12Qi9nY3ovZm5D?=
 =?utf-8?B?K2ExR081TE1KUnFCVEJCMlZaV1crQUhGUHA4UnZiTjd5LzlSUmkrWTg2ZnZF?=
 =?utf-8?B?ekwzQW9vUHQwZ3NhaDVIZFZIWVg0OEEwZVRVZzcvalRudWZvWklYYVpjUEZG?=
 =?utf-8?B?ZDREbWV4eTRmbDFOVWp5bzZOTEZtMDJYTDVPRWF4UjZXZXpXQjdrTUxjQ3hM?=
 =?utf-8?B?dlV4a21qejY0OGlBMmpQSkt5bmtWN3pBODJreEF1ZWwzMXp2cVlGSmgzSDhB?=
 =?utf-8?B?TXFINzUybFU0aWVHcmdRa3VBOWN5bS8yVWpXWmpXOGJPN1Y1UkJiTFRYSGhs?=
 =?utf-8?B?bVdSREl0WndzSzNMdktXd0lyV1hPQmdOS01HT3A5citoSHpNL005a3pJMzZI?=
 =?utf-8?B?YkNEcDNCM2lHTzZSMkRtRVVQR0NoTTI1TGVtSlNWcEx3cGVxSkVRMHBjVDQ2?=
 =?utf-8?B?eHVid2owb2JPUzBaNTdMZUVvL29JUVB5VjNNZVV0WkxuclRoWm1Ic0tTcy9o?=
 =?utf-8?B?MUJCai8yREFqVERkL01Pdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjJwVFd0WEdYaFc5SHk0K29TWWkrMW8xQkFzMTZQbmc1bUhhWk9lT3JZWHg0?=
 =?utf-8?B?ZU9NMGdjUVE1VzBTTklaTzNacGxWVzdiQ2FZSldKbnF2N29tM0g4SXluZ2RL?=
 =?utf-8?B?d2hjZ1BBbnQvUVdlM3VmUzU1UFN2ckxPK0F1VnBuNSsxb1hPQWxEUWVobEUr?=
 =?utf-8?B?b1dJamlFMjJ0RVBPckxWOHpxeFNuYU1WVndwbHFRWG1kc0xUQkpWWW4zNlVS?=
 =?utf-8?B?enJKV3V0RlBMZjFrNFFYWlhPUWpIMGo4V3F1dDZoaHNHSUU2dHI5bXRtQUJh?=
 =?utf-8?B?Vy8wUE1DK2kzT2VXcG8vS0xXVFRVc2JGUUd6cE51bmRCNnY0Tk1sRHdQRUxE?=
 =?utf-8?B?UXJEd0hGRkY0UnE4WE5zY3lOYkFuZ1pmZEJzM05iK09OTmZURm5BOTByaG5L?=
 =?utf-8?B?S2lJYjlRZGNDQVJURSs1b2FXemxZUExUQUp3VzVBMDRFYVhlZ2Z3cjJOcnBh?=
 =?utf-8?B?R0lIdXY1ZEVtU0ZlekRINSs3MGFpbkExeU80VFNOL0FuODZRUzI2aTJFNk4w?=
 =?utf-8?B?alc5QTFpdFdyOFh5S1J5RlNKQ005ZktCT0UzbnFtcTRoOUM5Y01hdFAxSzRY?=
 =?utf-8?B?R2ZZblE2Y1ZqNGRGQkYvTG1vRy9VWGYwZm9lUUtzUkpUcUlMOUdtVlZxTHFT?=
 =?utf-8?B?cWVQNHVhYTdPSVJtM0R5eXh2QVB4SkFuSDN4MnljZnU4TG1YYmkxczBYWEJo?=
 =?utf-8?B?eWZHUFZaTmdUZmM5aTM3c2dGaFA1MS9ONFNCaTNTMFgvdUFQeHNQZ28vRnlM?=
 =?utf-8?B?T3JudlZWMXorQnZWbXZTbWpVMTE1RGhVdHJMQU5LYUg4UnliMi90T09Tdjdw?=
 =?utf-8?B?VEZzK2Y5UWxIN1k1L1BkNGFSQ21CL01jU1g4bU9ZcEdHTUU0d1hTbXJiWkd0?=
 =?utf-8?B?cTU1WnpMSHR4NU51Y0ZiTTJGUS8zSjgxSm9jTENET2RVUEREbFNndFhCbEdQ?=
 =?utf-8?B?TXdZSnhqdFF5dUpwK20vWlAwakdEZWlkejlpeUJxcThiRHA1dzlDenpwTFBj?=
 =?utf-8?B?amR2aDJEWWo4V1R3eUJTLzQxRXMyUFZPbHFYVDFYam5qL250ZmdtU2REV05E?=
 =?utf-8?B?Vkl2N0E2T1B2Z2x0WFp4dm1uZG93eEY1a1FsQVR3M0xsV0VVNk1NVGlXSlVX?=
 =?utf-8?B?U1h2VUNQbmtZM0pRdXkzejN2eWJZNTVib0hVNFBUQlFzQzRUZTZUemVmSXgz?=
 =?utf-8?B?YXNwTm1WYnNISi9sNThtQmwvaXk5M1Q4MDJzOEpIMUJpZ1JmenBWdDJxSEZB?=
 =?utf-8?B?WHVhWmh6SDJ1L0VIdUxGWXAwLzBCMkJjWTF0dEU3ZFBWYWtuMmdRcHhSeDIw?=
 =?utf-8?B?dTVFZ2hFSitTUkl6UGtBV0hVUmxZNUtJZmRLNXFIcmxMTG5EYWs4SE91YjRG?=
 =?utf-8?B?a2dtZURnVW91blJBMkFURUJuSjFQQ1ZCY01LditPSEl2VkFsUWo2a0I3VzFs?=
 =?utf-8?B?WEVtMTR6Rno3cnVoWDNuLytpTE0xYlp0UmMxWnk5alNPS3owTXg4Z0k5WGdl?=
 =?utf-8?B?L1dNc1Zsc2hwQ09VTS8wMXhxdWpVd1UrbjdwT0JkNjFGSU8zNVlERlBVbDFm?=
 =?utf-8?B?Sm9iaVBkR2FJK2NlUFJ5Rk1IYi9PbnRHcGQwZmx0OFhSc2ZxVUxkclpHN0hX?=
 =?utf-8?B?SjVTUzFpS0YxdVBlcERTeHEvQmFJWWlwKytwbjdXTTJ0OVhJTjZxSzN5VkIx?=
 =?utf-8?B?cWtTb2pCWERRbVE3ME9tNmFoWHZwdWpUaU8zYW1HZmdFUGZDeVJ2RkxLK3F4?=
 =?utf-8?B?aE9TK2JYV1VPZ2tsUzNGa1MzRE15MFFZYlBRcFZIYlZzVlBKRDJqMmZFK2cx?=
 =?utf-8?B?WVMzYnJHcTNHNFhjMUlETzRyd05NTkwrcGhEcmgyaEY0cHN1R0M4NUxTYUpC?=
 =?utf-8?B?bjJ1Q3ZSNURwakViOHYzYmFIcjE5ZHV1L3VldjZENlpiSzYwNnpmVDlpMjZ0?=
 =?utf-8?B?MHNjZ2NpaHdPU0JTRGJiRzAvT0VxWnlHLzVNM01KSmVOYWQvcXZVQXBtYnp2?=
 =?utf-8?B?NDVncjh4VkJaK1g3UkpVVkNQZHo3ZjZlaTRpWXNBNlQwbXUvYW9iakE2ZGNL?=
 =?utf-8?B?QnZDUUFndEFVWEZsNkE0L1BXSkdQL3htaGhiWWhKME9FWUFVWFprWHN2dml1?=
 =?utf-8?Q?BGK2ZvU/YNumtOMuGTT9woshj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13955447-dabb-4533-9f5e-08dd1383c864
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 10:18:08.4702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4/qQd+jW4YDMaj0UzzKDIo+P+5GlSjjI9oIBMyUs32RZVMY7dcw2DNmv2UaL8hS3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7438
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

Am 03.12.24 um 06:00 schrieb Raag Jadav:
> On Mon, Dec 02, 2024 at 10:07:59AM +0200, Raag Jadav wrote:
>> On Fri, Nov 29, 2024 at 10:40:14AM -0300, André Almeida wrote:
>>> Hi Raag,
>>>
>>> Em 28/11/2024 12:37, Raag Jadav escreveu:
>>>> Introduce device wedged event, which notifies userspace of 'wedged'
>>>> (hanged/unusable) state of the DRM device through a uevent. This is
>>>> useful especially in cases where the device is no longer operating as
>>>> expected and has become unrecoverable from driver context. Purpose of
>>>> this implementation is to provide drivers a generic way to recover with
>>>> the help of userspace intervention without taking any drastic measures
>>>> in the driver.
>>>>
>>>> A 'wedged' device is basically a dead device that needs attention. The
>>>> uevent is the notification that is sent to userspace along with a hint
>>>> about what could possibly be attempted to recover the device and bring
>>>> it back to usable state. Different drivers may have different ideas of
>>>> a 'wedged' device depending on their hardware implementation, and hence
>>>> the vendor agnostic nature of the event. It is up to the drivers to
>>>> decide when they see the need for device recovery and how they want to
>>>> recover from the available methods.
>>>>
>>> Thank you for your work. Do you think you can add the optional PID
>>> parameter, as the PID of the app that caused the reset? For SteamOS use case
>>> it has been proved to be useful to kill the fault app as well. If the reset
>>> was caused by a kthread, no PID can be provided hence it's an optional
>>> parameter.
>> Hmm, I'm not sure if it really fits here since it doesn't seem like
>> a generic usecase.
>>
>> I'd still be open for it if found useful by the drivers but perhaps
>> as an extended feature in a separate series.
> What do you think Chris, are we good to go with v10?

I agree with Andre that the PID and maybe the new DRM client name would 
be really nice to have here.

We do have that in the device core dump we create, but if an application 
is supervised by daemon for example then that would be really useful.

On the other hand I think we should merge the documentation and code as 
is and then add the PID/name later on. That is essentially a separate 
discussion.

Regards,
Christian.

>
> Raag

