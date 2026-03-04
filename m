Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABm1Menop2mDlgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 09:10:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 783CF1FC430
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 09:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20EB110E964;
	Wed,  4 Mar 2026 08:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="A+dk7YOh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013055.outbound.protection.outlook.com
 [40.93.201.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F5110E963;
 Wed,  4 Mar 2026 08:10:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PApARn3LIR4lU+zv9rereF4oxx+KK13TBm5vhaWRN+rsuE58llp1zq/tDHFhUKCLO960BP9rGR+1MwqZjVq0UJ1SXecFLnv/qnFTF6bSnc+7Yg53ymH4OOJyukb3ZxiEjJIMFHgkhZS98sG9WApHujepC334d76waFYBmh9M3Kryvo0QOcSUfhyrObBQ5vc1gSAqDCk+Qy0wsAFRtjj4y0y2+uROiKClgR1rIr0f9i9ykBaus/W1OwBPX7baVQTRHhZJqy3eLgkc+1YRmgt9aXk4Irb5ifPWLyLYNj4bMevtG+MR6G8FtOM2x6An1xfBzlUF60e6ovubfs0S1dVQPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iaepl/A0bXCehe4JDq80YMM8cJXuayEWcwTGvednPHE=;
 b=HKU3mBb1QqqUjrVETBRQvJr5dlaC/1BR8e3G6qAX5hyhOQ/XfIxd+BmYZhZRCSY4/j6oCorFEBrdgSYdeH5iNqphipSWOTtLOA9dPczYD30Um5p0caoSqacjWUXiOh70mxIJ88MDik4metFWHxLcX5a7YQgl9eWMV4jm2zDdRfu1Qhlc/Lgl2k9QdSfhArv4BBXXi6q4BInYT0B68kCN1l3j968QONNxnCCySwH7ExMJ4Btbmw+QjrDU/AdLRwR/plhz8pUJVvWr2GMdOqbRwjEDteQB6x4FjjiMgvcXMufHVFqBVl5KqUkhXvXKffl27UfauQWN0nbxu+UR4avT8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iaepl/A0bXCehe4JDq80YMM8cJXuayEWcwTGvednPHE=;
 b=A+dk7YOh56billuJsVzEQ4XHKcpSFy+hUUAQFv0JRaNqMaQcmJtO6R4/yTOjncloWyb7MXqAQGvG2L1Zaqcn+wpgSELJQCz0WwcJdOcW4BBESN/xDNSbhT4vergpdaDEF6vdyzqsuKSPWoPXzeaXUkXxwlLuaTbcYNQ9RCLCLWw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BN7PPF49208036B.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6cf) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 08:10:10 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 08:10:10 +0000
Message-ID: <7d3a4090-06bf-40b0-8c80-ca08625608d7@amd.com>
Date: Wed, 4 Mar 2026 09:10:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 for 6.112 and 6.6 0/2] amdgpu: fix panic on old GPUs
To: Rosen Penev <rosenp@gmail.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kenneth Feng <kenneth.feng@amd.com>, =?UTF-8?Q?Timur_Krist=C3=B3f?=
 <timur.kristof@gmail.com>, Alex Hung <alex.hung@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lijo Lazar <lijo.lazar@amd.com>, "chr[]" <chris@rudorff.com>,
 Sasha Levin <sashal@kernel.org>, Wentao Liang <vulab@iscas.ac.cn>,
 "open list:AMD DISPLAY CORE" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>
