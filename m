Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAD098F821
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9FD10E905;
	Thu,  3 Oct 2024 20:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YQEVx35G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8742710E8FF;
 Thu,  3 Oct 2024 20:09:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ey9hH4+EANyl+FFtn1lS17aeFRnTOkdRXQkb52Ome8kvyxevU4dWkD4tpceRhjpZGU25XUHdMr6op29uTtOe08kK52XGLZv7ke/EQk6fP0v4jJ3Bx76WwHHr2tDyhHrluNA20O9RWFYb5t6uXXNO48Wp/EpA6nEeqeQOtoOXcmuZkcL+hkMhs3Q7DJfLET7SZytm45icHuVs4wMvr8owBpgKyYkNAqLgKsEzJAvhG6rFjwN5YEX/49x1hEBLgAcNwVrScmANZU7uhyBc6WeZj8UFgzkcLxav+OTrUbfrT0E/+ogaflXhNanMry4Me1ctKAWAYyvvd6YYV5WpeASHTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufZZuKG3bSsrUaxXN5pZ1lMmqa5U/y3VmqOb1Bp2ibE=;
 b=FXpuz14FB6sLg1uBGeMy/av7/6x6w/c0seyjR58duVVpezCZROSg/GK7GOR/Q97FZK2G+shcnKNpTKp+hwquVQEgG9fmPYY0TYEMzUYNpsE263fgOmel9okZfP9eA55ZwFwqBcKfzuyN/PZuIWvFi9j6SuYJzc5FNPq9yMBVVXUsd73bfma8hd17mr1+fRj6mDZboBhxCwf7UuAwsvAaX0fLaytzdstOt3JWlDD9FpyhtL/VMpgfs5hRDceKmLnXU0etKPn3WbyD7y2KwpGuA3A97aQsCrTfVkiTxJnVEYYEE5sxmqoye+G5QudH5FdftiHDR7NJguPBsMQI0JgizA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufZZuKG3bSsrUaxXN5pZ1lMmqa5U/y3VmqOb1Bp2ibE=;
 b=YQEVx35GewC1gL2F5ASOj0MD648yTfg1pOl571GO9k2kKRMl8Lekf8of5gF6vxdqmu+BV9l4bH5bL73CPYw6gj1BPbhqKHTYIAv/yaoPm+mPbfZPz1/zUbpU71wC8XGP/NXwbQSObHmh8d/53nDJymNbs/fXHf9Wak40HHDlgdg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM8PR12MB5431.namprd12.prod.outlook.com (2603:10b6:8:34::8) by
 PH8PR12MB6745.namprd12.prod.outlook.com (2603:10b6:510:1c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 20:09:24 +0000
Received: from DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::6cd6:bbdf:298b:7d20]) by DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::6cd6:bbdf:298b:7d20%6]) with mapi id 15.20.8026.017; Thu, 3 Oct 2024
 20:09:24 +0000
