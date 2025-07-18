Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD08B09C52
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 09:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEA710E0B4;
	Fri, 18 Jul 2025 07:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="43F+tsaY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BD710E0B4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 07:25:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbcyhkLihDs9RVNfIxHyV3Ml4jut5vYxMZcC2+DbGwjclBxVjm0yxFKlLx7a36BjwM0/n7mGgsuZm9pMcIvePnJwmRzCMkN+IPc9BeVdwOCtbMI5qoAWHFaH8YOdwYNKffzAQKUJXCVUXx3xWpW9JZYW/tQA7MNCv5A0P5Qvcj9ueDSaV/mrrqQu3lynGaSV4Ylznv8D1MWe0jyphvQeVdnvrv0EgiZbYPRS35bJQfAXs05MHv5vkIFuAqBi9DgkSj9wRk7ziZ6cMU0RjXwDGJhE1iC2LJnLjFfb2iRz7bAV7Ef/FTCKBUBzcNSTJhHuW/A3LZZS6vikX1Acv3Fe6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GgT5F1Zcj2lwETKmGlJx78EwPMy+EZ5tG/Ie35gwCdM=;
 b=ePpyAQIgehtM66xbCFtYoNzVHRlwMdb1cSv7BJ9Cjx8BUA+oE+3WoJj51ONIIVSapkD1aiObcqNkY25Sls1BYPgc2y3vg/XYE+iAVsL9IQIYE3oA/WE+qp/oHgccxZjX1p9WZD8pSAhEM1x2ULg2w3x+HZgNK11se6Oo3acCtyFX+GVU9LvdMMEIkC9gfA00ary20HT8BMHExHkb3twPycEz8QsAQCfkL1AqPnd5Avwyqgc4vDprVYNvfzxPHfBhiDjJ6Mo3qW1/x2HpGHa2lVtr4tkQ7+USWqBA1u4NYa+tLWvqJDWNDsVnWLVbkIjSdZXg18rh9Y/9eySbzTOcIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgT5F1Zcj2lwETKmGlJx78EwPMy+EZ5tG/Ie35gwCdM=;
 b=43F+tsaYqtJ1OjK0SErZ9YvU/88NDmEZg2Opbr/UdKJIKhH8CVM5XlNheNYEELoTKoLovqO3sKI2lSct8OTpyJDTiZEQzr4zSMlLW4C/xBmG791DXtHPvT2srhfveYPLm9Fnubo/rjmTcFi26+FNoQntwl+0LEBvb/NeQzqkkxw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by PH8PR12MB7327.namprd12.prod.outlook.com (2603:10b6:510:215::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Fri, 18 Jul
 2025 07:25:01 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%4]) with mapi id 15.20.8901.033; Fri, 18 Jul 2025
 07:25:00 +0000
Message-ID: <9a50d59c-d8c2-4069-870c-f8d6f45ecc11@amd.com>
Date: Fri, 18 Jul 2025 09:24:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm: Move drm_gem ioctl kerneldoc to uapi file
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org,
 tvrtko.ursulin@igalia.com, Felix.Kuehling@amd.com, David.YatSin@amd.com,
 Chris.Freehill@amd.com, dcostantino@meta.com, sruffell@meta.com,
 simona@ffwll.ch, mripard@kernel.org, tzimmermann@suse.de