References: <20260228045356.3561-1-rosenp@gmail.com>
 <CAKxU2N_FbB_d6ntXEOFzE2u-sfu9sRRFwaDnb3P=RfTwE5yuDA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAKxU2N_FbB_d6ntXEOFzE2u-sfu9sRRFwaDnb3P=RfTwE5yuDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0484.namprd03.prod.outlook.com
 (2603:10b6:408:130::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BN7PPF49208036B:EE_
X-MS-Office365-Filtering-Correlation-Id: e99b757f-eb3e-447d-8a56-08de79c57470
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: S1TH+BrJsAt5G5AO536CdTfN6nuMy/aYPByGwTjdwrtQZ6VxfCPQ6MuMFm3hEt52wzxlOocT7+S12h3jx15rVqponVmwOjpLu1FVv/AhVZPmu41gdjoWXfwnSJBMpus4uvW4Gw9VZWR8lDIN6FmmGGxb/OiX6vRxpjKHpTCE1E+m5HoI8BPlQJslF2qcJ+JeQmQ2jtBXen2r74aGCpncJ4jT+ZLYuWrhLrWzEdkMPTKKo84t+S/X8cDB6pbgfEKzpEIZbCpvV6i+uV7SU/4ZMp9EE18vnZbs/OEHW7dZestUHOxbRQunObcGGdFfRafRzxcTlXof652+hTWi/ekGUMiHbeVKXfnv5Z+9QCmTvW8bIU4TsWg5umoOpkSNA1HFqQqg73I/cKJR/nwXM5fzJD59RlUBfIB9Q2GRIRd6dAsdcNId8qKsaiEgrlOrn82qnf3g+hJAc1iHNj0PHIah3RPD1VXmyQo8j5NbDrSvWAF3S5KYA9sZ7GtK3db3yG+boshGH2A6CPU/Zl5ofeLQfs6sI3TIlSzMcuNSHA5yjYaTvtUOpb9y4kRQOTuBMWDH4l74xN+Y2RlExyvjviuvYX5NtRmCUBVkYc5HmfzftVAQFYbGr5FXQpX3hVp8P8tHtSY3Bb+8fxkgpLUAdK4FLlvcYztnagMeD8PbYmf7bD/3XDd3PWIXqDnof72gijfdLaZj0JzquoAwCQxQQX8ZWs1nEfFTKwzPC9nhgU25riI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFdFdEtpQXZ0MSsyRllQUDFhZVRMUDlHRitDdW9tdnRmOSt1enRLZzBMVUVp?=
 =?utf-8?B?Nkh1NjFiWWFmLzBxYlh5bTBIRFdSb3JEUGorSmtadzdBbDhHcmQ2eVdlUWF2?=
 =?utf-8?B?Z3lCNVNOTkdDSFpGaG1HR01IbzNPakRvcFo3RHBDTTNyNW11MlRSZ0gxWWVJ?=
 =?utf-8?B?Y1N4VCtKNGRyT20xVXBBZm1yUzVESkNGbXlSc2FQMVBieXR2TjhQckx6ZHBn?=
 =?utf-8?B?d3I4aTRFd0VEQloyekV0dkQzcmQ5UUc2M0tYNkpyTFo1d1VucVdRRFY5cUQw?=
 =?utf-8?B?cStIYmVXcjFHV1VBY0VwaGltNnl2eXNLOVBqRTcxMkNwTGNCOVFNMW84R0FT?=
 =?utf-8?B?UmpTNXRSMkljVm05azB1RGpXSFZUSnpGYWQ1NFNMMGVaNjdITFMwempjL2hu?=
 =?utf-8?B?aGwvcmJreWtFMUd5RGs5b2ZMaFJhYytTWG4yOXkzcW85UTYyZGZRaUozbkVJ?=
 =?utf-8?B?ZDF6NEVMb0s5OHNidW00akh2YUtQSVdaZ1pIRWVQZzJhbkpXR2FyV0VFVk5S?=
 =?utf-8?B?WldLaVY0RmNBd08xT1hHMnl0MWFtNmpGdFlaV0xucWJEWExDeE1LdmFYZzJ3?=
 =?utf-8?B?OHY3ZC9Bb2FISUpKaWNDYkdaODVYaXJZNk5PWERTd2lNcW12QVpHa2hBT20w?=
 =?utf-8?B?a1crV2VRSFk2ZGU4amlxd1pLWjZLb2dFOUQ1RmFYSEdXTlY4WEI4clJkU0JN?=
 =?utf-8?B?dDU4em9hYTUxbzVRSGwrNGdwV0w2bm9NMXR3QTR5dlI0WlI1TVpSOVNSb1BP?=
 =?utf-8?B?RVBTVXkxQk00SEgzeVRhMzE3ZTRDTERCSXRBZks4cndJMWVJSTU5V0pSbjlt?=
 =?utf-8?B?SFdhV3RWQUx2MXo5eWtCZ1JRUWw5Y3R6MXlTbnpta2tDNjhjTm9oamNScGg1?=
 =?utf-8?B?UU5MVEwrWmpwaldlKzB6ZlNqZkF3dUdGYTVkRzlqUW5jVHRBcXVyUldab0lT?=
 =?utf-8?B?ZTgrMDdjRTJES3FERC95UXdESTkxMnlsRUxSMVF3RSsvUTZUSzlYeno4aWVn?=
 =?utf-8?B?UXdlRGx6a3pOMStmenhvUzFkWSsweVFQcENBRVlTWXFENnRLYzc3WHROejVs?=
 =?utf-8?B?L2tKckJicFFZY2ZHdUZIZ3lNOWVNODdxc0lVN0oxaVF4aGcrckU5c3ZGRy9x?=
 =?utf-8?B?Zmd0bFBlVExsL1FvZkJhb2Z6Yk9lQkdYLzRlYjJrYjhOaDk5WUM3LzBtZVlE?=
 =?utf-8?B?K1YzaENvazAxUzY0emFTdjZKU0hiOGZpRTRSNEtXMThBWG9TU1pTRWIzckFv?=
 =?utf-8?B?dXByQktKcnB1b3V3c3NtMjVnOWRwdE5qeXc5Z2M5cjhiNEJObGE4eTZiSTJp?=
 =?utf-8?B?ekFuSWRKSU9UU0dVMzRubjhCM2NQdHlmQXNwOFFRaTFzb3R0V2daREpMSHYz?=
 =?utf-8?B?MlNDbyt4OUtBWHE5SGpPcEJqVElkTHRmUTNhSElucm9oNkVadXdhZXRUUVhN?=
 =?utf-8?B?NFZwRnB2Z2FCNVJvVWhyQ21laFZ4ZVJTYVFDRUVIMThsZCs0bHlmTE54QmlU?=
 =?utf-8?B?NkJPekFwL1NsekF2UFdHR1cra1l3SWNrYXlBK0t1VEN4ZldtVGFVZWJLUldJ?=
 =?utf-8?B?cWJ0R0JZVWZSejBDdFZFclpOangxZWovalN4b3ZNN0ExWWg5STRxQjlYL0VZ?=
 =?utf-8?B?cVpncEd3TFZQdytrWGgvUUNzVkZ2SncyZzBCc3h1Y0RMa0NFSFNIMDBsdEor?=
 =?utf-8?B?cWN0UkwxT1BJbExmQ1RUQW16WGxrQWNkSWNSSWhoOVNoMmhHYmQ0d2xYNURL?=
 =?utf-8?B?cGxoNWJ3KzFQT29qVnpzRHVVcElGdVdTUnRab1FGOVQzMHpOYW1TZTEzMWIz?=
 =?utf-8?B?ODVCYlA3NUlzR1RwUUJVTnAxSkpCd1RBVkJNMURIMG96dEVHL1gyaW1WWDlO?=
 =?utf-8?B?cENvYmc3dnM3dXltd3drdHpqZGdpWGtvVDE4dnBaS2ZqaWdVc21haWNJaG1u?=
 =?utf-8?B?dmd2b2pOck9jK3lCOW95NUIrRFovMWNzVWZ0S2d1VUZiL3ZIR1NkVjBwTGF1?=
 =?utf-8?B?WnluMTRYWTVJa2N5OGdDYW55bktqRnFndG8xZGFSL0E1ZExwTllGSG05NUQr?=
 =?utf-8?B?blUxUVJpK0FxeDlPYTNmWmV3UjJuUGUxZDJlbnlUWGVsU2xGOE9xY05jMXdi?=
 =?utf-8?B?aitEOGlmMFY4NitFMzBPZTh4blpmRjFhQkkvMktHektRM3dWNEFwNzdTbVNX?=
 =?utf-8?B?M1VpMTNRellxaTN0WVVCZ2YvWDM0d0F5RksrSy9nUndSajJrblowVlM0WU5T?=
 =?utf-8?B?eWpKaWdEWU55ZG1RWXhvQ3pHQ296a1dwQ2xVelhBOHJiVlRJK1lBTTR3NUdk?=
 =?utf-8?Q?HoTg6chZWRjHM6csfy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e99b757f-eb3e-447d-8a56-08de79c57470
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 08:10:10.5127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mbSTd7TJcHqmgZ3AH2c4R8Fqlk1yxEBdXuu7JrghUk9UkADHxXntPNjta2IbFcgD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF49208036B
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
X-Rspamd-Queue-Id: 783CF1FC430
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linuxfoundation.org,rudorff.com,kernel.org,iscas.ac.cn,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:mid]
X-Rspamd-Action: no action

