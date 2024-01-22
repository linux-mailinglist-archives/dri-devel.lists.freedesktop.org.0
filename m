Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A28835CB9
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 09:34:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D979D10EB58;
	Mon, 22 Jan 2024 08:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C0310EB4B;
 Mon, 22 Jan 2024 08:34:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=meOR6n+C63WfgwEtRL5rxaftcmN4j+aUTJ3SqSddshfS8RtjrjJjzsoB0Y4A7H36/toZwTsG+EgVVNAmr0NZ+qaudfXBTmfwP881Lhj979D3zl7x+9HFpSHthd7snPywGA/UT9oZcVCvWMB+IeLGXnuaWKmFgrxdH4vKny0ZuW9cpE1zOgrKYaz4MPvDLmnBu7eHa3jBE1Im045f1SwKWImORA3n04681AGqVxHVsd1McpKxD409CBxG+C/thisqYtGhlwEqPLjlseh2WdP3ERVLMAAp5Fq5mYnC2xM2eXfbsABHyYDFJ182FHeWy0RK9GMBPdode5b7H2dQrgZdZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4iuSsyokAbKr+MKQ36R3YFlG94/7tqoaalWBQdoCdM=;
 b=QS8tgchpiOYlOdBOnBMA0GMPhC6zxLOvf16y2nMtrzjOCwsVkJG6XgOoqP1lG9sGyeXtbYrbH8IKueNvsVd67bMQFd1HN6UFrd0Nj4rWgIB7OFi+V6Zp/i1ovaXi9L8JAhJnJEcdsqRSvehxITspztrDHoYvnYapN8a9zt/6fyEI0EIn6HIbrQCrNsFdNukRrhB5golX6Kwe7WItX0iiluYdbuo/Is8TGzY5putddfvt3DQs6jqYgmIy9fNg2/tFoW50toCQ2dPLeLMefAk1OpDxsQwNOYkORx4WTzJ9OrZ2htnFg8R66izEZHOeA78HXeOf3INxjdnPfv6m/ITxig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4iuSsyokAbKr+MKQ36R3YFlG94/7tqoaalWBQdoCdM=;
 b=1Ur6sIgboOtm6xqNrykY6hLWD3/n4kF9fIxhuu6r76Ifci5HmDlwTvqDHGhmPeYtcRG1gET6gnl/Slx1h/4RXgcEJkgXbNB+m1JWubREitGaZsaN/4b5f7RK728jVQ/QwuXPV+wmFElTVS0L5hs5VO2qseEq7sNLahJOdhnBN/o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6351.namprd12.prod.outlook.com (2603:10b6:8:a2::6) by
 IA0PR12MB7721.namprd12.prod.outlook.com (2603:10b6:208:433::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Mon, 22 Jan
 2024 08:34:16 +0000
Received: from DM4PR12MB6351.namprd12.prod.outlook.com
 ([fe80::831c:60ba:97df:9720]) by DM4PR12MB6351.namprd12.prod.outlook.com
 ([fe80::831c:60ba:97df:9720%4]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 08:34:16 +0000
Message-ID: <1bc1a054-2aa8-4229-9a05-df7bac1ec0d8@amd.com>
Date: Mon, 22 Jan 2024 16:34:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: BUG [RESEND]: kernel NULL pointer dereference, address:
 0000000000000008
Content-Language: en-US
To: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
References: <83b9077a-3de8-464a-bd64-d32869b3728c@alu.unizg.hr>
 <b6336db1-be2c-418d-b45d-e715ae19507a@alu.unizg.hr>
From: "Ma, Jun" <majun@amd.com>
In-Reply-To: <b6336db1-be2c-418d-b45d-e715ae19507a@alu.unizg.hr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To DM4PR12MB6351.namprd12.prod.outlook.com
 (2603:10b6:8:a2::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6351:EE_|IA0PR12MB7721:EE_
X-MS-Office365-Filtering-Correlation-Id: b5923316-73e1-4af3-3a66-08dc1b24eb6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bNMz2YjMYz3gY6I59D2hzbXtjK5OWV11mfCTALMZW4a2qNXcLwY4KYwyraA/8+8nilvZtCFMy00JSzM7BmZP8gJBUq0sIs5K+3l9nweRodJI/GVveVZR6THexZRH1kq8YfwJdlbVCjv0PfY5eMJX0DscyfwKsgzwQEvQn+IaGBLD1G5dzL8sipJXAxcpF8Jm6MW+ABMXeQ58HEaELS4l9VRLOWgJz6eEcc/IlQXNKGk+tjgpmELGegSZHIDgrQRpJryej+OixfgeEZ+mYwEf/rMX/RwCKhH+til7MQxz8z2aYRfkUI8Sqfs2ByyTm34SQnbuXeeBvPNHfdqzGsGJ6A9JtN/rRzABKv0TZYhjyWn+pjp4yOdTuvIXAnlCr/znrkX65//GD3ELWWtc+pDSXY++3r7g3EpkFHThTvYEGhta+77wPn/wj3Fsf/AY+eEKssC+Ffgq8Y4Gbfynlbxo0b33D12bpMFndAQhB/LAG3FFQ3Ud/Hg9pkC/ZLX8YeOtCbpCaPMU91c+xLroVOqJw5oNpA+WC22spg2xUEG9znRzss9yhTqSfnFcePZR+JMKoluwf8dLX9sqBWFdzmRgHdLzMH46cv9ERz7FVhOhe+ziuWLP+LRU4eh7NdXiZ98A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6351.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(376002)(346002)(396003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(31686004)(6512007)(53546011)(6486002)(6506007)(966005)(83380400001)(2616005)(4326008)(5660300002)(8676002)(8936002)(316002)(6666004)(45080400002)(54906003)(66476007)(66556008)(66946007)(478600001)(26005)(38100700002)(30864003)(2906002)(36756003)(31696002)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHRJLy90S0ZycHd5cU1Nc2VvVUphVXd0WUhPaTJJYkpmZG9rSkZ4UkF0S2s3?=
 =?utf-8?B?L012eDdEd3M0L0tBZHJiVjBTWXVuZTFJRzh0YVdxWDNSM0Z6RGhGd1N5Lzkz?=
 =?utf-8?B?MXFuL2doQW9nZWZqRC9reXNjZlhham1ZS2RZSUhTdThFYUg0dmJsNVJNREFJ?=
 =?utf-8?B?SFdOUVo2YnFSZ1pGZG9BVjFUazdYbGZ3VkFscG55S3F4TUh4YlhwYlZSTTBi?=
 =?utf-8?B?NDRsQ010d1dQRVV2eWpLdzFoUTI0YXFMMU1NYm41eVZqWTEyYU5wRjBYejk1?=
 =?utf-8?B?dk9meS9TN2pVZGlrVHBsaExVbmVxTVpRUDNJdDJRV0h5RXNsM2o1L1g0Ty90?=
 =?utf-8?B?VWVwclcySjcwWnBad096MFpmQ1NmSWgzc2tKTkF1d2lpTzVrS3hIc3ZYamM4?=
 =?utf-8?B?c1hQY01WOXNkOGROZ3hVa0lqcDgxYnh6NC94MWx0ZFlNVmdaWlVVQ1ZvSHhy?=
 =?utf-8?B?ZGhOYUtNaDJaM3M0dlU2ZjRLS1A4ZzdHaWE1WkVGNTRPQXJJQXFpVldPMGN3?=
 =?utf-8?B?dkE4NWxGTTI0WU5IUVVXdUUrbDQ1dXdCY1ZnS0tsS3RDMVNCUDdjUy9ldlhS?=
 =?utf-8?B?b2NxeFgyY1ZTbWVWajAxcmY4a3FQeG82Njk2S1hIYWFxU1M2WHNJVVBMOVhq?=
 =?utf-8?B?elF5aEFKVmZRRUFWRzFSN1Zub1pJdXo3aE04OGZwZlFYa3VaQ2Y2YjhRTzZs?=
 =?utf-8?B?VUg1bWhRRDRteGxZOFFwMTluUWZCQUhES01XNWxVc3AxSWhvR1E4MHlqSjJ5?=
 =?utf-8?B?bFdtWk9rZ281a0pGYysvYW1nb2ZhM2lDVjd2VnN5SnJ4aTd6V2tnQzJsWWMx?=
 =?utf-8?B?VmVQUFRjRzRsdVhNdThyd3BiSTBHSTU2cisxSFp2cTR5c1FRVE1RK3UzUFlR?=
 =?utf-8?B?eW9BeTMzVUdxZDZhS0dtOFpnRTBvcTZ2VmY1Q3FWdWpjNUJ3eFlrcUZLb1Jk?=
 =?utf-8?B?YUxqQUtzKzhSNFlLY0hJSlJVbk80S2d1RlVNeXpFSW1lUXlDNHhZQi9FUXEv?=
 =?utf-8?B?REFGSzBrOUhyY2tVQXJCWTBZcVRiVjdtWlZIKzRLTzhXWXMxRTUrRDR2ZFhF?=
 =?utf-8?B?QnRmZ0szSjhlTWR3ZmV4T21Xaml2ajhTV1N6MTh0RytDWE9aaklrVUVUd2p0?=
 =?utf-8?B?S21SU3U2TzhYa013VmtWajlxOWtEdjdvL3VUanNwMlozd0FHcUZjSlJDajQ5?=
 =?utf-8?B?UU0zdUZkQ1NDMzFWNTRqanpVenIxVG85a3MvQWkwYW4yZUdmYTBzd2dVOHVY?=
 =?utf-8?B?OHFBTDBId2dENUlINUpMdkpRU0VqY200dWNva1ljZEZqZy8yemN2VUx0WW12?=
 =?utf-8?B?TXpmRm1hdU5KVm1DRktoTnZHUFNuRXB3MkRGaWJVNTBnNTNmMlBuekF5MnNv?=
 =?utf-8?B?SjAvZ3VoMnAzZjQ2RnJuNXhIYVpsWjhzYzJtU2xCa2pHTW0xdXZ4azRFelJ0?=
 =?utf-8?B?TW1RYWR1c2ZuNzZXY09lQklFK0ljbmR3d0lkWTVUbnd1OVI3a3o4TTdqVC9v?=
 =?utf-8?B?NVQ4ODZnbWJHdCswYUFVb29UV2R0MVlybk95RFBEdnRRSUcxWTdpL21ocUI5?=
 =?utf-8?B?Ty9McnlPOWhQN1h1dVNmcU5acXlUOUpyV2MrdlVDQ1o1MjV6TWhKKzhOem84?=
 =?utf-8?B?ZkNXQURvNnQzT3NsSDBWLzFRaGpyRGVwZjU2Sk5OejZxN2JZM2NpQkRrRkFY?=
 =?utf-8?B?dEVjZjNBOWl4R3JNaXdoQ3NkU2dOcE54YS9pVXYrblQwb2hrSzRNdzM1aFRF?=
 =?utf-8?B?YnVkVlBXcks5Rjg2NmhkRFJEV0R4bXdibGY5ZSszemtmWkFqaDNuY3pvWGYx?=
 =?utf-8?B?ZDJxekFmaU14ZTM1N0lmaXJjNmxNdmlEMXNKdjFWbFhLNU5IcUJSZGF0ZUp1?=
 =?utf-8?B?d1o1UnFkc0k1REJYY0NZaGxjNmQ3NncreGJjaUw3VllIWEtNM1hYL3ozaFYy?=
 =?utf-8?B?TG5zUlQrdmVTK1A5cGJiOG9CaVV5MXJNK0VtbVFqM2JwUHJTNDNPVVJwYXBn?=
 =?utf-8?B?MzltTjdKdDNNdlVybVhBN1lkSlFHcjlqWHJabm9HNG5kK3BYUzFRZGM1Y0ta?=
 =?utf-8?B?MUJubjcrbEVjSExpUzZCZFRWVlZ1aSsycmxOaXZFdHdteTRQVUR6TW90YmN0?=
 =?utf-8?Q?ZTPJzAzx3HTjA61VDSVVT/dND?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5923316-73e1-4af3-3a66-08dc1b24eb6c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6351.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 08:34:16.5514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AbgrGW4+YDjeQ31DJIU7afoYLznOagAw97IdhlR5WhJQemxMKnmTP4cxjmwQbOP/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7721
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
Cc: Sathishkumar S <sathishkumar.sundararaju@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Guchun Chen <guchun.chen@amd.com>, majun@amd.com,
 David Airlie <airlied@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Boyuan Zhang <boyuan.zhang@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Francis <David.Francis@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Lang Yu <Lang.Yu@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Perhaps similar to the problem I encountered earlier, you can
try the following patch

https://lists.freedesktop.org/archives/amd-gfx/2024-January/103259.html

Regards,
Ma Jun

On 1/21/2024 3:54 AM, Mirsad Todorovac wrote:
> Hi,
>=20
> The last email did not pass to the most of the recipients due to banned .=
xz attachment.
>=20
> As the .config is too big to send inline or uncompressed either, I will o=
mit it in this
> attempt. In the meantime, I had some success in decoding the stack trace,=
 but sadly not
> complete.
>=20
> I don't think this Oops is deterministic, but I am working on a reproduce=
r.
>=20
> The platform is Ubuntu 22.04 LTS.
>=20
> Complete list of hardware and .config is available here:
>=20
> https://domac.alu.unizg.hr/~mtodorov/linux/bugreports/amdgpu/6.7.0-rtl-v0=
.2-nokcsan-09928-g052d534373b7/
>=20
> Best regards,
> Mirsad
>=20
> -------------------------------------------------------------------------=
------------------
> kernel: [    5.576702] BUG: kernel NULL pointer dereference, address: 000=
0000000000008
> kernel: [    5.576707] #PF: supervisor read access in kernel mode
> kernel: [    5.576710] #PF: error_code(0x0000) - not-present page
> kernel: [    5.576712] PGD 0 P4D 0
> kernel: [    5.576715] Oops: 0000 [#1] PREEMPT SMP NOPTI
> kernel: [    5.576718] CPU: 9 PID: 650 Comm: systemd-udevd Not tainted 6.=
7.0-rtl-v0.2-nokcsan-09928-g052d534373b7 #2
> kernel: [    5.576723] Hardware name: ASRock X670E PG Lightning/X670E PG =
Lightning, BIOS 1.21 04/26/2023
> kernel: [    5.576726] RIP: 0010:gfx_v10_0_early_init (drivers/gpu/drm/am=
d/amdgpu/gfx_v10_0.c:4009 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7478) amdg=
pu
> kernel: [ 5.576872] Code: 8d 55 a8 4c 89 ff e8 e4 83 ec ff 41 89 c2 83 f8=
 ed 0f 84 b3 fd ff ff 85 c0 74 05 0f 1f 44 00 00 49 8b 87 08 87 01 00 4c 89=
 ff <48> 8b 40 08 0f b7 50 0a 0f b7 70 08 e8 e4 42 fb ff 41 89 c2 85 c0
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>     0:	8d 55 a8             	lea    -0x58(%rbp),%edx
>     3:	4c 89 ff             	mov    %r15,%rdi
>     6:	e8 e4 83 ec ff       	call   0xffffffffffec83ef
>     b:	41 89 c2             	mov    %eax,%r10d
>     e:	83 f8 ed             	cmp    $0xffffffed,%eax
>    11:	0f 84 b3 fd ff ff    	je     0xfffffffffffffdca
>    17:	85 c0                	test   %eax,%eax
>    19:	74 05                	je     0x20
>    1b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
>    20:	49 8b 87 08 87 01 00 	mov    0x18708(%r15),%rax
>    27:	4c 89 ff             	mov    %r15,%rdi
>    2a:*	48 8b 40 08          	mov    0x8(%rax),%rax		<-- trapping instruc=
tion
>    2e:	0f b7 50 0a          	movzwl 0xa(%rax),%edx
>    32:	0f b7 70 08          	movzwl 0x8(%rax),%esi
>    36:	e8 e4 42 fb ff       	call   0xfffffffffffb431f
>    3b:	41 89 c2             	mov    %eax,%r10d
>    3e:	85 c0                	test   %eax,%eax
>=20
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     0:	48 8b 40 08          	mov    0x8(%rax),%rax
>     4:	0f b7 50 0a          	movzwl 0xa(%rax),%edx
>     8:	0f b7 70 08          	movzwl 0x8(%rax),%esi
>     c:	e8 e4 42 fb ff       	call   0xfffffffffffb42f5
>    11:	41 89 c2             	mov    %eax,%r10d
>    14:	85 c0                	test   %eax,%eax
> kernel: [    5.576878] RSP: 0018:ffffa5b3c103f720 EFLAGS: 00010282
> kernel: [    5.576881] RAX: 0000000000000000 RBX: ffffffffc1d73489 RCX: 0=
000000000000000
> kernel: [    5.576884] RDX: 0000000000000000 RSI: 0000000000000000 RDI: f=
fff91ae4fa80000
> kernel: [    5.576886] RBP: ffffa5b3c103f7b0 R08: 0000000000000000 R09: 0=
000000000000000
> kernel: [    5.576889] R10: 00000000ffffffea R11: 0000000000000000 R12: f=
fff91ae4fa986e8
> kernel: [    5.576892] R13: ffff91ae4fa986d8 R14: ffff91ae4fa986f8 R15: f=
fff91ae4fa80000
> kernel: [    5.576895] FS:  00007fdaa343c8c0(0000) GS:ffff91bd58440000(00=
00) knlGS:0000000000000000
> kernel: [    5.576898] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> kernel: [    5.576900] CR2: 0000000000000008 CR3: 00000001222d0000 CR4: 0=
000000000750ef0
> kernel: [    5.576903] PKRU: 55555554
> kernel: [    5.576905] Call Trace:
> kernel: [    5.576907]  <TASK>
> kernel: [    5.576909] ? show_regs (arch/x86/kernel/dumpstack.c:479)
> kernel: [    5.576914] ? __die (arch/x86/kernel/dumpstack.c:421 arch/x86/=
kernel/dumpstack.c:434)
> kernel: [    5.576917] ? page_fault_oops (arch/x86/mm/fault.c:707)
> kernel: [    5.576921] ? srso_alias_return_thunk (arch/x86/lib/retpoline.=
S:181)
> kernel: [    5.576925] ? crypto_alloc_tfmmem.isra.0 (crypto/api.c:497)
> kernel: [    5.576930] ? do_user_addr_fault (arch/x86/mm/fault.c:1264)
> kernel: [    5.576934] ? exc_page_fault (./arch/x86/include/asm/paravirt.=
h:693 arch/x86/mm/fault.c:1515 arch/x86/mm/fault.c:1563)
> kernel: [    5.576937] ? asm_exc_page_fault (./arch/x86/include/asm/idten=
try.h:570)
> kernel: [    5.576942] ? gfx_v10_0_early_init (drivers/gpu/drm/amd/amdgpu=
/gfx_v10_0.c:4009 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7478) amdgpu
> kernel: [    5.577056] amdgpu_device_init (drivers/gpu/drm/amd/amdgpu/amd=
gpu_device.c:2465 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4042) amdgpu
> kernel: [    5.577158] ? srso_alias_return_thunk (arch/x86/lib/retpoline.=
S:181)
> kernel: [    5.577161] ? pci_bus_read_config_word (drivers/pci/access.c:6=
7 (discriminator 2))
> kernel: [    5.577166] ? pci_read_config_word (drivers/pci/access.c:563)
> kernel: [    5.577168] ? srso_alias_return_thunk (arch/x86/lib/retpoline.=
S:181)
> kernel: [    5.577171] ? do_pci_enable_device (drivers/pci/pci.c:1975 dri=
vers/pci/pci.c:1949)
> kernel: [    5.577176] amdgpu_driver_load_kms (drivers/gpu/drm/amd/amdgpu=
/amdgpu_kms.c:146) amdgpu
> kernel: [    5.577275] amdgpu_pci_probe (drivers/gpu/drm/amd/amdgpu/amdgp=
u_drv.c:2237) amdgpu
> kernel: [    5.577373] local_pci_probe (drivers/pci/pci-driver.c:324)
> kernel: [    5.577377] pci_device_probe (drivers/pci/pci-driver.c:392 dri=
vers/pci/pci-driver.c:417 drivers/pci/pci-driver.c:460)
> kernel: [    5.577381] really_probe (drivers/base/dd.c:579 drivers/base/d=
d.c:658)
> kernel: [    5.577386] __driver_probe_device (drivers/base/dd.c:800)
> kernel: [    5.577389] driver_probe_device (drivers/base/dd.c:830)
> kernel: [    5.577392] __driver_attach (drivers/base/dd.c:1217)
> kernel: [    5.577396] ? __pfx___driver_attach (drivers/base/dd.c:1157)
> kernel: [    5.577399] bus_for_each_dev (drivers/base/bus.c:368)
> kernel: [    5.577402] driver_attach (drivers/base/dd.c:1234)
> kernel: [    5.577405] bus_add_driver (drivers/base/bus.c:674)
> kernel: [    5.577409] driver_register (drivers/base/driver.c:246)
> kernel: [    5.577411] ? __pfx_amdgpu_init (drivers/gpu/drm/amd/amdgpu/am=
dgpu_drv.c:2497) amdgpu
> kernel: [    5.577521] __pci_register_driver (drivers/pci/pci-driver.c:14=
56)
> kernel: [    5.577524] amdgpu_init (drivers/gpu/drm/amd/amdgpu/amdgpu_drv=
.c:2805) amdgpu
> kernel: [    5.577628] do_one_initcall (init/main.c:1236)
> kernel: [    5.577632] ? kmalloc_trace (mm/slub.c:3816 mm/slub.c:3860 mm/=
slub.c:4007)
> kernel: [    5.577637] do_init_module (kernel/module/main.c:2533)
> kernel: [    5.577640] load_module (kernel/module/main.c:2984)
> kernel: [    5.577647] init_module_from_file (kernel/module/main.c:3151)
> kernel: [    5.577649] ? srso_alias_return_thunk (arch/x86/lib/retpoline.=
S:181)
> kernel: [    5.577652] ? init_module_from_file (kernel/module/main.c:3151=
)
> kernel: [    5.577657] idempotent_init_module (kernel/module/main.c:3168)
> kernel: [    5.577661] __x64_sys_finit_module (./include/linux/file.h:45 =
kernel/module/main.c:3190 kernel/module/main.c:3172 kernel/module/main.c:31=
72)
> kernel: [    5.577664] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86=
/entry/common.c:83)
> kernel: [    5.577668] ? srso_alias_return_thunk (arch/x86/lib/retpoline.=
S:181)
> kernel: [    5.577671] ? ksys_mmap_pgoff (mm/mmap.c:1428)
> kernel: [    5.577675] ? srso_alias_return_thunk (arch/x86/lib/retpoline.=
S:181)
> kernel: [    5.577678] ? srso_alias_return_thunk (arch/x86/lib/retpoline.=
S:181)
> kernel: [    5.577681] ? syscall_exit_to_user_mode (kernel/entry/common.c=
:215)
> kernel: [    5.577684] ? srso_alias_return_thunk (arch/x86/lib/retpoline.=
S:181)
> kernel: [    5.577687] ? do_syscall_64 (./arch/x86/include/asm/cpufeature=
.h:171 arch/x86/entry/common.c:98)
> kernel: [    5.577689] ? srso_alias_return_thunk (arch/x86/lib/retpoline.=
S:181)
> kernel: [    5.577692] ? do_syscall_64 (./arch/x86/include/asm/cpufeature=
.h:171 arch/x86/entry/common.c:98)
> kernel: [    5.577695] ? srso_alias_return_thunk (arch/x86/lib/retpoline.=
S:181)
> kernel: [    5.577698] ? do_syscall_64 (./arch/x86/include/asm/cpufeature=
.h:171 arch/x86/entry/common.c:98)
> kernel: [    5.577700] ? srso_alias_return_thunk (arch/x86/lib/retpoline.=
S:181)
> kernel: [    5.577703] ? sysvec_call_function (arch/x86/kernel/smp.c:253 =
(discriminator 69))
> kernel: [    5.577707] entry_SYSCALL_64_after_hwframe (arch/x86/entry/ent=
ry_64.S:129)
> kernel: [    5.577709] RIP: 0033:0x7fdaa331e88d
> kernel: [ 5.577724] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e=
 fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f=
 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 73 b5 0f 00 f7 d8 64 89 01 48
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>     0:	5b                   	pop    %rbx
>     1:	41 5c                	pop    %r12
>     3:	c3                   	ret
>     4:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
>     b:	00 00
>     d:	f3 0f 1e fa          	endbr64
>    11:	48 89 f8             	mov    %rdi,%rax
>    14:	48 89 f7             	mov    %rsi,%rdi
>    17:	48 89 d6             	mov    %rdx,%rsi
>    1a:	48 89 ca             	mov    %rcx,%rdx
>    1d:	4d 89 c2             	mov    %r8,%r10
>    20:	4d 89 c8             	mov    %r9,%r8
>    23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
>    28:	0f 05                	syscall
>    2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trappi=
ng instruction
>    30:	73 01                	jae    0x33
>    32:	c3                   	ret
>    33:	48 8b 0d 73 b5 0f 00 	mov    0xfb573(%rip),%rcx        # 0xfb5ad
>    3a:	f7 d8                	neg    %eax
>    3c:	64 89 01             	mov    %eax,%fs:(%rcx)
>    3f:	48                   	rex.W
>=20
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
>     6:	73 01                	jae    0x9
>     8:	c3                   	ret
>     9:	48 8b 0d 73 b5 0f 00 	mov    0xfb573(%rip),%rcx        # 0xfb583
>    10:	f7 d8                	neg    %eax
>    12:	64 89 01             	mov    %eax,%fs:(%rcx)
>    15:	48                   	rex.W
> kernel: [    5.577729] RSP: 002b:00007ffeb4f87d28 EFLAGS: 00000246 ORIG_R=
AX: 0000000000000139
> kernel: [    5.577733] RAX: ffffffffffffffda RBX: 000055aedf3eeeb0 RCX: 0=
0007fdaa331e88d
> kernel: [    5.577736] RDX: 0000000000000000 RSI: 000055aedf3efb80 RDI: 0=
00000000000001a
> kernel: [    5.577738] RBP: 0000000000020000 R08: 0000000000000000 R09: 0=
000000000000002
> kernel: [    5.577741] R10: 000000000000001a R11: 0000000000000246 R12: 0=
00055aedf3efb80
> kernel: [    5.577744] R13: 000055aedf3f2060 R14: 0000000000000000 R15: 0=
00055aedf2b1220
> kernel: [    5.577748]  </TASK>
> kernel: [    5.577750] Modules linked in: intel_rapl_msr intel_rapl_commo=
n amdgpu(+) edac_mce_amd kvm_amd kvm snd_hda_codec_realtek snd_hda_codec_ge=
neric irqbypass ledtrig_audio crct10dif_pclmul polyval_clmulni polyval_gene=
ric snd_hda_codec_hdmi ghash_clmulni_intel sha512_ssse3 sha256_ssse3 sha1_s=
sse3 amdxcp snd_hda_intel aesni_intel drm_exec snd_intel_dspcfg crypto_simd=
 gpu_sched snd_intel_sdw_acpi cryptd nls_iso8859_1 drm_buddy snd_hda_codec =
snd_seq_midi drm_suballoc_helper snd_seq_midi_event drm_ttm_helper joydev s=
nd_hda_core input_leds ttm rapl snd_rawmidi snd_hwdep drm_display_helper sn=
d_seq snd_pcm wmi_bmof cec k10temp snd_seq_device ccp rc_core snd_timer snd=
 drm_kms_helper i2c_algo_bit soundcore mac_hid tcp_bbr sch_fq msr parport_p=
c ppdev lp drm parport efi_pstore ip_tables x_tables autofs4 btrfs blake2b_=
generic xor raid6_pq libcrc32c hid_generic usbhid hid crc32_pclmul nvme r81=
69 ahci nvme_core i2c_piix4 xhci_pci libahci xhci_pci_renesas realtek video=
 wmi gpio_amdpt
> kernel: [    5.577817] CR2: 0000000000000008
> kernel: [    5.577820] ---[ end trace 0000000000000000 ]---
> kernel: [    5.914230] RIP: 0010:gfx_v10_0_early_init (drivers/gpu/drm/am=
d/amdgpu/gfx_v10_0.c:4009 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7478) amdg=
pu
> kernel: [ 5.914388] Code: 8d 55 a8 4c 89 ff e8 e4 83 ec ff 41 89 c2 83 f8=
 ed 0f 84 b3 fd ff ff 85 c0 74 05 0f 1f 44 00 00 49 8b 87 08 87 01 00 4c 89=
 ff <48> 8b 40 08 0f b7 50 0a 0f b7 70 08 e8 e4 42 fb ff 41 89 c2 85 c0
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>     0:	8d 55 a8             	lea    -0x58(%rbp),%edx
>     3:	4c 89 ff             	mov    %r15,%rdi
>     6:	e8 e4 83 ec ff       	call   0xffffffffffec83ef
>     b:	41 89 c2             	mov    %eax,%r10d
>     e:	83 f8 ed             	cmp    $0xffffffed,%eax
>    11:	0f 84 b3 fd ff ff    	je     0xfffffffffffffdca
>    17:	85 c0                	test   %eax,%eax
>    19:	74 05                	je     0x20
>    1b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
>    20:	49 8b 87 08 87 01 00 	mov    0x18708(%r15),%rax
>    27:	4c 89 ff             	mov    %r15,%rdi
>    2a:*	48 8b 40 08          	mov    0x8(%rax),%rax		<-- trapping instruc=
tion
>    2e:	0f b7 50 0a          	movzwl 0xa(%rax),%edx
>    32:	0f b7 70 08          	movzwl 0x8(%rax),%esi
>    36:	e8 e4 42 fb ff       	call   0xfffffffffffb431f
>    3b:	41 89 c2             	mov    %eax,%r10d
>    3e:	85 c0                	test   %eax,%eax
>=20
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     0:	48 8b 40 08          	mov    0x8(%rax),%rax
>     4:	0f b7 50 0a          	movzwl 0xa(%rax),%edx
>     8:	0f b7 70 08          	movzwl 0x8(%rax),%esi
>     c:	e8 e4 42 fb ff       	call   0xfffffffffffb42f5
>    11:	41 89 c2             	mov    %eax,%r10d
>    14:	85 c0                	test   %eax,%eax
> rsyslogd: rsyslogd's groupid changed to 111
> kernel: [    5.914394] RSP: 0018:ffffa5b3c103f720 EFLAGS: 00010282
> kernel: [    5.914397] RAX: 0000000000000000 RBX: ffffffffc1d73489 RCX: 0=
000000000000000
> kernel: [    5.914399] RDX: 0000000000000000 RSI: 0000000000000000 RDI: f=
fff91ae4fa80000
> kernel: [    5.914402] RBP: ffffa5b3c103f7b0 R08: 0000000000000000 R09: 0=
000000000000000
> kernel: [    5.914405] R10: 00000000ffffffea R11: 0000000000000000 R12: f=
fff91ae4fa986e8
> kernel: [    5.914408] R13: ffff91ae4fa986d8 R14: ffff91ae4fa986f8 R15: f=
fff91ae4fa80000
> kernel: [    5.914410] FS:  00007fdaa343c8c0(0000) GS:ffff91bd58440000(00=
00) knlGS:0000000000000000
> kernel: [    5.914414] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> kernel: [    5.914416] CR2: 0000000000000008 CR3: 00000001222d0000 CR4: 0=
000000000750ef0
> kernel: [    5.914419] PKRU: 55555554
>=20
> Best regards,
> Mirsad
>=20
> On 1/18/24 18:23, Mirsad Todorovac wrote:
>> Hi,
>>
>> Unfortunately, I was not able to reboot in this kernel again to do the s=
tack decode, but I thought
>> that any information about the NULL pointer dereference is better than n=
o info.
>>
>> The system is Ubuntu 23.10 Mantic with AMD product: Navi 23 [Radeon RX 6=
600/6600 XT/6600M]
>> graphic card.
>>
>> Please find the config and the hw listing attached.
>>
>> Best regards,
>> Mirsad
>=20
>=20
>=20
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576702] BUG: kernel NULL pointer dereferen=
ce, address: 0000000000000008
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576707] #PF: supervisor read access in ker=
nel mode
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576710] #PF: error_code(0x0000) - not-pres=
ent page
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576712] PGD 0 P4D 0
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576715] Oops: 0000 [#1] PREEMPT SMP NOPTI
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576718] CPU: 9 PID: 650 Comm: systemd-udev=
d Not tainted 6.7.0-rtl-v0.2-nokcsan-09928-g052d534373b7 #2
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576723] Hardware name: ASRock X670E PG Lig=
htning/X670E PG Lightning, BIOS 1.21 04/26/2023
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576726] RIP: 0010:gfx_v10_0_early_init+0x5=
ab/0x8d0 [amdgpu]
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576872] Code: 8d 55 a8 4c 89 ff e8 e4 83 e=
c ff 41 89 c2 83 f8 ed 0f 84 b3 fd ff ff 85 c0 74 05 0f 1f 44 00 00 49 8b 8=
7 08 87 01 00 4c 89 ff <48> 8b 40 08 0f b7 50 0a 0f b7 70 08 e8 e4 42 fb ff=
 41 89 c2 85 c0
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576878] RSP: 0018:ffffa5b3c103f720 EFLAGS:=
 00010282
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576881] RAX: 0000000000000000 RBX: fffffff=
fc1d73489 RCX: 0000000000000000
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576884] RDX: 0000000000000000 RSI: 0000000=
000000000 RDI: ffff91ae4fa80000
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576886] RBP: ffffa5b3c103f7b0 R08: 0000000=
000000000 R09: 0000000000000000
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576889] R10: 00000000ffffffea R11: 0000000=
000000000 R12: ffff91ae4fa986e8
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576892] R13: ffff91ae4fa986d8 R14: ffff91a=
e4fa986f8 R15: ffff91ae4fa80000
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576895] FS:=C2=A0 00007fdaa343c8c0(0000) G=
S:ffff91bd58440000(0000) knlGS:0000000000000000
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576898] CS:=C2=A0 0010 DS: 0000 ES: 0000 C=
R0: 0000000080050033
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576900] CR2: 0000000000000008 CR3: 0000000=
1222d0000 CR4: 0000000000750ef0
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576903] PKRU: 55555554
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576905] Call Trace:
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576907]=C2=A0 <TASK>
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576909]=C2=A0 ? show_regs+0x72/0x90
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576914]=C2=A0 ? __die+0x25/0x80
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576917]=C2=A0 ? page_fault_oops+0x154/0x4c=
0
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576921]=C2=A0 ? srso_alias_return_thunk+0x=
5/0xfbef5
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576925]=C2=A0 ? crypto_alloc_tfmmem.isra.0=
+0x35/0x70
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576930]=C2=A0 ? do_user_addr_fault+0x30e/0=
x6e0
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576934]=C2=A0 ? exc_page_fault+0x84/0x1b0
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576937]=C2=A0 ? asm_exc_page_fault+0x27/0x=
30
>> kernel: [=C2=A0=C2=A0=C2=A0 5.576942]=C2=A0 ? gfx_v10_0_early_init+0x5ab=
/0x8d0 [amdgpu]
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577056]=C2=A0 amdgpu_device_init+0xefa/0x2=
de0 [amdgpu]
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577158]=C2=A0 ? srso_alias_return_thunk+0x=
5/0xfbef5
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577161]=C2=A0 ? pci_bus_read_config_word+0=
x47/0x90
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577166]=C2=A0 ? pci_read_config_word+0x27/=
0x60
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577168]=C2=A0 ? srso_alias_return_thunk+0x=
5/0xfbef5
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577171]=C2=A0 ? do_pci_enable_device+0xe1/=
0x110
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577176]=C2=A0 amdgpu_driver_load_kms+0x1a/=
0x1c0 [amdgpu]
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577275]=C2=A0 amdgpu_pci_probe+0x1a8/0x5e0=
 [amdgpu]
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577373]=C2=A0 local_pci_probe+0x48/0xb0
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577377]=C2=A0 pci_device_probe+0xc8/0x290
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577381]=C2=A0 really_probe+0x1d2/0x440
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577386]=C2=A0 __driver_probe_device+0x8a/0=
x190
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577389]=C2=A0 driver_probe_device+0x23/0xd=
0
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577392]=C2=A0 __driver_attach+0x10f/0x220
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577396]=C2=A0 ? __pfx___driver_attach+0x10=
/0x10
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577399]=C2=A0 bus_for_each_dev+0x7a/0xe0
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577402]=C2=A0 driver_attach+0x1e/0x30
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577405]=C2=A0 bus_add_driver+0x127/0x240
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577409]=C2=A0 driver_register+0x64/0x140
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577411]=C2=A0 ? __pfx_amdgpu_init+0x10/0x1=
0 [amdgpu]
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577521]=C2=A0 __pci_register_driver+0x68/0=
x80
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577524]=C2=A0 amdgpu_init+0x69/0xff0 [amdg=
pu]
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577628]=C2=A0 do_one_initcall+0x46/0x330
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577632]=C2=A0 ? kmalloc_trace+0x136/0x370
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577637]=C2=A0 do_init_module+0x6a/0x280
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577640]=C2=A0 load_module+0x2419/0x2500
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577647]=C2=A0 init_module_from_file+0x9c/0=
xf0
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577649]=C2=A0 ? srso_alias_return_thunk+0x=
5/0xfbef5
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577652]=C2=A0 ? init_module_from_file+0x9c=
/0xf0
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577657]=C2=A0 idempotent_init_module+0x184=
/0x240
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577661]=C2=A0 __x64_sys_finit_module+0x64/=
0xd0
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577664]=C2=A0 do_syscall_64+0x76/0x140
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577668]=C2=A0 ? srso_alias_return_thunk+0x=
5/0xfbef5
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577671]=C2=A0 ? ksys_mmap_pgoff+0x123/0x27=
0
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577675]=C2=A0 ? srso_alias_return_thunk+0x=
5/0xfbef5
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577678]=C2=A0 ? srso_alias_return_thunk+0x=
5/0xfbef5
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577681]=C2=A0 ? syscall_exit_to_user_mode+=
0x97/0x1e0
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577684]=C2=A0 ? srso_alias_return_thunk+0x=
5/0xfbef5
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577687]=C2=A0 ? do_syscall_64+0x85/0x140
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577689]=C2=A0 ? srso_alias_return_thunk+0x=
5/0xfbef5
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577692]=C2=A0 ? do_syscall_64+0x85/0x140
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577695]=C2=A0 ? srso_alias_return_thunk+0x=
5/0xfbef5
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577698]=C2=A0 ? do_syscall_64+0x85/0x140
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577700]=C2=A0 ? srso_alias_return_thunk+0x=
5/0xfbef5
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577703]=C2=A0 ? sysvec_call_function+0x4e/=
0xb0
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577707]=C2=A0 entry_SYSCALL_64_after_hwfra=
me+0x6e/0x76
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577709] RIP: 0033:0x7fdaa331e88d
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577724] Code: 5b 41 5c c3 66 0f 1f 84 00 0=
0 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c=
8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 73 b5 0f 00 f7=
 d8 64 89 01 48
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577729] RSP: 002b:00007ffeb4f87d28 EFLAGS:=
 00000246 ORIG_RAX: 0000000000000139
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577733] RAX: ffffffffffffffda RBX: 000055a=
edf3eeeb0 RCX: 00007fdaa331e88d
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577736] RDX: 0000000000000000 RSI: 000055a=
edf3efb80 RDI: 000000000000001a
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577738] RBP: 0000000000020000 R08: 0000000=
000000000 R09: 0000000000000002
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577741] R10: 000000000000001a R11: 0000000=
000000246 R12: 000055aedf3efb80
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577744] R13: 000055aedf3f2060 R14: 0000000=
000000000 R15: 000055aedf2b1220
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577748]=C2=A0 </TASK>
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577750] Modules linked in: intel_rapl_msr =
intel_rapl_common amdgpu(+) edac_mce_amd kvm_amd kvm snd_hda_codec_realtek =
snd_hda_codec_generic irqbypass ledtrig_audio crct10dif_pclmul polyval_clmu=
lni polyval_generic snd_hda_codec_hdmi ghash_clmulni_intel sha512_ssse3 sha=
256_ssse3 sha1_ssse3 amdxcp snd_hda_intel aesni_intel drm_exec snd_intel_ds=
pcfg crypto_simd gpu_sched snd_intel_sdw_acpi cryptd nls_iso8859_1 drm_budd=
y snd_hda_codec snd_seq_midi drm_suballoc_helper snd_seq_midi_event drm_ttm=
_helper joydev snd_hda_core input_leds ttm rapl snd_rawmidi snd_hwdep drm_d=
isplay_helper snd_seq snd_pcm wmi_bmof cec k10temp snd_seq_device ccp rc_co=
re snd_timer snd drm_kms_helper i2c_algo_bit soundcore mac_hid tcp_bbr sch_=
fq msr parport_pc ppdev lp drm parport efi_pstore ip_tables x_tables autofs=
4 btrfs blake2b_generic xor raid6_pq libcrc32c hid_generic usbhid hid crc32=
_pclmul nvme r8169 ahci nvme_core i2c_piix4 xhci_pci libahci xhci_pci_renes=
as realtek video wmi gpio_amdpt
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577817] CR2: 0000000000000008
>> kernel: [=C2=A0=C2=A0=C2=A0 5.577820] ---[ end trace 0000000000000000 ]-=
--
>> kernel: [=C2=A0=C2=A0=C2=A0 5.914230] RIP: 0010:gfx_v10_0_early_init+0x5=
ab/0x8d0 [amdgpu]
>> kernel: [=C2=A0=C2=A0=C2=A0 5.914388] Code: 8d 55 a8 4c 89 ff e8 e4 83 e=
c ff 41 89 c2 83 f8 ed 0f 84 b3 fd ff ff 85 c0 74 05 0f 1f 44 00 00 49 8b 8=
7 08 87 01 00 4c 89 ff <48> 8b 40 08 0f b7 50 0a 0f b7 70 08 e8 e4 42 fb ff=
 41 89 c2 85 c0