References: <20250711145342.89720-1-David.Francis@amd.com>
 <20250711145342.89720-3-David.Francis@amd.com>
 <aHGIQNEuDM-MgmnZ@phenom.ffwll.local>
 <48c0cbcb-c613-4f0b-b922-d6807f2eefec@amd.com>
 <aHT6vC61bEQ6DIRx@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aHT6vC61bEQ6DIRx@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0P222CA0001.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:531::6) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|PH8PR12MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: b755b36d-78e5-4fb6-cd7a-08ddc5cc348b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDgxVkh0QzI1eW5pY0Y0U0dQN3c4S2RxZjdPNmdvd1VYeXJ2T3A5dGh3RC80?=
 =?utf-8?B?OUJXSU1YY3JJaERUSDROa01USDVuaHgwZEJjd24wU1RuaSs3WW0yWUk3c0Zk?=
 =?utf-8?B?RXRPOEJvcisvcStVTEwyS0xFQkJNb0gyUHdscWwvMFh6aUpzWm1yV2RHZTRi?=
 =?utf-8?B?OVVzL0hhbmVoYkduY3JKcVkwYktIVUpPeXJWUmR6ZTExV1BtTFg3ZXlUaE9C?=
 =?utf-8?B?MHp1VSt0OUNVR1grak5welJUZmRWaG50S1BmaG1oOVdWTnJKN0VGU0NhYW9K?=
 =?utf-8?B?QTJQWUxpdXZJR3lnYTN4aHhnVXEwVmdOd0JEYjhoeHBnTjVpUXk1MHh6eE9i?=
 =?utf-8?B?OHovWkV2Zlo3bTlZN3BEclFNMCtOYzNJRTNqb2ZLVGdXTWtrb1lKSHBTQnZG?=
 =?utf-8?B?ZHVHNFhFTDBVS3V2Rk40Vm9EQjg2eWNXdHpFNzNHTzBSOFU2MjRFRFRSUmov?=
 =?utf-8?B?Q2FPd29mRW5SVGlxK3IxWkhyUExFb3lLU29QUlplTkRVcnc1am1nTzNEVDRn?=
 =?utf-8?B?Rkk1ZlhBdDhxSUdiRlpDRmFlUFU3Q21MZ1ZRMWRsREcrclU2YzZkcmlTaGVn?=
 =?utf-8?B?WE5mZWtCRlVCNDRmeFFBYkkvU0crN254aDR2aFJvNXlhWktGblU3UklKQjhM?=
 =?utf-8?B?T0twa1p2L3VnTUlEK2crbjNMQVBSaWJpbXA0NnFqU0xKUnhFZjE0ZGFja3dt?=
 =?utf-8?B?NS9yVmlmUVcrZmRiTVZtVjVqMGo2ejZCUFowbm5pVm5ndW43RHBYelJEQ2xI?=
 =?utf-8?B?QVI0d2tCYjFyNGkxNktEa3pVWG12ZWN6N2hMeWl2a2VpY3RxMy9uZmlyS25l?=
 =?utf-8?B?RWJjK0xXdTZPak1CbnpJTkd0bnVHN3NVVkhSalVwaG85MEJ2Mk1ycVFrUDFv?=
 =?utf-8?B?WTFWQkQwOTgvZU1EM21YbFlBQUZ5Vk5xQmhJUEV4dlJTQzV4aWdHdW9ra2s0?=
 =?utf-8?B?b1hURzhBWGFKcFhvTlBmRy9xTVE0L3lFYStFcS8xOWN5YU1UODBRbVpMLzFY?=
 =?utf-8?B?ZGZ6b3VUTFV6UktQNUEzaWNNMk9qeVNMSklWMXI3MXU5SVVPNGR2Yi85RVI5?=
 =?utf-8?B?Z0tkQmNaM2srMlljNldYaUkxSEpjTXR6KzZTWXJaZkF4MGlNK3VDMUFBRm41?=
 =?utf-8?B?elZDUllnSWFzUGU3UXkzTU4ySjZFRmRqd3FXOGtYYks5WWJPN1VaR1lpMFdT?=
 =?utf-8?B?YnU4UHRjWVAzRitaNm9SdVU3OGZsSlI1dGtzKzBIazdNTUM2MG91TWtDTHpP?=
 =?utf-8?B?UmgwT0FVSDJCTEtLRUkxRlU1ZkNsWTZnNHM3N2crRi9vM29ORDdpVFptY3gx?=
 =?utf-8?B?d0FCV05LV3FCdXgvNFR2em8wdStyYUlGWTRDRk1VdndsNFplRnd3MExaR0JI?=
 =?utf-8?B?KzgzdTdqSjVmNURmWXpyWE1IYUNuUGhUU3BycTFCTnJTeVdQM2QvMFVDenBI?=
 =?utf-8?B?bldheW1ONkVpazUzV2FWQ1JPMjdwRlQ5ZWRWeEtSd3dobFRJZ1VFOVBGQm9p?=
 =?utf-8?B?SFY4a1JSTkw1QW1xTm1vMFNGMVlUeUVmWGRqRWlqT2M5OFVpRnZJRGRrUHJP?=
 =?utf-8?B?TDlTb0s4TjVzeFpEdXlHYVY4djYwcTFQSytOeThXSWJYc2NRY0lvS1hvUmpj?=
 =?utf-8?B?b0Z1dnN0M1JldHl0SmVnYnRkOXlqNjBLNlJXL0pIWFk4cGd1UWQwcExVRmlV?=
 =?utf-8?B?cDVJTUJxVUw1bHBuZHVKRjljek1tYUpqLzdFeUlNaXRvQWJmVFZFQUVOb05C?=
 =?utf-8?B?ZWdrdWtpR0cxV2o0U3E5UmxmWE51L0NJSWRXT0ZMdnEvd2FPYk50M0lIVlQv?=
 =?utf-8?B?ZDNhOTRkQXFSQnZFaDJUL1lDQjFQOE1GUDNvT1BnMVdIakthRGczRjdpcXRX?=
 =?utf-8?B?dVIrWW1iNVQ3ZXhDZW5qYWx6a2FHem12V20raEtTcDJOa1I5ZXBNWGJUNVdC?=
 =?utf-8?Q?XtmHvNZq99A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUdVcFZ4elpTNDJEejlKOHpxUXpoZUVTY2c4bWtYUTliclAyU3diV0tydU1I?=
 =?utf-8?B?a2ZwYTN1bHFYRGJwSUpBcXk3cVdtRjY5czVWc2lkOG5VbEllcFlGU2NVVTJE?=
 =?utf-8?B?S0E3QlNmRkZrNjRuSnJwTGdIQTdWN2I0dmpHQlZzbDNiWHUzcVdNQWg0N2xo?=
 =?utf-8?B?bFFZMko0bnZEeGNUd0VxblZ3WkphZ0dRY3IyZkpaY3BicUhBeFJ3SkpHbXlX?=
 =?utf-8?B?UjhUamowSEp6Z1RBdzlLc3dYdHhlZ3dYZVo3Qi9yLytuTDAxcjJWenljVVVj?=
 =?utf-8?B?UUs5di81QWlMMm5uUkJFbEtCOC80ZnRmRWhHcFI5RndFd0o1ZlBOeDFyVXdv?=
 =?utf-8?B?aHo1alJMUERJOTg2S3h0NktSMXBuTS9vejhUeDZ1NjdjYTFKeE5OQ2dlcGE0?=
 =?utf-8?B?ZnJHcFFYajNxaXJYOUNUNzM0VXpFR2JPUE02QXBDRkVpT1NCUS90dWdJS0RB?=
 =?utf-8?B?VUJIMlRWWW5McVA0Ylo2S0hqVjdEYkhiNUJCbWMrV1c3Z21sdVF5UkoxVFQw?=
 =?utf-8?B?WkVQZzZsd2M1VVp4NzZCMGRCU1YweHBrNkdMYVRMSEg4MEFTWm54SmRiY2th?=
 =?utf-8?B?Sjg0RTZyanYrS1ZnMkE5bXFsWmQ1QldlOS9qVEc1cXBMYmxZbWpiOUI5YjhG?=
 =?utf-8?B?NUVYZFV0TTdqOTRvdFFrTGgyOVpGeU56Mm1ZM2lWQkNPZjlublIrWFhMVUJY?=
 =?utf-8?B?OG0wVFhRVVJyTDdUQ2VTRWNINUR3b1U3cXg5bGs3eHV4cXNkUEpKall3UnR5?=
 =?utf-8?B?Tlp1N0p4cjkzRTdJenZIditNWUZMZUFZQXd1MDhaN0c5OU8rVjg5Y2pWUEZz?=
 =?utf-8?B?QlJESmJPUkJRaGwydnZTMEVRK1NocFhmTHNXZVpmbGl6aCtVZjBsMkVhajBo?=
 =?utf-8?B?NjI2aVgrMGFoY05wSDRTNkNURHpENFpXZmxFaG9PZ0RVNHFONlRNT0JRNklE?=
 =?utf-8?B?bXMvOFlvZFd6akVTTHJNdE9ybzAyNlBaRDBaS3lnc0pIeTdEa0FQTFBPSGVE?=
 =?utf-8?B?TDlrRmhndXlzaFY0WTJKOW4yMmFyK3A5VzJKU0FLTkNpalBvMC93YkltOGdN?=
 =?utf-8?B?SGFZZERPQlpuZHNkdWhmVzdQLzF0ZllVTUtIVnBLUFlrUS9iUkR6N0hTSXR1?=
 =?utf-8?B?bEhJSXd6UTBGTWM4dnBKVjNrc29NNzZPN3QxS3NmdFpmc3p4blhPblZKNlBQ?=
 =?utf-8?B?RVc1V0xMZzVtQmU5Q2RBQ3pudEhqeWhVaVp5bE1yaXNTT3lVMVlWOFA0cXhF?=
 =?utf-8?B?ck54Z0JyeEVud0w2OVJiQ3lGbERkRFNLNmtEeGlocWtuRXF4bVM2d1JQb2U5?=
 =?utf-8?B?Y0F6SzdZMnI1bmdHellIV01BUjBrZ3k3VVJaUXVZK0d4WDNPTTltOXVhOGxD?=
 =?utf-8?B?MzZjTmZWSXdiYlhmY1hmbXF0aFdqWHdnb2U2dFBVR3NybGowYjR3Z1d3OW52?=
 =?utf-8?B?OWxGbUdKNkIyU3d3amdIUmVVMGp3TC83MG5qdG1uVXY4RWtFWmpZRmkyZXpX?=
 =?utf-8?B?aU94SDdIYURTemRaREludnhBWlRzMXdTMUQyd3p1elVMbzVHMXB4R0tPWmZm?=
 =?utf-8?B?enNJb0Y4NHkraEx1L29wY0lOVVpEVEVGRTBNKzBSbFR6b2lEcE1IK3pqVzJv?=
 =?utf-8?B?OHZIbWhOYXJtcTBOUVArNXcxZzFBR0JlSUNYbkxpVURDQTY3MkRhRSt6TzFt?=
 =?utf-8?B?UE9OdWMwSVIwQmlCcHZwTENvRlpLSE5Dby80SnZNZ09ENDYxUWt4NmlGZ0JM?=
 =?utf-8?B?ZnJBRlk3K3k4OS9jbncweFB0bE9pdytlc1kvaXFRQmxQQUJFbjZkZllsMG14?=
 =?utf-8?B?VmRjY0RtRWxDbjBUV0tpWVo0dFdyMWUreVprUjZ6aWdwSVE2ZjhNVkFqcE9R?=
 =?utf-8?B?S1N5a2w4cE5yd0tML2RVQlN2YldwL0M3UzZ2MkpndDRtRkd6T1lkdXBhNnhH?=
 =?utf-8?B?VWJTTDRUVzR0a1JTY2ljTDJHZzMxdmlLSm1Bb01OYlRVQXpKekgvOHJNWHY4?=
 =?utf-8?B?amtRL3hHRTZxaG1qWFZ1TngvaFQvdUpWbERpVTVPUzF2dW52eVkyKzdkcnZ0?=
 =?utf-8?B?UEVybFpuRkdTeW5lMHVua0xIdE9HcWdwU1ZoY2FRMXZnNjJMVi9NWlhQY2pt?=
 =?utf-8?Q?+2lE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b755b36d-78e5-4fb6-cd7a-08ddc5cc348b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 07:25:00.7496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EhlIDuqzCfqOQ2iuzdGl6JojgtkF/0nTwUnOBjOPBY1l/mkZprxAKCf/PkRjsTaj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7327
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

