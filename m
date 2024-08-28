Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF7D9626CF
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 14:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1490110E091;
	Wed, 28 Aug 2024 12:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RQinsQUU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2075.outbound.protection.outlook.com [40.107.95.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E07210E478
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 12:20:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lcUC4pWpTHcQAPqwrrfM3Diqy6vz+gkyfBJZ07TpHyzFJ26vK+avWfG/iHpNqTyBKelo2gAicvyOjkQ5ADP4k0yoSNyG89AEhp8VG/ThR+T3YGyCNt3MVWewPekEImQzUuPBaFaqvDZhy644wAZNMQYbw9VqaDI5Nld/gKDepIqeMplLRRhbwLy3+oiwexyc/VgZKQo/rdQ2k5TtvIwi1VKNbPmW631ORK/hdaW68e5XIwF8JodtyeEKugAVS4hBaQEyEd27idNEaHb+65yw9osbM8LdmP8ShRI+UD1/MZblacV/mh1r6R6oCOxr9DBHsj/GK9mX/PxU8spwzWy5rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3Xc5pj9qPd68YUu2XyVGSjc/3L3IFK6pHhBGfZrdNk=;
 b=nNRQUz38x+Ds8Zou5aYoWRuqeqjRovHJpxRlUvCaJQq7bgw/qimwlZICG3iY0yQBDVYnoJRAxBnaJxmfQuKIjf8+KxnljdUrE8Ch9AmV89/BGKUyr22j2G+frmYs86/KrCcUrBL3K3YeOsVFvTKUwQ1nUwZbtipQa0hy9snq4kpW7PAHUnEenlBp44V9cJEp4YPqHZDCqTIVzpZP611xWkQ+puvgONNpUlYa9u02tYdopw2tql+TQV/j21X8N05l8OeBXPWZbcNa3aH8pg9ATqYAw9ryD0MIsN5l4hC36MHxqmg+IfHKBUC+8lnYCn2MDmfZjFh+f0kTXspPxRwc8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3Xc5pj9qPd68YUu2XyVGSjc/3L3IFK6pHhBGfZrdNk=;
 b=RQinsQUUVHsabUoj5d3w1IqeUTJAMWNS6C0aL5SwJrO3Pu6DGk+r7lpoaBLpWv9oy/wyKqaANveiYzahtOJ2EbtluHvEODxQ/T6T1HL8NdF7kb3CWognN0LEr5/xCaTUs5d5/ykgQlddBAE2ICnjZoppUiP+RsTdQj75XofiPKI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB6814.namprd12.prod.outlook.com (2603:10b6:806:266::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.33; Wed, 28 Aug
 2024 12:20:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 12:20:38 +0000
Message-ID: <c890ecbf-e7eb-479d-bb54-807edd1f66e6@amd.com>
Date: Wed, 28 Aug 2024 14:20:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <7d3c647a2df19aa0f8a582b7d346ba8014cf6ca3.camel@linux.intel.com>
 <ZsNTTCfBCpZNrSQH@phenom.ffwll.local>
 <440bb9a5-54b8-46ef-b6db-50110af5c02a@amd.com>
 <5a2f24bce352b65a1fb6e933c406b3ab1efa33e3.camel@linux.intel.com>
 <4d4c532a-ff35-4172-9b71-93f5d130711b@amd.com>
 <bb0a31ea3d82ee370873ca5f1c66ec4eeafabffe.camel@linux.intel.com>
 <d065806d-1d72-4707-bc5f-4da311809295@amd.com>
 <ZscDox5KoiNHXxne@phenom.ffwll.local>
 <3afe3ab2-4a58-49a9-acd7-c989980c68f2@amd.com>
 <Zs4EPT1DR7OrE5X-@phenom.ffwll.local> <Zs4Ss8LJ-n9NbBcb@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Zs4Ss8LJ-n9NbBcb@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::22) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB6814:EE_
X-MS-Office365-Filtering-Correlation-Id: c41c095d-332c-4558-6f96-08dcc75bd39d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTkwRURWcFd1TWFZUGtpMFNFQmFkMWxFd3k5Nk4zejMxaTF2a2JZc2MvWU9E?=
 =?utf-8?B?UjhtN0o5MXVSTVVsZktzRnhialNYSDJsUDFUMUhPSkI1Wi9MU1JhQSt4WktW?=
 =?utf-8?B?MEg1c1ZsODdtL0VKQVJlS0I3bWNWRWhyVDI5eTJJekdvejFHclByVElRQnk0?=
 =?utf-8?B?dFpOTTkwR2p3QWtvQXZ1ZDBUdTB6Y2taWDF2MmdNb3hwbnk4cFZWMVl6Z1FZ?=
 =?utf-8?B?M3h1NGVVOHpGYVoyRnIyS2NrOFRjVzRNZWlkTXNMQ0MwQmxyY21XTWJpWk1G?=
 =?utf-8?B?YUJjWkZFUWtZTVJPOVorWEQ3UVk3aFhKS0dTWGFnS2V4WFdFK1kwK2RXMEtM?=
 =?utf-8?B?eUJhcUVpa2gzbCtwQTg5cjM1UlI5OTZod1hRV2w2eXgwNDl3UHl5YXVQaWRz?=
 =?utf-8?B?ZUFESC9yMGFZMlB3dUFqZUZQaWNwblhHdXMvVE5VYlo0M0JWNkZobmFZOHZY?=
 =?utf-8?B?T0hYaUxtajBGaElsRDk3WEFtSm00T0M1VTkvaUxtWXlTMkhMZGlxeSswQXBO?=
 =?utf-8?B?SmxzbDRWK2k2empyTkN2cjBnamRNekduQjJUOTRTaWdCR1BqeVlGa2lsZjBr?=
 =?utf-8?B?ZWFTclUxU1VXSi9GVXZIMVdvSGJEbk9walpNZzh0eGMvZk1JZ3htK0N5Y0NN?=
 =?utf-8?B?UnZrRVBxSUxHWCtMaE8zNHpZbVJ1cXpsUnRGMlJuOVJhZzFWZ0FJVHBYOTVP?=
 =?utf-8?B?QzhLYXpsMHVtZEhoMEZwL2xRZUQ2dlFsVDNMaEZtRW0yem5WM3ZZSTNEY2tU?=
 =?utf-8?B?QnplSXdxSmRsc2FMbDhUYzliR0ZqMW5xeE9VU0h1MTRpOUVrblhzT1dDeVNB?=
 =?utf-8?B?WDY5b0xZZ1NSclhaUXZpVWw0ZkczZG5OalpSamNEK2JIUUtjcVN4RjRBWXhx?=
 =?utf-8?B?aFNzUXRJeGlEMWZSL1NrK2VXMmUwTVdRbno1TklYMUQ2KysybkVNTjhQYVVZ?=
 =?utf-8?B?ZmdxdWpsVWFVTHphQXU0d3BpZk14SFBSSGl5alhrTVJKeVRLeFpzOTM3MTI2?=
 =?utf-8?B?SFRnSGRocG1INitEa2xLY2I0MzZnMlVDYjFEZjh0RzVrNHRFcDRvSGZuL1BR?=
 =?utf-8?B?UCtpRklFempzL0FqZTVPSzFvS3ZlUWY3TmNQOGI5MGcvaHJQVWw4bVZpT1do?=
 =?utf-8?B?cEozL3JuQ0dsU1lQMUlEcEFSNU80ZmczRHJWRWlyNVM0b3puanFhUEc3dyt2?=
 =?utf-8?B?VTkzU0ZzL1FwcnRqOEsydjVoN0R4ZDR2K3NxREFhU0RBZERJSzVyQWtpTkJR?=
 =?utf-8?B?dWxzdXhScGZLTUxQTW1pKzhWRmY2THh4clF1eXZ4SFhNQ1ZzTmxBNkRNelVj?=
 =?utf-8?B?c0xUcXhpOTM3Q20wYlhyYzc1TFF3bDlJSG5mdTJmc2Y1cm9WZFJVcUZnWWVY?=
 =?utf-8?B?eG5TejdBdXpBd21OVzRnMlBmNmVJa1ErMnJoL3RIRTByQml6WDIzVHVaUzRR?=
 =?utf-8?B?cU42andURVRROGRMcWJmVHVKbXdLRkY1di9GT2RuVDdRazY4MlZIRHAxQlZz?=
 =?utf-8?B?WmVxSFlyQkY4cGo5bXV0ekNyVzl4c2VJV3V0THk1a2F2OWo5bWlRRWFtNFBa?=
 =?utf-8?B?WWREZEdlR0FRamVoTzhmekFhc2tTR1VsdHM4UmpsWStyQkNPSzExM3pyZHoy?=
 =?utf-8?B?aGhkREc0cjlKZENINDJDMHNndU1kUktESnNjN1dRMGtOUzRYY09qaWRudW1P?=
 =?utf-8?B?SHF6RW9PemVPbjNzWUF3UlpiUFM1bndNWlVhNEJtMUpSdVdtcjRFQUJzTmdF?=
 =?utf-8?B?SHlGKzhNNFBuVzUvckF4K2ZRemtZZVBPaG5JbUVmNWNrc3Y2TlFJM2J4a2lr?=
 =?utf-8?B?UTJnSDZKdFZaVDBZT1VXZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2d2V0l5K3NhbGtZZnFQSVZycEthZDRZQkxaV3FMRC9mbnkzWjRlOXA1N05m?=
 =?utf-8?B?VDdPcjh2WnB5NGxjZExIakF6NmYzTy9icHBMVEVOVWZFUDBSdzJwY2RlOFVt?=
 =?utf-8?B?Q1Mwb0ZPQ0NYcklRSFZjN0EzUzArS3RLckNDU3ZEaWxjOFZQZGI2MkMrZjBW?=
 =?utf-8?B?VXRtTXV2NGdxaUFodWFkdFBYOUdheElqQzNmZjQzd3VkQXY4R2R6NThXN1Nn?=
 =?utf-8?B?VytaZWt6Z0pjVUt3TXUzbmZDL1FGNmllMzM0WVVXc0IxMHd5UFRiWCtpekRx?=
 =?utf-8?B?SmR4ZVFRSFR5U0plL1psbFo1Vk8zaVB1UkJBNGN2YVUrdXZHQUpQNHpZTGNT?=
 =?utf-8?B?aWZmZ1ptamxvNGdoYnFCTUNOVTZNOTRYWkpmcEJxNHJhTWRNeis5OWNvZWlF?=
 =?utf-8?B?RXRRSjBnY1RaWTN3TnpjUnpJZ3lKMWxicUxXR0NkSTdqeVdNcFBWZmFJNVJj?=
 =?utf-8?B?WHR1T2g2L2VrZDRUMEduUU1PTzA3QWJkTzQvVk9GNWlhWHQxVi83WFBvNGZX?=
 =?utf-8?B?dTBSTFNPcURxQjJjQUlNRS9BRVM5cmlkdEtqdzIxb2ZxTkRYL29odisweXVh?=
 =?utf-8?B?bHl4cDM3Y05xNWdlRDI3elBVc1JkMlQ3QUh5Y201bTR2cHFmRnFuOUs0ZlVm?=
 =?utf-8?B?blhnd2Z1ZnEzTlQzQUVvYWdLdkxYSHpBSGxya1JQRFQzb004QXN0SGhxQ1Ri?=
 =?utf-8?B?UEh0Tk1zVnU2TlJIT0U1LzlXM0ozR1l6SUVOM0gvd0pDYjJoYUd0M29lekRx?=
 =?utf-8?B?c0ovcHlTbjJ5ektoRW9zRmRkVWphWmJwYWRQa01ibnRYRnBpTVUybWNNZ3lF?=
 =?utf-8?B?ME1uQUxxT1luSEhCZHdPbTFYOG82MFZjRWM5TmFzOUVEVm1TNGdBNlR4Rk9G?=
 =?utf-8?B?ek5RNHJXdXNGZ01RSGhVblVWaCszUEFWVWtRQzZ1ZUlIbm94akhsV2JmKzdw?=
 =?utf-8?B?UStEOW85MXE5SWgyc0hxSlV0L2hwYmI1VXdWek55ck5SVzlCaVBqYUNSbmxt?=
 =?utf-8?B?bnhQNkV4NXJMUVVWT1NTOHB2RXZQeksvSm53TGZrVnZOMHdRVm1qRUFzdC9p?=
 =?utf-8?B?a08vTmlGVTdqZ1RjWTMwZkdxcDNKVWpnb3FBOG02dGVhS1c0Wno1dlYwV3FJ?=
 =?utf-8?B?L3hXb3NEN2RRRkJMRFludk9mcmRhTWpSUnJ3aktOdVZLR3NnWjRwTzExOGhr?=
 =?utf-8?B?WTJ3cWNGQWc4ME5ibVVENElNQzJKZFl5TkdDVzdER2ZpQVl0dWxxUFNEZ1Fl?=
 =?utf-8?B?UXVJZkpqUFZ0UHgrNEx1aEFsUjRiQkdUNVhSalJVOUEyZm43cFQ3UHZHMVJU?=
 =?utf-8?B?QXVKa3c5S084NElxL2hPTk13UzR6Uld6eXV6SDdsYjJmcXU0aHNmdzJOVW90?=
 =?utf-8?B?YmdRYm5XajBKSm1JSzExcDVENi9Oa1I2UXJTblFrc0ZkMVh6NlZiT2ZDRDZH?=
 =?utf-8?B?dmNtVC8yTldSMGNwenZ5eS8xWG1WdzdrUDBJVGE5V1VwaVM4bHM0YVZVR0F0?=
 =?utf-8?B?T29EamNzZDlPQmptRUFBbUM1T1NMd1JGOXRmdFlKQ2lOVkZCUndJeGRqdCtJ?=
 =?utf-8?B?L0IxSm0yanppeUMwaGRnWUNpbFYxSWQxdWk5clRrYXA3RTVFYW9tS0xGOUhE?=
 =?utf-8?B?VTYrcnZLd0ZDTElDanNCMUdvNzY0S0pJQ2hKY0sxSkMxMFhiT0VyQkFnRUNZ?=
 =?utf-8?B?bjZLM2V2SktscTFTZTVFcEdhWFd2L1BUbTV5cGVLLzJaSldZeFlYcExRWE1h?=
 =?utf-8?B?S2RYQ3FTZUNLR0pqQk8xYWJYN2VaQUVqMDcvVHg0QVlIQWo5N2lLVUI3NHk5?=
 =?utf-8?B?VFJpN2NCNTREMVZjaU8xQ3hCR0lHY20wdEZUa2xzUVdabGpMaWZGMVEwYW4x?=
 =?utf-8?B?MDBxaDFMS2tCLzBzV1Y1akJtREJwVEd1QTNlemxKd0FtMTJmdlBZTkliNDlB?=
 =?utf-8?B?OWovcTVRSFhjc1RjOFVvS0EvUXdRTDJtMVFlS2JLNDM3VTZGSFVEU29NNFp0?=
 =?utf-8?B?MWM2S1lvQ0lTc0RqWkZYSUlmTXh6TktoNGtEVmtlSDcwZFVXR1VWZmtEa0M3?=
 =?utf-8?B?bkppajF3Mm83WWZxTVNsajFZNVgwcG9tUUVmeFM4NGVTSGN1Ny9aaFViRnhy?=
 =?utf-8?Q?bzGo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c41c095d-332c-4558-6f96-08dcc75bd39d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 12:20:38.7219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QrcrpaQ6Gst1Hnrvt/Q+k6icEj3ZTLm36MUSTW1xkql+J21F0cDPa/qUfdsvuKxX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6814
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

Am 27.08.24 um 19:53 schrieb Daniel Vetter:
> On Tue, Aug 27, 2024 at 06:52:13PM +0200, Daniel Vetter wrote:
>> On Thu, Aug 22, 2024 at 03:19:29PM +0200, Christian König wrote:
>>> Completely agree that this is complicated, but I still don't see the need
>>> for it.
>>>
>>> Drivers just need to use pm_runtime_get_if_in_use() inside the shrinker and
>>> postpone all hw activity until resume.
>> Not good enough, at least long term I think. Also postponing hw activity
>> to resume doesn't solve the deadlock issue, if you still need to grab ttm
>> locks on resume.
> Pondered this specific aspect some more, and I think you still have a race
> here (even if you avoid the deadlock): If the condiditional rpm_get call
> fails there's no guarantee that the device will suspend/resume and clean
> up the GART mapping.

Well I think we have a major disconnect here. When the device is powered 
down there is no GART mapping to clean up any more.

In other words GART is a table in local memory (VRAM) when the device is 
powered down this table is completely destroyed. Any BO which was mapped 
inside this table is now not mapped any more.

So when the shrinker wants to evict a BO which is marked as mapped to 
GART and the device is powered down we just skip the GART unmapping part 
because that has already implicitly happened during power down.

Before mapping any BO into the GART again we power the GPU up through 
the runtime PM calls. And while powering it up again the GART is restored.

> The race gets a bit smaller if you use
> pm_runtime_get_if_active(), but even then you might catch it right when
> resume almost finished.

What race are you talking about?

The worst thing which could happen is that we restore a GART entry which 
isn't needed any more, but that is pretty much irrelevant since we only 
clear them to avoid some hw bugs.

> That means we'll have ttm bo hanging around with GART allocations/mappings
> which aren't actually valid anymore (since they might escape the cleanup
> upon resume due to the race). That doesn't feel like a solid design
> either.

I'm most likely missing something, but I'm really scratching my head 
where you see a problem here.

Regards,
Christian.

> -Sima