-stable +Greg

On 3/4/26 05:03, Rosen Penev wrote:
> On Fri, Feb 27, 2026 at 8:54 PM Rosen Penev <rosenp@gmail.com> wrote:
>>
>> Because of incomplete backports to stable kernels, DC ended up breaking
>> on older GCN 1 GPUs. This patchset adds the missing upstream commits to
>> at least fix the panic/black screen on boot.
>>
>> They are applicable to 6.12, 6.6, and 6.1 as those are the currently
>> supported kernels that 7009e3af0474aca5f64262b3c72fb6e23b232f9b got
>> backported to.
>>
>> 6.1 needs two extra backports for these two commits to be cherry-picked
>> cleanly. Those are
>>
>> 96ce96f8773da4814622fd97e5226915a2c30706
>> d09ef243035b75a6d403ebfeb7e87fa20d7e25c6
>>
>> v2: Add Signed-off-by.
> Do I need to resend?

Well first of all please stop sending those patches at all.

When you want something backported then add the CC: stable tag to the original patch.

If you find that some patch is already upstream which isn't correctly tagged then ping the relevant maintainers if that patch can be backported.

But don't send stuff to the stable list all by yourself.

Regards,
Christian.

>>
>> Timur Kristóf (2):
>>   drm/amd/display: Add pixel_clock to amd_pp_display_configuration
>>   drm/amd/pm: Use pm_display_cfg in legacy DPM (v2)
>>
>>  .../amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c  |  1 +
>>  .../dc/clk_mgr/dce110/dce110_clk_mgr.c        |  2 +-
>>  .../drm/amd/display/dc/dm_services_types.h    |  2 +-
>>  drivers/gpu/drm/amd/include/dm_pp_interface.h |  1 +
>>  drivers/gpu/drm/amd/pm/amdgpu_dpm_internal.c  | 67 +++++++++++++++++++
>>  .../gpu/drm/amd/pm/inc/amdgpu_dpm_internal.h  |  2 +
>>  drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c    |  4 +-
>>  .../gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c    |  6 +-
>>  drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c    | 65 ++++++------------
>>  .../gpu/drm/amd/pm/powerplay/amd_powerplay.c  | 11 +--
>>  10 files changed, 101 insertions(+), 60 deletions(-)
>>
>> --
>> 2.53.0
>>