>> rsyslogd: rsyslogd's groupid changed to 111
>> kernel: [=C2=A0=C2=A0=C2=A0 5.914394] RSP: 0018:ffffa5b3c103f720 EFLAGS:=
 00010282
>> kernel: [=C2=A0=C2=A0=C2=A0 5.914397] RAX: 0000000000000000 RBX: fffffff=
fc1d73489 RCX: 0000000000000000
>> kernel: [=C2=A0=C2=A0=C2=A0 5.914399] RDX: 0000000000000000 RSI: 0000000=
000000000 RDI: ffff91ae4fa80000
>> kernel: [=C2=A0=C2=A0=C2=A0 5.914402] RBP: ffffa5b3c103f7b0 R08: 0000000=
000000000 R09: 0000000000000000
>> kernel: [=C2=A0=C2=A0=C2=A0 5.914405] R10: 00000000ffffffea R11: 0000000=
000000000 R12: ffff91ae4fa986e8
>> kernel: [=C2=A0=C2=A0=C2=A0 5.914408] R13: ffff91ae4fa986d8 R14: ffff91a=
e4fa986f8 R15: ffff91ae4fa80000
>> kernel: [=C2=A0=C2=A0=C2=A0 5.914410] FS:=C2=A0 00007fdaa343c8c0(0000) G=
S:ffff91bd58440000(0000) knlGS:0000000000000000
>> kernel: [=C2=A0=C2=A0=C2=A0 5.914414] CS:=C2=A0 0010 DS: 0000 ES: 0000 C=
R0: 0000000080050033
>> kernel: [=C2=A0=C2=A0=C2=A0 5.914416] CR2: 0000000000000008 CR3: 0000000=
1222d0000 CR4: 0000000000750ef0
>> kernel: [=C2=A0=C2=A0=C2=A0 5.914419] PKRU: 55555554