On 14.07.25 14:40, Simona Vetter wrote:
> On Mon, Jul 14, 2025 at 11:50:32AM +0200, Christian König wrote:
>> On 11.07.25 23:55, Simona Vetter wrote:
>>> On Fri, Jul 11, 2025 at 10:53:42AM -0400, David Francis wrote:
>>>> The drm_gem ioctls were documented in internal file drm_gem.c
>>>> instead of uapi header drm.h. Move them there and change to
>>>> appropriate kerneldoc formatting.
>>>>
>>>> Signed-off-by: David Francis <David.Francis@amd.com>
>>>
>>> Thanks a lot for taking care of this!
>>>
>>> Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
>>>
>>> I'll leave review for the first patch to folks who care about criu, but it
>>> looked good to me too.
>>
>> I will take that as an Acked-by.
>>
>> Are you ok that we push this into drm-misc-next by the end of the week when we have the IGT test ready?
> 
> Aye, sounds like a plan.

Added the reviews, acks and links to the cover letter to the v2 from this morning and pushed the result to drm-misc-next.

We just haven't been quick enough with the IGT test (which BTW found another bug) to push it earlier.

Fingers crossed that there will be another misc-next pull request before 6.17-rc1.

Regards,
Christian.

> -Sima
> 
>>
>> The patches for the CRIU code are ready and IIRC there will be a merge
>> request made, but it will take quite a while until they are actually
>> merged I think.
> 
>>
>> Christian.
>>
>>> -Sima
>>>
>>>> ---
>>>>  drivers/gpu/drm/drm_gem.c | 30 -----------------------------
>>>>  include/uapi/drm/drm.h    | 40 +++++++++++++++++++++++++++------------
>>>>  2 files changed, 28 insertions(+), 42 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>>> index 3166230d0119..08778a15eefb 100644
>>>> --- a/drivers/gpu/drm/drm_gem.c
>>>> +++ b/drivers/gpu/drm/drm_gem.c
>>>> @@ -820,14 +820,6 @@ long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
>>>>  }
>>>>  EXPORT_SYMBOL(drm_gem_dma_resv_wait);
>>>>  
>>>> -/**
>>>> - * drm_gem_close_ioctl - implementation of the GEM_CLOSE ioctl
>>>> - * @dev: drm_device
>>>> - * @data: ioctl data
>>>> - * @file_priv: drm file-private structure
>>>> - *
>>>> - * Releases the handle to an mm object.
>>>> - */
>>>>  int
>>>>  drm_gem_close_ioctl(struct drm_device *dev, void *data,
>>>>  		    struct drm_file *file_priv)
>>>> @@ -843,17 +835,6 @@ drm_gem_close_ioctl(struct drm_device *dev, void *data,
>>>>  	return ret;
>>>>  }
>>>>  
>>>> -/**
>>>> - * drm_gem_flink_ioctl - implementation of the GEM_FLINK ioctl
>>>> - * @dev: drm_device
>>>> - * @data: ioctl data
>>>> - * @file_priv: drm file-private structure
>>>> - *
>>>> - * Create a global name for an object, returning the name.
>>>> - *
>>>> - * Note that the name does not hold a reference; when the object
>>>> - * is freed, the name goes away.
>>>> - */
>>>>  int
>>>>  drm_gem_flink_ioctl(struct drm_device *dev, void *data,
>>>>  		    struct drm_file *file_priv)
>>>> @@ -893,17 +874,6 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
>>>>  	return ret;
>>>>  }
>>>>  
>>>> -/**
>>>> - * drm_gem_open_ioctl - implementation of the GEM_OPEN ioctl
>>>> - * @dev: drm_device
>>>> - * @data: ioctl data
>>>> - * @file_priv: drm file-private structure
>>>> - *
>>>> - * Open an object using the global name, returning a handle and the size.
>>>> - *
>>>> - * This handle (of course) holds a reference to the object, so the object
>>>> - * will not go away until the handle is deleted.
>>>> - */
>>>>  int
>>>>  drm_gem_open_ioctl(struct drm_device *dev, void *data,
>>>>  		   struct drm_file *file_priv)
>>>> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
>>>> index e3940b657e16..e512da8f3baf 100644
>>>> --- a/include/uapi/drm/drm.h
>>>> +++ b/include/uapi/drm/drm.h
>>>> @@ -597,31 +597,47 @@ struct drm_set_version {
>>>>  	int drm_dd_minor;
>>>>  };
>>>>  
>>>> -/* DRM_IOCTL_GEM_CLOSE ioctl argument type */
>>>> +/**
>>>> + * struct drm_gem_close - Argument for &DRM_IOCTL_GEM_CLOSE ioctl.
>>>> + * @handle: Handle of the object to be closed.
>>>> + * @pad: Padding.
>>>> + *
>>>> + * Releases the handle to an mm object.
>>>> + */
>>>>  struct drm_gem_close {
>>>> -	/** Handle of the object to be closed. */
>>>>  	__u32 handle;
>>>>  	__u32 pad;
>>>>  };
>>>>  
>>>> -/* DRM_IOCTL_GEM_FLINK ioctl argument type */
>>>> +/**
>>>> + * struct drm_gem_flink - Argument for &DRM_IOCTL_GEM_FLINK ioctl.
>>>> + * @handle: Handle for the object being named.
>>>> + * @name: Returned global name.
>>>> + *
>>>> + * Create a global name for an object, returning the name.
>>>> + *
>>>> + * Note that the name does not hold a reference; when the object
>>>> + * is freed, the name goes away.
>>>> + */
>>>>  struct drm_gem_flink {
>>>> -	/** Handle for the object being named */
>>>>  	__u32 handle;
>>>> -
>>>> -	/** Returned global name */
>>>>  	__u32 name;
>>>>  };
>>>>  
>>>> -/* DRM_IOCTL_GEM_OPEN ioctl argument type */
>>>> +/**
>>>> + * struct drm_gem_open - Argument for &DRM_IOCTL_GEM_OPEN ioctl.
>>>> + * @name: Name of object being opened.
>>>> + * @handle: Returned handle for the object.
>>>> + * @size: Returned size of the object
>>>> + *
>>>> + * Open an object using the global name, returning a handle and the size.
>>>> + *
>>>> + * This handle (of course) holds a reference to the object, so the object
>>>> + * will not go away until the handle is deleted.
>>>> + */
>>>>  struct drm_gem_open {
>>>> -	/** Name of object being opened */
>>>>  	__u32 name;
>>>> -
>>>> -	/** Returned handle for the object */
>>>>  	__u32 handle;
>>>> -
>>>> -	/** Returned size of the object */
>>>>  	__u64 size;
>>>>  };
>>>>  
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
> 

