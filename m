Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD320B34E0C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 23:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB5810E585;
	Mon, 25 Aug 2025 21:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="B2Xgoj4V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F255810E586
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 21:28:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jYWM1acMnNyNBNkUlqwgGuRtpqKNH31FFSPRSyG0oPX6hrzkRC+Nc7c58qIyFG03OVJAnvDut05h7DBHytxkpAowAT8VibK96Vpe4QZsqEXK/L003aKK4zfpABYAv+6y0qmubgreDPpm8sjK0lxVU9cHWYkxH3NXGB6/W2HjRKWNG+Kux41UIOooDFzDr0hgc91O6A4DLLP2zUt8J/KqIOliJFOJmkSeWqS7KBK3YJP5geEsYsCCmf8WAOIYIBcsZxOmlHjFzimrNlfRQVFyV8IizGYovuAbmpXROvNJjcqg0krsxtsmuvnd+nwZOQ6e6zAqfCB8iDtFwA6HNCrKvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6T4CR5bukz5TcvDT9hMG1KmgzEaqOPc1ivsgJeOaYA=;
 b=E5vvnxcTdgczCgCzODy0Z9tKUfetGH7AOUJ+HSTteRgFQNpmGq3qZrTiaPKdg2oSw3c+YWkBc/7Ytq36n8ofjq3AyG5i5HJJWRnx6VTuMblwe2T8Ye3hW6MivLMkI89jxGN1LUxOR4sKBYJon/WXQUiASB7wnbH4WisdDdK26PAvh1p0Fw7CAUo/NzOJSBuu3nROOcUf/v1/RUSi3fT19Ey+UZq6Ct/+EcuRQuBjqtJiSVwm9X/NUhT7kjw1C8dF/h2fIv/Xz/TcspN0JOMWcacywXN/K4CZWji2brFaXvtCWzoJDpMKyhXLqMCTd+1tOqbUb6TuSwzRBzIBFfAydg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6T4CR5bukz5TcvDT9hMG1KmgzEaqOPc1ivsgJeOaYA=;
 b=B2Xgoj4VhKM5oXrpbDQx6UF4q+G36G7Q4BtIIbyM4rs5iIl6LAyZnWwPDI1jBpx5VfYL/JKPlQ8PgcA2nqu/+gnjLmNO1bjkyEKmz79IXvxYS2ArRyEev5TwGAKW9IfPnHXHwdvsD9R1c8ksaFpcJSACBes1vdk0moa9rPHttqc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS5PPFB297DAF97.namprd12.prod.outlook.com (2603:10b6:f:fc00::65d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 25 Aug
 2025 21:28:25 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9052.017; Mon, 25 Aug 2025
 21:28:25 +0000
Message-ID: <2bec1429-4f8c-472c-99a1-420a33a3d316@amd.com>
Date: Mon, 25 Aug 2025 16:28:23 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Add ioctl DRM_IOCTL_AMDXDNA_GET_ARRAY
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, jacek.lawrynowicz@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20250822172319.377848-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250822172319.377848-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR2101CA0004.namprd21.prod.outlook.com
 (2603:10b6:805:106::14) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS5PPFB297DAF97:EE_
X-MS-Office365-Filtering-Correlation-Id: d9a95ae5-8d54-4f16-c254-08dde41e5336
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWN4T3RkQkdMblU0ZXFlYW5WbkUzdThVczZacEkwRWMvaTlQTEZRVjIrSDM4?=
 =?utf-8?B?Unk5czhEaEZRbUt4bEhGcVhyd2ZPTlRnUmFtWEovNGNQdjF3Znp3VE5MamZC?=
 =?utf-8?B?bUo2MU8vbnU0UXZZSWowYi9PMHVzY2hUcm5ua095bDI2V25scS9MeGYzZHhv?=
 =?utf-8?B?cjk5cE9uOU9OU3Byc2ZxNGhwenZ4UG5BU3FCeUJueEcwVzFoRENLNHVadEpi?=
 =?utf-8?B?b0t2b2U4SnF1c0w0elNvUkl2bjFEeDJ2YWk3L1lKSnJlOFQ0MFp5b2UvN0d5?=
 =?utf-8?B?M2h3Z3VNK0xpQlNQWEhnNVpTcVhCTWlPYVdrelprZUxmQllQc2hBN0JlcElN?=
 =?utf-8?B?OG45d0xteTExWllqRU5GMWwrUUdaSUlkeHAvNUNFcmtVRy9xM0VTekZ0b2kr?=
 =?utf-8?B?UlJjQk9qYUdCRzZ2N0o1WkZHMkJwaWR0c21uUExkYUFBV0ZhTXpJUTF6anZO?=
 =?utf-8?B?NnFaTEFiYlZoTHM3QVJ2bHFSb2VjWWJFa2RVQnpPbklObE8xM3BQQjV1VHp3?=
 =?utf-8?B?L3lXc1Z1ZFZiZFp2eDlJNlRueko2dU1rV1dQZWRPKyszc2ZjMkptQkRsMGx4?=
 =?utf-8?B?bFgwZEtWRlF3WTBNYVRkS1ZORnBTU05iU0wvdm9iM2piUlYwbUpDdVd5dXli?=
 =?utf-8?B?citxS2toZi9Idlk3N2g0cHlEQzJXaHd5WUh1M0w0Sk1IbkFMTGtVaGdlSXNq?=
 =?utf-8?B?OFF1cGpEcmtOM2Q4WWs5WW9XNkVxQWZKM2hZZ1ZHbElOTFZVRFJ2bERYOWNZ?=
 =?utf-8?B?VWFPZXNmaDE1N05meDFiaG53Z2FRbUNRMUVKNkw0cDZxdk1MRGU3Q3NMMENN?=
 =?utf-8?B?bWE3SmNBYWhRblZaMUhDWm5HZ3QvOHQwcU03K0RSTjRYcE5tKzB3SUhWVDQr?=
 =?utf-8?B?TG1jQ0xJeXo4OVVCL01OSlFQczZHMEZUTUxHOVZuby9DVTd0U1pVaWdoeENh?=
 =?utf-8?B?blBpUCt2OG1mOWF3M2dFY1NXZURXS2JmRDlGY3U0MWcyK1VwUTRIa2dTUWky?=
 =?utf-8?B?c3BrRk1OMHR1cFZ2cGZtT09lUTdsdDFIelU1NEYxQUNwSHNwUXhGbGMvaDdk?=
 =?utf-8?B?ZlU2ZlF6d1lZNmhVYVNDRmk1MC95eDBYSGJncTVrK3RWNjErTloreEJnK3FE?=
 =?utf-8?B?Z0ZOR3N2Y1VGMHp1R3BRVFRST2l0L0RUWUJtZWViME92L1h4Zlp5cU96R3F3?=
 =?utf-8?B?dmVvZkJKWFF3OFpneDNoYkdSTjd6eXh0azN5c21wTXhxMDJ3TFlaU1VpWnNS?=
 =?utf-8?B?YzBlZGN4RzU3eVRSdktuK2FiZkpXMEh0REZWUjZXVWllWm1TcVMxWFJaeFZk?=
 =?utf-8?B?Zm05eXlVbzJZNzBvRXNwajRqY0wwQStyd2Fpd1U4VXRZUGV5eDNBNzBYaEZn?=
 =?utf-8?B?RkU5VGQ0TDNhdlVHell5MDJBQXdWSUZhTUFnZVREcStyQlBFcmwxUTVrc0dK?=
 =?utf-8?B?cDRvNEkxbWwyWnRoVGZSS2hkTDZOcGR4aXBndUhkaFNhL0o0OUZ0Vk9yeS85?=
 =?utf-8?B?dTZmL1ZxeVR2dVNSeTkzYTFScUdVYUZOZ2RISjBCUkRMY05pNHBFUWpCSkZT?=
 =?utf-8?B?d05tR0lVZVoxb3dtUVF5TDZydEE5emVrcGpha2ZackczSDlKbklybVIyOGVQ?=
 =?utf-8?B?QkxGUnhPbDBQRmx6cGYyZzhBakFGTENZRUdNT05Udkd4OUVqclV6SzNNZkVm?=
 =?utf-8?B?UWZROE5oVzMzMC9RY1Ftb29adUtXTDdSS2c2Zkw0R2ROaHdJZlVRVW9iNWhr?=
 =?utf-8?B?WWppbTE2SXg4OGw0dCtUamZmWUxHWGtEYW9HTURVeUk4RHNWa1MxcjB0bnB2?=
 =?utf-8?B?c1ZlZWg5UUdqeU5jYWU5N1IzWW04SkppV1hPWTB1elUzOVFoZlJseFRxb2tN?=
 =?utf-8?B?ODhlc1NqSUNab0U0SWhsa3lydUUxYmRuTFBFNFF2QzAxN1F0QmUrdS95YWo4?=
 =?utf-8?Q?HPZupV6qsAU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0w2ZDQvckJvajVCSDFvcTJ1cmcwcDc5TjVIa2p1WHRXeDZaRzI3QTBTYVJQ?=
 =?utf-8?B?SmloQXF3bWZjbHRCTTlMTzcxa1JIUVAwaGxJZ3V4V2R4ZDFCSlo1NDR4SHR0?=
 =?utf-8?B?U1lWVFR6YlpzVGpSQmJ5U0FzWlY2MFhjS000dDhPS2VDR2pBb0o5T2IxOU1h?=
 =?utf-8?B?M1FjaWxsdWtJakJDdGkxQnZRemNuejVnMWczMTZ2aDlvY2hmR01HQXdnRmhr?=
 =?utf-8?B?bm9EMXFlMDc5ejBCVHI3Q0xZejZDWnRxbjFZakJ1VG5XMkdoOXlYemhNL1or?=
 =?utf-8?B?SHp3WmdmZ25NUlFRM1B0cEJrUXE0MThYRlB6N3FXQlFDMFRvcEs4THRjWVMw?=
 =?utf-8?B?TlAwazRrOFV4MEd2bVZZMFJtQnBSVG1TeEY4ZUpJRjdVRTFMK2FSekpnTzMy?=
 =?utf-8?B?dUVCbEl2c3UvMCt4Ykxtd21jSkR1RUxHeDllekNESTZTU0pnRXVCZE5hZnFE?=
 =?utf-8?B?bW15cEVOWGJwTjFBZmRsazhSOXYwNWlsUUtCTnF5ZEpkNWNWL2swbWFuUG1q?=
 =?utf-8?B?Ui9oQnQ5a1ZkeWtIbjRuZDB1Um9BYkRaZjEvMVhiTE42VkhhdFBoaHN5ZjBN?=
 =?utf-8?B?TDQ2a0t0S3BteXU1a01DUnkxaUJQZDFZcFhCb1ltbUtGcjY5SzBzb0VTUlpz?=
 =?utf-8?B?UmZUd2d1ZnBQenlaR3FiUzBINDBzQXpKNHdHUE1RSHg2akFEK1JJZ2w0N2Yx?=
 =?utf-8?B?WWdHUVdFSU9CZmdFSGZ6WEZEQm9BVWdSU0NmcWorMUQ5ZzVKV3RuK3RjbHFs?=
 =?utf-8?B?cHBYbm1EeTF5cFJnVThPWTdwOCs4TkVsaTZ5amc0Y2FqcFN2c1kzYksyV1Zq?=
 =?utf-8?B?bEJNZFc5bWtONkNkMlJscGl3MVRPbndMV0RYNXV4OHBpOTRCYlNvQm5EUEx4?=
 =?utf-8?B?ZnlWMlg3elIzR3B2NngwQzZ5RUwwelNUeGQ0UDhkeW4vZHFHNXJWSlNlay9J?=
 =?utf-8?B?ZW9oMnlNejg4bHh6bXJWR1VHU2cwdHQ1YkU0MW5Qb1kzTGVFYUVkWnRZbEMz?=
 =?utf-8?B?VC90Y29Rc0RDRytndnlBYmNOZVAybE5ld09BQjZWczNrNzZxQk1FRkxEVURr?=
 =?utf-8?B?YVNiTkpobC9BWEpFWklWRlN1N1RVRlJzUWE0citnZmFnalJLOVZPM3RZbjM1?=
 =?utf-8?B?YVlxTGdGam9QRXpNaUF6V3dLc2RRWTBGNE1iYVVHS1NZdjc0OE1nSmhacnFu?=
 =?utf-8?B?WHUxSHNNazlzWXhITlRYZmRkaVc5ejdHMy9VYVA2UUFhOWhsc0tTR2lIb3pS?=
 =?utf-8?B?aC95QjlGV0U5SDlNQ0E2dGlSVkVZY2VmVUdVa05yYWdrc3VnWVNwUlB2WUxZ?=
 =?utf-8?B?YnVUMzFINUU4Sk1TbVdDVUJzN0k3SVhzWUtSUkl0eU1WcThPRGwwdGd4K1dL?=
 =?utf-8?B?WTFxNVAxK1poei9Eb0Z5YUxBbXBoYTFqQnNEKytTUlVmeURhSVlLRHFNYlNB?=
 =?utf-8?B?eDg0eE9KblRycmY1NTRKRkl5cXFQR2pNbGlXcHFtL1BnR1JzNnliUzdlUjRr?=
 =?utf-8?B?R1F6VDVySTNUYUp3V0gwQTNCT29wTHBzVkk5RkNObjB4d1dqRWNNTTNJcE5F?=
 =?utf-8?B?QVlpUE9WVzRjSk1MMmRMdS9iSWpTQmVOaG42ckdGdmdEek9NeVVkM2xyNWlY?=
 =?utf-8?B?MEM5c2RSVFk5SVhBOCs5amd5d1RyUlJpOU82ak5BRCtEWDFuVWlZaXJDWjdO?=
 =?utf-8?B?eEZuVGpUbmNsdEF6bXhIYmFqdUp4MVorOE9qYXJWcGxVcFgzQU1GK0JKVzZr?=
 =?utf-8?B?bFNxWUFTc3dPazlJRDJBdkpud0cyWTJOcjkzckp0VURKMUFHckhyWTZ6MVhV?=
 =?utf-8?B?eU8vVi9XMENmcEVwd3RVdStySmlBdkoydzVRTVYySzdlWTBWNmx6bmlBVFRx?=
 =?utf-8?B?SlVMaWtsdVpUOFgrRTV4dWpFa2RLN1k5S1AxTlNxNUZ4ZE1KZjh5aVZkNCtH?=
 =?utf-8?B?anl0OTNGTmJaMVpIY29NRDlCQ2dxbTVFMTlOWDh2NzM0SXBURXlqOGx3d1Rq?=
 =?utf-8?B?OTF6dXFPeHpaYXpmb2pTamNpWG1rN1gvWFVqQ0pqVDhuNDdLZThCTVA5Y3hR?=
 =?utf-8?B?a1FLc0lCZHZNQ2diOEJENjYwaURpa05oTjlySVV5eXI3NkdEYlRCekdzL2pt?=
 =?utf-8?Q?nOUMIvke45sLy17Pt15slooRz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a95ae5-8d54-4f16-c254-08dde41e5336
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 21:28:25.4407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0pBPVdOGyyn3tjlsw1tMjUxpte/1uT/IFeB0ujWfc2zj1gBR4nIOL9KI7oZu+V75NIPY3+9R6EfzKPYzHfeLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFB297DAF97
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

On 8/22/2025 12:23 PM, Lizhi Hou wrote:
> Add interface for applications to get information array. The application
> provides a buffer pointer along with information type, maximum number of
> entries and maximum size of each entry. The buffer may also contain match
> conditions based on the information type. After the ioctl completes, the
> actual number of entries and entry size are returned.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>

How does userspace discover whether or not the new IOCTL call is 
supported?  Just a test call?

> ---
>   drivers/accel/amdxdna/aie2_pci.c        | 114 ++++++++++++++++++------
>   drivers/accel/amdxdna/amdxdna_pci_drv.c |  21 +++++
>   drivers/accel/amdxdna/amdxdna_pci_drv.h |   1 +
>   include/uapi/drm/amdxdna_accel.h        | 109 ++++++++++++++++++++++
>   4 files changed, 220 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index 16ac0cab4f44..b8bfc0700798 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -785,10 +785,11 @@ static int aie2_get_clock_metadata(struct amdxdna_client *client,
>   
>   static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
>   {
> -	struct amdxdna_drm_query_hwctx __user *buf, *tmp __free(kfree) = NULL;
> -	struct amdxdna_drm_get_info *get_info_args = arg;
> +	struct amdxdna_drm_hwctx_entry __user *buf, *tmp __free(kfree) = NULL;
> +	struct amdxdna_drm_get_array *array_args = arg;
> +	u32 size;
>   
> -	if (get_info_args->buffer_size < sizeof(*tmp))
> +	if (!array_args->num_element)
>   		return -EINVAL;
>   
>   	tmp = kzalloc(sizeof(*tmp), GFP_KERNEL);
> @@ -801,14 +802,23 @@ static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
>   	tmp->num_col = hwctx->num_col;
>   	tmp->command_submissions = hwctx->priv->seq;
>   	tmp->command_completions = hwctx->priv->completed;
> -
> -	buf = u64_to_user_ptr(get_info_args->buffer);
> -
> -	if (copy_to_user(buf, tmp, sizeof(*tmp)))
> +	tmp->pasid = hwctx->client->pasid;
> +	tmp->priority = hwctx->qos.priority;
> +	tmp->gops = hwctx->qos.gops;
> +	tmp->fps = hwctx->qos.fps;
> +	tmp->dma_bandwidth = hwctx->qos.dma_bandwidth;
> +	tmp->latency = hwctx->qos.latency;
> +	tmp->frame_exec_time = hwctx->qos.frame_exec_time;
> +	tmp->state = AMDXDNA_HWCTX_STATE_ACTIVE;
> +
> +	buf = u64_to_user_ptr(array_args->buffer);
> +	size = min(sizeof(*tmp), array_args->element_size);
> +
> +	if (copy_to_user(buf, tmp, size))
>   		return -EFAULT;
>   
> -	get_info_args->buffer += sizeof(*tmp);
> -	get_info_args->buffer_size -= sizeof(*tmp);
> +	array_args->buffer += size;
> +	array_args->num_element--;
>   
>   	return 0;
>   }
> @@ -816,23 +826,24 @@ static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
>   static int aie2_get_hwctx_status(struct amdxdna_client *client,
>   				 struct amdxdna_drm_get_info *args)
>   {
> +	struct amdxdna_drm_get_array array_args;
>   	struct amdxdna_dev *xdna = client->xdna;
> -	struct amdxdna_drm_get_info info_args;
>   	struct amdxdna_client *tmp_client;
>   	int ret;
>   
>   	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>   
> -	info_args.buffer = args->buffer;
> -	info_args.buffer_size = args->buffer_size;
> -
> +	array_args.element_size = sizeof(struct amdxdna_drm_query_hwctx);
> +	array_args.buffer = args->buffer;
> +	array_args.num_element = args->buffer_size / array_args.element_size;
>   	list_for_each_entry(tmp_client, &xdna->client_list, node) {
> -		ret = amdxdna_hwctx_walk(tmp_client, &info_args, aie2_hwctx_status_cb);
> +		ret = amdxdna_hwctx_walk(tmp_client, &array_args,
> +					 aie2_hwctx_status_cb);
>   		if (ret)
>   			break;
>   	}
>   
> -	args->buffer_size = (u32)(info_args.buffer - args->buffer);
> +	args->buffer_size -= (u32)(array_args.buffer - args->buffer);
>   	return ret;
>   }
>   
> @@ -876,6 +887,58 @@ static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
>   	return ret;
>   }
>   
> +static int aie2_query_ctx_status_array(struct amdxdna_client *client,
> +				       struct amdxdna_drm_get_array *args)
> +{
> +	struct amdxdna_drm_get_array array_args;
> +	struct amdxdna_dev *xdna = client->xdna;
> +	struct amdxdna_client *tmp_client;
> +	int ret;
> +
> +	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
> +
> +	array_args.element_size = min(args->element_size,
> +				      sizeof(struct amdxdna_drm_hwctx_entry));
> +	array_args.buffer = args->buffer;
> +	array_args.num_element = args->num_element * args->element_size /
> +				array_args.element_size;
> +	list_for_each_entry(tmp_client, &xdna->client_list, node) {
> +		ret = amdxdna_hwctx_walk(tmp_client, &array_args,
> +					 aie2_hwctx_status_cb);
> +		if (ret)
> +			break;
> +	}
> +
> +	args->element_size = array_args.element_size;
> +	args->num_element = (u32)((array_args.buffer - args->buffer) /
> +				  args->element_size);
> +
> +	return ret;
> +}
> +
> +static int aie2_get_array(struct amdxdna_client *client,
> +			  struct amdxdna_drm_get_array *args)
> +{
> +	struct amdxdna_dev *xdna = client->xdna;
> +	int ret, idx;
> +
> +	if (!drm_dev_enter(&xdna->ddev, &idx))
> +		return -ENODEV;
> +
> +	switch (args->param) {
> +	case DRM_AMDXDNA_HW_CONTEXT_ALL:
> +		ret = aie2_query_ctx_status_array(client, args);
> +		break;
> +	default:
> +		XDNA_ERR(xdna, "Not supported request parameter %u", args->param);
> +		ret = -EOPNOTSUPP;
> +	}
> +	XDNA_DBG(xdna, "Got param %d", args->param);
> +
> +	drm_dev_exit(idx);
> +	return ret;
> +}
> +
>   static int aie2_set_power_mode(struct amdxdna_client *client,
>   			       struct amdxdna_drm_set_state *args)
>   {
> @@ -925,15 +988,16 @@ static int aie2_set_state(struct amdxdna_client *client,
>   }
>   
>   const struct amdxdna_dev_ops aie2_ops = {
> -	.init           = aie2_init,
> -	.fini           = aie2_fini,
> -	.resume         = aie2_hw_resume,
> -	.suspend        = aie2_hw_suspend,
> -	.get_aie_info   = aie2_get_info,
> -	.set_aie_state	= aie2_set_state,
> -	.hwctx_init     = aie2_hwctx_init,
> -	.hwctx_fini     = aie2_hwctx_fini,
> -	.hwctx_config   = aie2_hwctx_config,
> -	.cmd_submit     = aie2_cmd_submit,
> +	.init = aie2_init,
> +	.fini = aie2_fini,
> +	.resume = aie2_hw_resume,
> +	.suspend = aie2_hw_suspend,
> +	.get_aie_info = aie2_get_info,
> +	.set_aie_state = aie2_set_state,
> +	.hwctx_init = aie2_hwctx_init,
> +	.hwctx_fini = aie2_hwctx_fini,
> +	.hwctx_config = aie2_hwctx_config,
> +	.cmd_submit = aie2_cmd_submit,
>   	.hmm_invalidate = aie2_hmm_invalidate,
> +	.get_array = aie2_get_array,
>   };
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> index 8ef5e4f27f5e..ee89485299bc 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -164,6 +164,26 @@ static int amdxdna_drm_get_info_ioctl(struct drm_device *dev, void *data, struct
>   	return ret;
>   }
>   
> +static int amdxdna_drm_get_array_ioctl(struct drm_device *dev, void *data,
> +				       struct drm_file *filp)
> +{
> +	struct amdxdna_client *client = filp->driver_priv;
> +	struct amdxdna_dev *xdna = to_xdna_dev(dev);
> +	struct amdxdna_drm_get_array *args = data;
> +	int ret;
> +
> +	if (!xdna->dev_info->ops->get_array)
> +		return -EOPNOTSUPP;
> +
> +	if (args->pad || !args->num_element)
> +		return -EINVAL;
> +
> +	mutex_lock(&xdna->dev_lock);
> +	ret = xdna->dev_info->ops->get_array(client, args);
> +	mutex_unlock(&xdna->dev_lock);
> +	return ret;
> +}
> +
>   static int amdxdna_drm_set_state_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>   {
>   	struct amdxdna_client *client = filp->driver_priv;
> @@ -195,6 +215,7 @@ static const struct drm_ioctl_desc amdxdna_drm_ioctls[] = {
>   	DRM_IOCTL_DEF_DRV(AMDXDNA_EXEC_CMD, amdxdna_drm_submit_cmd_ioctl, 0),
>   	/* AIE hardware */
>   	DRM_IOCTL_DEF_DRV(AMDXDNA_GET_INFO, amdxdna_drm_get_info_ioctl, 0),
> +	DRM_IOCTL_DEF_DRV(AMDXDNA_GET_ARRAY, amdxdna_drm_get_array_ioctl, 0),
>   	DRM_IOCTL_DEF_DRV(AMDXDNA_SET_STATE, amdxdna_drm_set_state_ioctl, DRM_ROOT_ONLY),
>   };
>   
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
> index b6b3b424d1d5..72d6696d49da 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
> @@ -58,6 +58,7 @@ struct amdxdna_dev_ops {
>   	int (*cmd_submit)(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
>   	int (*get_aie_info)(struct amdxdna_client *client, struct amdxdna_drm_get_info *args);
>   	int (*set_aie_state)(struct amdxdna_client *client, struct amdxdna_drm_set_state *args);
> +	int (*get_array)(struct amdxdna_client *client, struct amdxdna_drm_get_array *args);
>   };
>   
>   /*
> diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
> index ce523e9ccc52..e19e4cd04ffa 100644
> --- a/include/uapi/drm/amdxdna_accel.h
> +++ b/include/uapi/drm/amdxdna_accel.h
> @@ -34,6 +34,7 @@ enum amdxdna_drm_ioctl_id {
>   	DRM_AMDXDNA_EXEC_CMD,
>   	DRM_AMDXDNA_GET_INFO,
>   	DRM_AMDXDNA_SET_STATE,
> +	DRM_AMDXDNA_GET_ARRAY = 10,
>   };
>   
>   /**
> @@ -455,6 +456,110 @@ struct amdxdna_drm_get_info {
>   	__u64 buffer; /* in/out */
>   };
>   
> +#define AMDXDNA_HWCTX_STATE_IDLE	0
> +#define AMDXDNA_HWCTX_STATE_ACTIVE	1
> +
> +/**
> + * struct amdxdna_drm_hwctx_entry - The hardware context array entry
> + */
> +struct amdxdna_drm_hwctx_entry {
> +	/** @context_id: Context ID. */
> +	__u32 context_id;
> +	/** @start_col: Start AIE array column assigned to context. */
> +	__u32 start_col;
> +	/** @num_col: Number of AIE array columns assigned to context. */
> +	__u32 num_col;
> +	/** @hwctx_id: The real hardware context id. */
> +	__u32 hwctx_id;
> +	/** @pid: ID of process which created this context. */
> +	__s64 pid;
> +	/** @command_submissions: Number of commands submitted. */
> +	__u64 command_submissions;
> +	/** @command_completions: Number of commands completed. */
> +	__u64 command_completions;
> +	/** @migrations: Number of times been migrated. */
> +	__u64 migrations;
> +	/** @preemptions: Number of times been preempted. */
> +	__u64 preemptions;
> +	/** @errors: Number of errors happened. */
> +	__u64 errors;
> +	/** @priority: Context priority. */
> +	__u64 priority;
> +	/** @heap_usage: Usage of device heap buffer. */
> +	__u64 heap_usage;
> +	/** @suspensions: Number of times been suspended. */
> +	__u64 suspensions;
> +	/**
> +	 * @state: Context state.
> +	 * %AMDXDNA_HWCTX_STATE_IDLE
> +	 * %AMDXDNA_HWCTX_STATE_ACTIVE
> +	 */
> +	__u32 state;
> +	/** @pasid: PASID been bound. */
> +	__u32 pasid;
> +	/** @gops: Giga operations per second. */
> +	__u32 gops;
> +	/** @fps: Frames per second. */
> +	__u32 fps;
> +	/** @dma_bandwidth: DMA bandwidth. */
> +	__u32 dma_bandwidth;
> +	/** @latency: Frame response latency. */
> +	__u32 latency;
> +	/** @frame_exec_time: Frame execution time. */
> +	__u32 frame_exec_time;
> +	/** @txn_op_idx: Index of last control code executed. */
> +	__u32 txn_op_idx;
> +	/** @ctx_pc: Program counter. */
> +	__u32 ctx_pc;
> +	/** @fatal_error_type: Fatal error type if context crashes. */
> +	__u32 fatal_error_type;
> +	/** @fatal_error_exception_type: Firmware exception type. */
> +	__u32 fatal_error_exception_type;
> +	/** @fatal_error_exception_pc: Firmware exception program counter. */
> +	__u32 fatal_error_exception_pc;
> +	/** @fatal_error_app_module: Exception module name. */
> +	__u32 fatal_error_app_module;
> +};
> +
> +#define DRM_AMDXDNA_HW_CONTEXT_ALL	0
> +
> +/**
> + * struct amdxdna_drm_get_array - Get information array.
> + */
> +struct amdxdna_drm_get_array {
> +	/**
> +	 * @param:
> +	 *
> +	 * Supported params:
> +	 *
> +	 * %DRM_AMDXDNA_HW_CONTEXT_ALL:
> +	 * Returns all created hardware contexts.
> +	 */
> +	__u32 param;
> +	/**
> +	 * @element_size:
> +	 *
> +	 * Specifies maximum element size and returns the actual element size.
> +	 */
> +	__u32 element_size;
> +	/**
> +	 * @num_element:
> +	 *
> +	 * Specifies maximum number of elements and returns the actual number
> +	 * of elements.
> +	 */
> +	__u32 num_element; /* in/out */
> +	/** @pad: MBZ */
> +	__u32 pad;
> +	/**
> +	 * @buffer:
> +	 *
> +	 * Specifies the match conditions and returns the matched information
> +	 * array.
> +	 */
> +	__u64 buffer;
> +};
> +
>   enum amdxdna_drm_set_param {
>   	DRM_AMDXDNA_SET_POWER_MODE,
>   	DRM_AMDXDNA_WRITE_AIE_MEM,
> @@ -519,6 +624,10 @@ struct amdxdna_drm_set_power_mode {
>   	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_SET_STATE, \
>   		 struct amdxdna_drm_set_state)
>   
> +#define DRM_IOCTL_AMDXDNA_GET_ARRAY \
> +	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_GET_ARRAY, \
> +		 struct amdxdna_drm_get_array)
> +
>   #if defined(__cplusplus)
>   } /* extern c end */
>   #endif