Message-ID: <56966046-7ce3-4a65-8be3-f6585ef90527@amd.com>
Date: Thu, 3 Oct 2024 16:09:20 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/44] Color Pipeline API w/ VKMS
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Simon Ser <contact@emersion.fr>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Alexander Goins <agoins@nvidia.com>, Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Aleix Pol <aleixpol@kde.org>, Xaver Hugl <xaver.hugl@gmail.com>,
 Victoria Brekenfeld <victoria@system76.com>, Sima <daniel@ffwll.ch>,
 Uma Shankar <uma.shankar@intel.com>, Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Arthur Grillo <arthurgrillo@riseup.net>, Hector Martin <marcan@marcan.st>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Sasha McIntosh
 <sashamcintosh@google.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
 <Zs4RudR3e5flkwcW@louis-chauvet-laptop>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <Zs4RudR3e5flkwcW@louis-chauvet-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0080.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::20) To DM8PR12MB5431.namprd12.prod.outlook.com
 (2603:10b6:8:34::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5431:EE_|PH8PR12MB6745:EE_
X-MS-Office365-Filtering-Correlation-Id: 81547578-b63d-44fa-3205-08dce3e746b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VElTR0dTRlRXZWd3a2hGK1IyQmx6bEVsR2I4Z1JveG9vZnRYTW9aWHB0eXJa?=
 =?utf-8?B?V1hKeDZFWmNMcVlnVC81VjJPUktoSkNWQ2M0QWZoTmtuaXhoWm9LN29STGYz?=
 =?utf-8?B?T3JtWitLaDVaSElWQm1PTVU4OS9aNXR2eW5Ec0sxdm1PY3RtOGVqbHhrRmky?=
 =?utf-8?B?TUJtbTQ2V3RsUDF2dWppcE40b0xyc0laTTgxbUQ5SjdRUWp6RHUya3E0VnBw?=
 =?utf-8?B?cCtvRnAwOCtPVjBpd0NnS0ExKzZEeisvTGR0UU9xUUpNN1lSMEZnem5IZmtt?=
 =?utf-8?B?Y0Z0WG4zTXVsTmxxYkJBZXR4NlV1c3lkeE5GblF1NXlRdzA5UGtINk96cEg4?=
 =?utf-8?B?enNiODRVeXMzT3IxUTEvQUFSblpsNzdUL2hxbXBBY1huRytwdHMzQ2JkRW8r?=
 =?utf-8?B?UlBhMWM5aS9iMGdmd05QZC9aaDR0b2JtaUIyT3AyV1BKR2QyVkVxSDdIK3A3?=
 =?utf-8?B?b2FrSFZzUzdhTDdNSHFtRS9ZcW9uaXkwUkhRajJYeUljWFFaekRPbWNUMnBk?=
 =?utf-8?B?aVA2VTJiZk9QdXpKWkh5bmVSTmZrTmw5V0N4ay9GTzN2Vzh6ZzJ0ME9zRDla?=
 =?utf-8?B?SDk3WGkzTmtHZThSSENLWFZraTJTYmlVU3h6d010azlYUE5aYWdJb0ZFNlFT?=
 =?utf-8?B?ZW9BckpKeEVyeFVnbXIyTVptSjEyclA4NDlyZEJQZWJGY085UVJHVXdncFhT?=
 =?utf-8?B?STYyWW9ZTjdjMHRTVE91QWZhcEltUmc5dmNNY0I4Zi9RVWRKaUVrWEFvakFp?=
 =?utf-8?B?ODA5ZHhmdUxTMndNQmtqcGgwMkpjQm5JakR2V05KVjN2UHpmM0pjdzlJR2w0?=
 =?utf-8?B?czhkalROVElxeWswVGJ2cmpiTmhoT1lGQUhjcUVFSm5iTHhnTGdKaTM1amI3?=
 =?utf-8?B?eVVDcGQxcjRXdWd6bUFUMTkwdytwRjNhVE95VldMNnFjWko0L1l2d0VNWjgx?=
 =?utf-8?B?dzN4T3hsLy9hbERSYjZYRHRCRGZ5OExNOUgyNTJmd0s3RVcvOU9xRGN4eXBM?=
 =?utf-8?B?QkozNkprTEVLMTRRbHZGL1FqaVpCenJwRWd1ZTJMT3pyWk02dTJDNDZFV1Rr?=
 =?utf-8?B?MXV3NG8vRURJNzFCNzZrNFpVeG9EaDFiL09GajdVUUd1anZ6S2FKcm1ueW9S?=
 =?utf-8?B?bkJuNzlEVWVYaGJ6R0ZkWm9tZnhGOVRCcFJqNDB3T1Y3b0trSDgzblAzYjVq?=
 =?utf-8?B?OFRoODNMOTlEYkovTGdCZytMd1NpaFMxampQYWxUd1dkZ010WWVQblZaSmNa?=
 =?utf-8?B?aFgrNXRpYkxQTkRWTEhCS09yYUlFeUNZWTJob3hYYlRBR1ByOGpKZHRLTXJV?=
 =?utf-8?B?Z1ZPZ1lpbjhjQXdDOVl5VTZJVE84Rk9aOUxCYkc0b2N6a09EZmFVemd5TDZE?=
 =?utf-8?B?UFRQckdzUXhPNWxOclVRakhtRG10MjVWZHZDbkF5S0xwWFN3RjRXbHVCaHhu?=
 =?utf-8?B?MmoxejI2cEphUEJVMnR0WllGdDl4S1FFa3BlTFJsdERTWmpQZzNnb2lMdnRr?=
 =?utf-8?B?QWpwTnF4QXRPVitMbXcydkx4Y1YvcG5sTnpleU1wTzZRWEVmQkdkTlErRlZ1?=
 =?utf-8?B?elVNbHR5aFpoNGtzanhzZVlEd2wwNVBXWU1OanUwUVc1Z09qSUV6cUFoUXQw?=
 =?utf-8?Q?ggK5SiaE3YpsUFtk+16LznF5FB6xkjMG1K5RIAenfV60=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5431.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0ZFSVplM3U2S2l6T2JudlMrZi9vU0ZVUGdOTzFLbkk2RWIxa3lmenNNK3FZ?=
 =?utf-8?B?U01qRmc4Z1FBcWEzRGVRc1hrL21sZjFOd0dlbzQ4Uzc3dFJLTHZDK3lIdXdG?=
 =?utf-8?B?MlFjK1lOUWdVM0JEcTJpdGhpcStRdks0NkVzL0FKa0puWVNiS01wekZlUGxB?=
 =?utf-8?B?TDJCak8yQjhSeVpmdTdDZWdsL0ZRdlFDM1l3YjNIL3dZeGhxR2lsa3VQd0Ju?=
 =?utf-8?B?UG5VU1hkZTlZQ0UrMnRNUVFvSzExTTBndm1lTDVDTDNFWk1RM2NxOEFVRlZl?=
 =?utf-8?B?bytkb0JnMU5UTVpFOE5pU0xqVmZoTDZ4ZXBVcGE2K2xjbmZ0Ynk4TWd6Vjhl?=
 =?utf-8?B?MW5rNWVjOXRkZEJ1bDBSWG1Yb0lWNFFoSnVJazc3N3g2d3owN003RlpmT1dB?=
 =?utf-8?B?UkVhUFk5bkxFUjFLVmFiWHpJMVpSeS9KWEVzb3pTMXY1N1dwRldWbENxcHJ5?=
 =?utf-8?B?QWhGR1RkUDhNVTNUU2l0UEVSUXU0SWo1cW5GYTBuU0FmMlVJV0RvSTU1TGFn?=
 =?utf-8?B?VGNDckU1QVFnTzEvMlFKblI0L0FtanRPYU91OTRCRjZwY3M1TFpqWVpHaWRS?=
 =?utf-8?B?S1gxZVYzaThMTmlIeStDaW1PQmpNLzRZbVZzOTBSZGZOdExEUDdEeDJPM1oy?=
 =?utf-8?B?dkdQalFwUVh0TTd0SG1JcHVtYWlINzZpYks3amhFOVhrK1BvSTNBME9uS2Ez?=
 =?utf-8?B?RDRLUFZiTlZqMExTdCtjVXhRdUN6aVExamJBY1VqWlNDUDZHUjZzZm80UTR0?=
 =?utf-8?B?c3hxc2pEeitvSkJzYk1OVE14YWdJL1BTNTlNZi8xREh0RFoyTUdtRm5XYi8v?=
 =?utf-8?B?OVV0Z1QzN3hGTGRsV0ZCQnljNGNZWkVVNWsxNU5rVEZnRnUya2lRd1RqTGY2?=
 =?utf-8?B?aXIvVWZYS2ZrTkdRdE5xb016RHZKYm9OZUxSSjFMMG91Sm9VMHd2VUFsdzI4?=
 =?utf-8?B?UjRJdXFiWGtQak5zd0prVk11cUhJOVNUM3gzY1UwUmNMTFk4UEZHS2xuWVNC?=
 =?utf-8?B?NzB2YmoxOGV6UW5uNUl0WHpZTzlMakNYdzZUNE5SM0ZlRFdDdGtNU2Q5Smtr?=
 =?utf-8?B?bGdyellXSXpnWEIzQmVZLzFnUS9wUTI5d2RlMnJ6VVZYdnd3K1AzRDg5VERw?=
 =?utf-8?B?dGZ3OUVTWHBBMlRMbmNQKzU0VW1JMWVVK1FpcVhhcFovbmpFL0dGUW1Bdm5E?=
 =?utf-8?B?UGpsVldnOCthYStmUXRoNEJiTWIwQmY0QzVNdzlWLzdsUWExRjllYS9SNXA2?=
 =?utf-8?B?YkNuZk90bkZJOU9TK2tNYkFLSjRXd1gvNnJjNWhmSytDWE9jVjIvSUhjM1J0?=
 =?utf-8?B?K3FCNkxDTkxjVWNIdGNmblhRN1ZEN3pDdEpmcmJyd0dyNmFFMXJzWG5DMDJO?=
 =?utf-8?B?OEoza0xyNktROEZmKytiNmxOa3Y3d1FpQlBUU3YzQjBxTkd4dytCMklCVWJE?=
 =?utf-8?B?N1JnS0J4eEhyN0VrYk5SQlpuWkRyem9nQWl4OFIwYWxQR3U3Vzd1ZEYyVFpD?=
 =?utf-8?B?bTl3c0poVXQvZU52ckVPSkMxNVI0a090aERtNmhHT3dmOHNqOEFlUnRLbTZ0?=
 =?utf-8?B?eTVpUCs0MGJDdHA2Rmw3TURnMFNLWkpONHpuTGFqakhySTl0TEpVM0hJWVBu?=
 =?utf-8?B?OXNCelphc0RLSVRvSmNCMVA4YXpGcDg5SFAvT0U0aWVURkxKTTY5VTVZakRs?=
 =?utf-8?B?OEgrOUZ4WUNRdUxxMVVOS3loek9tTGRvNkV4djFramtmRkl5RVBVWHpxdm5L?=
 =?utf-8?B?emxYVWpqOWpxMEVTNUZXWEY2cmRqeEpSUk1XUTJKeGxTcFJLNjJBQ0djdHNm?=
 =?utf-8?B?a0p1RUZuSUUyb0ZTUitJR3MrUkJVM21XdUlMUWJQNnJqdEx2ZUpac215WU9h?=
 =?utf-8?B?b2o0KzJFU1ZOK25hWm9UYnNnVUcrV3QyckVPdENoejYxdmxSeHNBVDd0Mkg5?=
 =?utf-8?B?UUU3NmZDOHU1VHdiSzBqbElTZ2pLb05RSTJDeXBpN0RmaDExbno2L0orQWEv?=
 =?utf-8?B?aVFCaWdZRjRQUERwY3l4SlY5MGkxaExCZWI0V1JYQVJobXVQNkdVd1NIWE1I?=
 =?utf-8?B?cmN3SXV1eStoVkd1TFh0RVR5ak5MdHduTzR0RUo4akFzdHZ6WnBBaUhpbW5n?=
 =?utf-8?Q?sHJJ19uzVLRdLZPUXG4LmF0pn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81547578-b63d-44fa-3205-08dce3e746b0
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5431.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:09:24.4481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2JqdJzRVW0tVIV3ituM6FdvGKDOWdjYlKa1o0Y8ysZmgVMS40soqeNANZ8znWTb+LJyRXtXMhKPpOKccntw5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6745
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



On 2024-08-27 13:49, Louis Chauvet wrote:
> Le 19/08/24 - 16:56, Harry Wentland a écrit :
>> This is an RFC set for a color pipeline API, along with implementations
>> in VKMS and amdgpu. It is tested with a set of IGT tests that can be
>> found at [1]. The IGT tests run a pixel-by-pixel comparison with an
>> allowable delta variation as the goal for these transformations is
>> perceptual correctness, not complete pixel accuracy.
>>
>> v5 of this patchset fleshed out documentation for colorops and the
>> various defines that are being introduced.
>>
>> VKMS supports two named transfer function colorops and two matrix
>> colorops.
>>
>> Amdgpu advertises the following pipeline for GPUs with DCN 3 or newer:
>>
>> 1. 1D Curve EOTF
>> 2. 3x4 CTM
>> 3. Multiplier
>> 4. 1D Curve Inverse EOTF
>> 5. 1D LUT
>> 6. 3D LUT
>> 7. 1D Curve EOTF
>> 8. 1D LUT
>>
>> The supported curves for the 1D Curve type are:
>> - sRGB EOTF and its inverse
>> - PQ EOTF, scaled to [0.0, 125.0] and its inverse
>> - BT.2020/BT.709 OETF and its inverse
>>
>> Note that the 1st and 5th colorops take the EOTF or Inverse
>> OETF while the 3rd colorop takes the Inverse EOTF or OETF.
>>
>> The 3D LUT is a 17^3 tetrahedrally interpolated LUT but the mechanism
>> exists for other drivers to describe their own 3D LUT capability.
>>
>> This mirrors the color pipeline used by gamescope and presented by
>> Melissa Wen, with the exception of the DEGAM LUT, which is not currently
>> used. See [1]
>> https://indico.freedesktop.org/event/4/contributions/186/attachments/138/218/xdc2023-TheRainbowTreasureMap-MelissaWen.pdf
>>
>> At this point we're hoping to see gamescope and kwin implementations
>> take shape. The existing pipeline should be enough to satisfy the
>> gamescope use-cases on the drm_plane.
>>
>> In order to support YUV we'll need to add COLOR_ENCODING and COLOR_RANGE
>> support to the color pipeline. I have sketched these out already but
>> don't have it all hooked up yet. This should not hinder adoption of this
>> API for gaming use-cases.
>>
>> We'll also want to advertise IN_FORMATS on a color pipeline as some
>> color pipelines won't be able to work for all IN_FORMATS on a plane.
>> Again, I have a sketch but no full implementation yet. This is not
>> currently required by the AMD color pipeline and could be added after
>> the merge of this set.
>>
>> VKMS patches could still be improved in a few ways, though the
>> payoff might be limited and I would rather focus on other work
>> at the moment. The most obvious thing to improve would be to
>> eliminate the hard-coded LUTs for identity, and sRGB, and replace
>> them with fixed-point math instead.
> 
> Hi!
> 
> I reviewed your VKMS patches and added a few comments in your series. This 
> series looks very good.
> 

Thanks so much for your review. v6 just went out.

Harry

> Thanks for this work,
> Louis Chauvet
>  
>> There are plenty of things that I would like to see, but they could
>> be added after the merge of this patchset:
>>  - COLOR_ENCODING and COLOR_RANGE
>>  - IN_FORMATS for a color pipeline
>>  - Is it possible to support HW which can't bypass entire pipeline?
>>  - Can we do a LOAD / COMMIT model for LUTs (and other properties)?
>>  - read-only scaling colorop which defines scaling taps and position
>>  - named matrices, for things like converting YUV to RGB
>>  - Add custom LUT colorops to VKMS
>>
>> IGT tests can be found at [1] or on the igt-dev mailing list.
>>
>> A kernel branch can be found at [2].
>>
>> I've also rebased Uma and Chaitanya's patches for the Intel color
>> pipeline on top of this to show how I envision them to mesh with
>> my changes. The relevant branches can be found at [3] for the kernel
>> and [4] for IGT. There were some rebase conflicts in i915 and I'm
>> not entirely sure I've resolved all of them correctly, but the branch
>> compiles and shows my thoughts for the new DRM concepts to support
>> Intel's pipeline.
>>
>> [1] https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/amd-color-pipeline-v5
>> [2] https://gitlab.freedesktop.org/hwentland/linux/-/tree/amd-color-pipeline-v5
>> [3] https://gitlab.freedesktop.org/hwentland/linux/-/tree/amd-intel-color-pipeline-v5
>> [4] https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/amd-intel-color-pipeline-v5
>>
>>
>> v5:
>>  - amdgpu 3D LUT
>>  - Don't require BYPASS
>>  - update RFC docs and add to TOC tree
>>  - add drm_colorop and COLOR_PIPELINE kernel docs (non-RFC)
>>  - add amdgpu color pipeline doc
>>  - define SIZE property similar to drm_crtc's GAMMA_SIZE
>>  - various minor fixes and cleanups
>>
>> v4:
>>  - Add amdgpu color pipeline (WIP)
>>  - Don't block setting of deprecated properties, instead pass client cap
>>    to atomic check so drivers can ignore these props
>>  - Drop IOCTL definitions (Pekka)
>>  - Use enum property for colorop TYPE (Pekka)
>>  - A few cleanups to the docs (Pekka)
>>  - Rework the TYPE enum to name relation to avoid code duplication (Pekka)
>>  - Add missing function declarations (Chaitanya Kumar Borah)
>>  - Allow setting of NEXT property to NULL in _set_ function (Chaitanya Kumar Borah)
>>  - Add helper for creation of pipeline drm_plane property (Pekka)
>>  - Always create Bypass pipeline (Pekka)
>>  - A bunch of changes to VKMS kunit tests (Pekka)
>>  - Fix index in CTM doc (Pekka)
>>
>> v3:
>>  - Abandon IOCTLs and discover colorops as clients iterate the pipeline
>>  - Remove need for libdrm
>>  - Add color_pipeline client cap and make mutually exclusive with
>>    COLOR_RANGE and COLOR_ENCODING properties
>>  - add CTM colorop to VKMS
>>  - Use include way for kunit testing static functions (Arthur)
>>  - Make TYPE a range property
>>  - Move enum drm_colorop_type to uapi header
>>  - and a bunch of smaller bits that are highlighted in the relevant commit
>>    description
>>
>> v2:
>>  - Rebased on drm-misc-next
>>  - Introduce a VKMS Kunit so we can test LUT functionality in vkms_composer
>>  - Incorporate feedback in color_pipeline.rst doc
>>  - Add support for sRGB inverse EOTF
>>  - Add 2nd enumerated TF colorop to VKMS
>>  - Fix LUTs and some issues with applying LUTs in VKMS
>>
>> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
>> Cc: Simon Ser <contact@emersion.fr>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Melissa Wen <mwen@igalia.com>
>> Cc: Jonas Ådahl <jadahl@redhat.com>
>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>> Cc: Alexander Goins <agoins@nvidia.com>
>> Cc: Joshua Ashton <joshua@froggi.es>
>> Cc: Michel Dänzer <mdaenzer@redhat.com>
>> Cc: Aleix Pol <aleixpol@kde.org>
>> Cc: Xaver Hugl <xaver.hugl@gmail.com>
>> Cc: Victoria Brekenfeld <victoria@system76.com>
>> Cc: Sima <daniel@ffwll.ch>
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
>> Cc: Christopher Braga <quic_cbraga@quicinc.com>
>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Cc: Arthur Grillo <arthurgrillo@riseup.net>
>> Cc: Hector Martin <marcan@marcan.st>
>> Cc: Liviu Dudau <Liviu.Dudau@arm.com>
>> Cc: Sasha McIntosh <sashamcintosh@google.com>
>> Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>
>> Alex Hung (13):
>>   drm/colorop: define a new macro for_each_new_colorop_in_state
>>   drm/amd/display: Skip color pipeline initialization for cursor plane
>>   drm/amd/display: Add support for sRGB EOTF in DEGAM block
>>   drm/amd/display: Add support for sRGB Inverse EOTF in SHAPER block
>>   drm/amd/display: Add support for sRGB EOTF in BLND block
>>   drm/colorop: Add 1D Curve Custom LUT type
>>   drm/amd/display: add shaper and blend colorops for 1D Curve Custom LUT
>>   drm/amd/display: add 3x4 matrix colorop
>>   drm/colorop: Add mutliplier type
>>   drm/amd/display: add multiplier colorop
>>   drm/amd/display: Swap matrix and multiplier
>>   drm/colorop: Add 3D LUT supports to color pipeline
>>   drm/amd/display: add 3D LUT colorop
>>
>> Harry Wentland (31):
>>   drm: Add helper for conversion from signed-magnitude
>>   drm/vkms: Round fixp2int conversion in lerp_u16
>>   drm/vkms: Add kunit tests for VKMS LUT handling
>>   drm/doc/rfc: Describe why prescriptive color pipeline is needed
>>   drm/colorop: Introduce new drm_colorop mode object
>>   drm/colorop: Add TYPE property
>>   drm/colorop: Add 1D Curve subtype
>>   Documentation/gpu: document drm_colorop
>>   drm/colorop: Add BYPASS property
>>   drm/colorop: Add NEXT property
>>   drm/colorop: Add atomic state print for drm_colorop
>>   drm/plane: Add COLOR PIPELINE property
>>   drm/colorop: Add NEXT to colorop state print
>>   drm/vkms: Add enumerated 1D curve colorop
>>   drm/vkms: Add kunit tests for linear and sRGB LUTs
>>   drm/colorop: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
>>   drm/colorop: Add 3x4 CTM type
>>   drm/vkms: Use s32 for internal color pipeline precision
>>   drm/vkms: add 3x4 matrix in color pipeline
>>   drm/tests: Add a few tests around drm_fixed.h
>>   drm/vkms: Add tests for CTM handling
>>   drm/colorop: pass plane_color_pipeline client cap to atomic check
>>   drm/amd/display: Ignore deprecated props when plane_color_pipeline set
>>   drm/amd/display: Add bypass COLOR PIPELINE
>>   drm/colorop: Add PQ 125 EOTF and its inverse
>>   drm/amd/display: Enable support for PQ 125 EOTF and Inverse
>>   drm/colorop: add BT2020/BT709 OETF and Inverse OETF
>>   drm/amd/display: Add support for BT.709 and BT.2020 TFs
>>   drm/colorop: Define LUT_1D interpolation
>>   drm/colorop: allow non-bypass colorops
>>   drm/amd/display: Add AMD color pipeline doc
>>
>>  Documentation/gpu/drm-kms.rst                 |  15 +
>>  Documentation/gpu/rfc/color_pipeline.rst      | 376 ++++++++
>>  Documentation/gpu/rfc/index.rst               |   3 +
>>  drivers/gpu/drm/Makefile                      |   1 +
>>  .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   3 +-
>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   4 +
>>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 581 ++++++++++++-
>>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 196 +++++
>>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  36 +
>>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  32 +
>>  drivers/gpu/drm/drm_atomic.c                  | 184 +++-
>>  drivers/gpu/drm/drm_atomic_helper.c           |  12 +
>>  drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
>>  drivers/gpu/drm/drm_atomic_uapi.c             | 175 ++++
>>  drivers/gpu/drm/drm_colorop.c                 | 562 ++++++++++++
>>  drivers/gpu/drm/drm_ioctl.c                   |   7 +
>>  drivers/gpu/drm/drm_mode_config.c             |   7 +
>>  drivers/gpu/drm/drm_plane.c                   |  52 ++
>>  drivers/gpu/drm/tests/Makefile                |   3 +-
>>  drivers/gpu/drm/tests/drm_fixp_test.c         |  69 ++
>>  drivers/gpu/drm/vkms/Kconfig                  |   5 +
>>  drivers/gpu/drm/vkms/Makefile                 |   4 +-
>>  drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
>>  drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 449 ++++++++++
>>  drivers/gpu/drm/vkms/vkms_colorop.c           | 102 +++
>>  drivers/gpu/drm/vkms/vkms_composer.c          | 115 ++-
>>  drivers/gpu/drm/vkms/vkms_drv.h               |   8 +
>>  drivers/gpu/drm/vkms/vkms_luts.c              | 802 ++++++++++++++++++
>>  drivers/gpu/drm/vkms/vkms_luts.h              |  12 +
>>  drivers/gpu/drm/vkms/vkms_plane.c             |   2 +
>>  include/drm/drm_atomic.h                      | 130 +++
>>  include/drm/drm_atomic_uapi.h                 |   3 +
>>  include/drm/drm_colorop.h                     | 427 ++++++++++
>>  include/drm/drm_file.h                        |   7 +
>>  include/drm/drm_fixed.h                       |  18 +
>>  include/drm/drm_mode_config.h                 |  18 +
>>  include/drm/drm_plane.h                       |  19 +
>>  include/uapi/drm/amdgpu_drm.h                 |   9 -
>>  include/uapi/drm/drm.h                        |  16 +
>>  include/uapi/drm/drm_mode.h                   | 156 ++++
>>  40 files changed, 4595 insertions(+), 34 deletions(-)
>>  create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
>>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
>>  create mode 100644 drivers/gpu/drm/drm_colorop.c
>>  create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c
>>  create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
>>  create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_tests.c
>>  create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
>>  create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
>>  create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
>>  create mode 100644 include/drm/drm_colorop.h
>>
>> --
>> 2.46.0
>>

