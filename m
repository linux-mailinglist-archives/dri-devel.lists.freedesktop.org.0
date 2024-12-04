Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF849E47C5
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 23:24:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A12810E5AE;
	Wed,  4 Dec 2024 22:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vyXwQODc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093A010E5AE
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 22:24:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2Yub+Tzu5N4WCSHeto29RceWFORY2t0MU9kZ71ZytptoPMjX+A3qxcUjfXTbx45HgxHB80x10MkWLlHGP7VSGo53gC/FSxZutNNbEwL6umc7/FNH3GsfeRvgy5FDOjtUAk0GbS4LOMaUnVVuTGKIfmjViXK7xQiXXKt7xqLGpUI6avmz1ANn1o1YnjfiUw33TI10GB37lxmZ2vq1gxNkORJ5i0OMTp3yzmrtulCR3sgyKNF49sFO4Zf7Kj6+8zSbUgBoFrG66SNOvQS+vht4Nq6MOy+DgCfu18VuJpK6GCctE9sSXhLglaz5jg/N9Jgzv3fvBrVUujyE0muZfppng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tsjkWeRBqmIcUaX1V+WRbsPv/QxhiB/hmdRW27jfOn8=;
 b=dllft5N5q4BlYeeeboBVg6EsW+E3gb2Ih+MJ+w6ChUO4CR0vcx3P4MEAXSGxppT3Thz6KcCOOoPgrLIp9TJNDIJLVNYJ1NvecVESDMEeUG/0Mb4VWbMMRajWuEeILQ5lrf1qjECTgOMzJFLLZD4RZUF0JvvZ6J/Wn80nuqLVQOBg4HJ907SeQCZPnZigUpNs3Igd2I3OhcKMQ/FAlYp/TBo9B7M4huXj9eVeKtJo4SHd+pF9cNoWgP9f2Kyd/XboyVuDhjPntL/bcIjnf9aw0R0AclQL+/NHRV223/RsJVYvfOn8wfVK68VWA9DrEQUgymoKgXm53yZwILdr7bnRqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsjkWeRBqmIcUaX1V+WRbsPv/QxhiB/hmdRW27jfOn8=;
 b=vyXwQODcrmAO9CYkqwu8zfma0Z9mNoXyj/VOSBY2FAGNCQLFd07mGUMtXsoBgTGzDrIuHgZPcuoWw6hDyXDTgLBk4esp5zqy2Ql78M/i+1f+uF6Ff9OOGxzU9+4lai2do8WCoXdZ47EPMEut5lQ4DCTcADy7U7YAyKmsAKWtDCo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB7617.namprd12.prod.outlook.com (2603:10b6:610:140::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.20; Wed, 4 Dec
 2024 22:24:04 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 22:24:04 +0000
Message-ID: <4f233efa-8269-4f6f-bd22-0dcf2810c4ab@amd.com>
Date: Wed, 4 Dec 2024 16:24:02 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 5/7] accel/amdxdna: Add query firmware version
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, min.ma@amd.com, max.zhen@amd.com,
 sonal.santan@amd.com, king.tam@amd.com
References: <20241204213729.3113941-1-lizhi.hou@amd.com>
 <20241204213729.3113941-6-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241204213729.3113941-6-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0181.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::6) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e2584e3-5b9d-4887-df41-08dd14b25c57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elJCM2syOXYwTWp0VXB0TWk2MllBbjV4VHBYVkd1cWRYV3plTEM1S1lGVjhR?=
 =?utf-8?B?THU2SmFjU1lZak9wS3Y5Q2tuMThJL0FmRXlzMHRxR3MxV3BUa3p3WVJnUUtE?=
 =?utf-8?B?d3laUHBCd3RoVXZEUXdoSmphM29uM3A5YzRzcElTQzlKZ2VIczBtcWRqc0N5?=
 =?utf-8?B?M1NHWlhtd1Z1bFlyRlkxd1hIbktqN1NzRE5pc1l2S2l1Qk1ucmNRQ1loZGVx?=
 =?utf-8?B?VXZXVG5NanFpNDBrM3cwU3crbGtuWDY1WFhxL1U2RjQyTUpPNThKOXBobVBP?=
 =?utf-8?B?WHFXL1pqNXVNVnhYNm5ZRnpnbWxyR2l1ZHlDK3RlTTVyTUNaWkQ3UzI1eU9J?=
 =?utf-8?B?bzJLczYzSUd5bldWb1RheHp6UGhLeFVXcE5uVVlla3Qrb2h4U3JabEphMDUv?=
 =?utf-8?B?OXFEbWFseUpmMGR3bzdmMEhLZytUZ3JYUUVtMC96NjVzdlM1YzY5SnZOTXpI?=
 =?utf-8?B?SUQrdzFscC9pb3IwdFBRUWVMQU5teGxibjFwRFJOWnR0QUZqRFFETXdvZDRx?=
 =?utf-8?B?WjlaV3VRdkhoM2ZpSWxlMXhRclgreDR0eHlZTE9LZlRRMEFHdTVDZmVpVUs4?=
 =?utf-8?B?OGYvTnV6UzhxbDBadWRnOFA3Q2pZbDhxdHdVZjY4OXpTTlNPSEZLYVJKeWtC?=
 =?utf-8?B?cWdzL0lKRVJaV1Z1amdrRkFCeE4zSDJqQnpHMTRQajFJY3ZsQmZ2Z2RGNlY0?=
 =?utf-8?B?QThHSXhQd00xRVh0MVozVlV5SkVyZXM4bDVzKzRuSEc5L0V2TFIwS050aG1N?=
 =?utf-8?B?R3FCM0E4TS8rT3l4ejBJdDNjTlN5RTNhZ3BDY2RaeENBMVVQVE5KVUpkdzNI?=
 =?utf-8?B?eWtQYnZkUWpnQzVaWWNXdGpXU1R1T2hmOHFCSW1kN1ZVZittOWRubnRqWFJS?=
 =?utf-8?B?M0p1djdXN2Q1UXF0Rm5ubjNrUUIrQ3dhOUpLZjhrQ0taZzVNSUVkMDZUMU5Y?=
 =?utf-8?B?MHJjOW1BVWVjWnlKSFhNR0xmQ3Byd1BhQVcvVE5VbG90SExwRCt3THdJVWFP?=
 =?utf-8?B?TVNZUjV1ZUhyMSt3RkxiNHdZUnY2b2xTSUpCK0h6aGE1SmltcGNhOGhib1hv?=
 =?utf-8?B?Sm1WMGNVdmlpQzN4NXljZW5XdERIYUpGM1N2OHFsTnJsZzQ1dmtEbzJpQVBi?=
 =?utf-8?B?Z3VaNzNEck9ycDBTblhIK1J4ZVpHS21VVHVTUmN6dUhGVGtmaFBOMUVVQ2hB?=
 =?utf-8?B?UUtNc2l1bnpVK3YxR0paNTcrWk9yaE83RlZDL2hzRUxsSzBUbk9qUXllOHda?=
 =?utf-8?B?QjFvUERtSjFFTlVTOEFtUjFuOWx6bFVPSnM5aTU4N3B2RDRWaHhMSnRYZFNt?=
 =?utf-8?B?N0NsODBxNEdLZE05azhwOXA5dFB4TnNJWGtNRTBsVXVjWkh3bGhPRzRGelEr?=
 =?utf-8?B?S2wyZmd1aVArTHRLVFRYYXh3dGxKZ3NjMWY4bTVGdHMvUTExZnBjb2JiWkR4?=
 =?utf-8?B?V3NnRlh2QlorcXhJRm1US1M1bjR5TjNNMTVybWNrV3lDZzM0djhpRXpjallk?=
 =?utf-8?B?NlUxRDhBenVUN25ZYmJDcGwzby9VN0txZ2VVdFo4WmUxM1dLaHh2dkdsMDNG?=
 =?utf-8?B?L3NlRGM5VDc5bWhSOTVSR1N1NUVjQURqS3QxZHBMbmhVdkFCMGxMZzRQN3lH?=
 =?utf-8?B?Zm1DdGRoTkJISzlQcE1hNXZ5WUdZU1M1YkRLaHRubFU4SkNmUmFrZnBGdzJV?=
 =?utf-8?B?ZXhvbjZWRFNoVzlST1NRZFR4WXBqeG1RazREK2pWMWpMNnE2c3UwZ2dxRVRW?=
 =?utf-8?B?OWxTQ3ZvUVBaaSthTzIycGhPNENKQW9nK003cEFRb2U3cEVHNzNKUGJ1RkY5?=
 =?utf-8?B?K1FHQVhnN3pBYlB5RGtQQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFMzdTlrZ1ZUWEdEUWtPTEtlbDhweGQyRCtTNmNucFVYUFFxcjI0Z05QOHBD?=
 =?utf-8?B?V0JUS3piUEk5Qm5ELzFMRUFDSng4VVBlRTc3c05VWmxSZGsxZWpVSDFyb1hX?=
 =?utf-8?B?c3V1Q3h3b0J0TjlFVjdzbERUSU1vYWNOWGVhWUtxT3B3VFVQY2J6K1QybGFh?=
 =?utf-8?B?L2RTaFhrR0UxdEl2ZTRKbnl0eXNvbjh0Z21sRlpUNTluNlAyY0YvSnJ6MUlB?=
 =?utf-8?B?djM5b0dmQTNDYVM0UjIvT1dMeVNJYmt0THAvOGV3eFY0UnkwMXQ4Uk4yd2tJ?=
 =?utf-8?B?NDNEZTYvNXpma1k3K20yKy9kQ3NpZlhjUHNXVWd4K0FMQTA0UXFhc3EvR0VC?=
 =?utf-8?B?cFdBTVdZVEdSQmRQWWFqa2ZEeUw3VVcwaEVTejl3Z2lDWWt0WXNMWmVKb2dl?=
 =?utf-8?B?V0JPMDVPblpWSzgwblRSSStLL29lK2gxNm9sVnZtUUpSRVFzN0MwT3kvYTF5?=
 =?utf-8?B?ekhBbSt0UmdGY1Znd0d3S1plbVY5bHhENFM3a25WVFJJcGZ2S3FiUko3d3o0?=
 =?utf-8?B?VFJPc0ZGMDBQK1JZNm1pSDNpY3FaUkgvbGluc29IS3FsdTBkRG82YkRqNzU4?=
 =?utf-8?B?TERJbkJlZEx2R1J6a0Jhb2NaelcvbDNiMFlZMjY4dXhjZlF6aFJyRlJCQXdM?=
 =?utf-8?B?WXlFdStMWUhPVWdQdnFQWGJWZldvOWxiZlROcGZUazMrR0JpUjRoWnJicVpL?=
 =?utf-8?B?RWJkeUdHVXFXMGJiV3pkZTJjQXF0QTRkVS9QKzNxdUpLRUNoYXRsWmZ5RlJ1?=
 =?utf-8?B?RDNhZXpaK3JWdnJPM25Ta2kzSW9FWTlXUzRaNzFCT3p3OFg1U012ZUF0QjI0?=
 =?utf-8?B?bS9VUlcxcUdCS2RYdjRMeHJlSFh5YXdvN1EvOVZmTU5IZHBLWHZMMjRWbDBV?=
 =?utf-8?B?Q09WejI4ODZCVGdsWmVNaENzYzh6ejl6UDV5Q1RqUjQ2S0hNSGh0cGQvckFT?=
 =?utf-8?B?VmdWZmVyclFCbnYraGg4RTF6ZUkvYTlQeVlwd3ErV0NqSnJxK05xUW5PV0ZK?=
 =?utf-8?B?Y2g3aTZMeDNWZnZGRFBtaHlBYmdXcGZDTXhjODdHUkMvaUZRNDJOa01SMEsr?=
 =?utf-8?B?MjFnNFpJeDZBeUFpZnBTNFJEOHFIQllUMWxSRUhlMTluSEVYMVFTV2wwSGI1?=
 =?utf-8?B?VUJqZGNkV2hhNjVqWFZkLzREQy9VcUJPU3E1K1Q2bUJyNTFwUTFQT3J3Z2xa?=
 =?utf-8?B?M3lXeUdtd28vS2lBR09CRlgxeWJraXh6TEYrb2Zzdlh1Sk9Dc28xMzM3YWo4?=
 =?utf-8?B?V1Z1bGwrelRQbkNCRDIxMHRNUG1kZEpCN2FIWDFUQm14eVdZMEhkd0pCd1M0?=
 =?utf-8?B?YXB0Z0xyYm5aZEh2cmR5aFMzblBSVjRxeTRpTkdlVG1hTFpOVlZuelNHaXhP?=
 =?utf-8?B?VE5RYW9TT3FJYmp2TlRYTU10N1VjeDEyUEhzK2h2S2Z5QlhOV3JGVVpQaGlu?=
 =?utf-8?B?eXBTeWRWZkRPbVFmVXoxWHg1bGVreC8xRG5oU016RWhOaHp4dS9JZitFdjVO?=
 =?utf-8?B?Q0hwVzlmTlNiRG1ORkpQek9RdXpRbVdVbjFrUDV0OWlJNHNCaVlvQkF4SmYr?=
 =?utf-8?B?cUN5S0FRTDFHaHM2NHdyUTRsZGFNWjdLNGliVjRLaHQ5Y1l2NExsZmEzajZt?=
 =?utf-8?B?ZlltMUYwcStZcUcyZGxsWHBWOG1ZVTNBM0wrRFlPWVlzcFlINEYvaHFjb0NC?=
 =?utf-8?B?T3JCS0tSZ2V4MXZCUkszQ05EaTJMNVFNejFQVkt0NEhBR09ybHZMb05JNHl5?=
 =?utf-8?B?WWRjQkFQeEdnUVRWcXF3WHI3cGdlYStCWllIcUppRWQ4OVU5cHFLSndYRjRK?=
 =?utf-8?B?R294aUNReUxsRzVEdGo2R3BVdHFhMVFNYlFwZWoxdnlCK1RoMnE5bXdKNG9I?=
 =?utf-8?B?SUg0Ync5aFJ6TU9jZlY0QTA1NDdpZnlqZkIvWUg1STVXNFlCQnFIcFdCZUZI?=
 =?utf-8?B?Sml0d1p2TkpFZVVONEU2a2hsc250MkxTenl4Qk5ZVzlQQ0VydHdkekRIb3pR?=
 =?utf-8?B?cjJxUDA3a21FQldpdHF6dHRSV05VcnRCR2tyRll1ZmFFWXlWZXBkUWFQdFdu?=
 =?utf-8?B?MGhKT2J2Y3hCZnhFY2h2WWk2ZVZvdEQ3RXliMVp0MEpSSUtWSjBBb0RlTDNn?=
 =?utf-8?Q?l8JNJ00cZpjGp+Xj7ljV6L/lJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e2584e3-5b9d-4887-df41-08dd14b25c57
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 22:24:04.3991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ydNUtI89jcxWRYT4IzQSGKF2P90syWXHHZY9GmvhBYHXjnCN7v1zKpWaZ2CTbjQvH9r05ZNA9hSR+WTvyp/5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7617
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

On 12/4/2024 15:37, Lizhi Hou wrote:
> Enhance GET_INFO ioctl to support retrieving firmware version.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_pci.c | 20 ++++++++++++++++++++
>   include/uapi/drm/amdxdna_accel.h | 19 +++++++++++++++++++
>   2 files changed, 39 insertions(+)
> 
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index 1c8170325837..83abd16ade11 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -640,6 +640,23 @@ static int aie2_get_aie_version(struct amdxdna_client *client,
>   	return 0;
>   }
>   
> +static int aie2_get_firmware_version(struct amdxdna_client *client,
> +				     struct amdxdna_drm_get_info *args)
> +{
> +	struct amdxdna_drm_query_firmware_version version;
> +	struct amdxdna_dev *xdna = client->xdna;
> +
> +	version.major = xdna->fw_ver.major;
> +	version.minor = xdna->fw_ver.minor;
> +	version.patch = xdna->fw_ver.sub;
> +	version.build = xdna->fw_ver.build;
> +
> +	if (copy_to_user(u64_to_user_ptr(args->buffer), &version, sizeof(version)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
>   static int aie2_get_clock_metadata(struct amdxdna_client *client,
>   				   struct amdxdna_drm_get_info *args)
>   {
> @@ -752,6 +769,9 @@ static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
>   	case DRM_AMDXDNA_QUERY_HW_CONTEXTS:
>   		ret = aie2_get_hwctx_status(client, args);
>   		break;
> +	case DRM_AMDXDNA_QUERY_FIRMWARE_VERSION:
> +		ret = aie2_get_firmware_version(client, args);
> +		break;
>   	default:
>   		XDNA_ERR(xdna, "Not supported request parameter %u", args->param);
>   		ret = -EOPNOTSUPP;
> diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
> index af12af8bd699..ea86c57beb92 100644
> --- a/include/uapi/drm/amdxdna_accel.h
> +++ b/include/uapi/drm/amdxdna_accel.h
> @@ -375,6 +375,20 @@ struct amdxdna_drm_query_hwctx {
>   	__u64 errors;
>   };
>   
> +/**
> + * struct amdxdna_drm_query_firmware_version - Query the firmware version
> + * @major: The major version number
> + * @minor: The minor version number
> + * @patch: The patch level version number
> + * @build: The build ID
> + */
> +struct amdxdna_drm_query_firmware_version {
> +	__u32 major; /* out */
> +	__u32 minor; /* out */
> +	__u32 patch; /* out */
> +	__u32 build; /* out */
> +};
> +
>   enum amdxdna_drm_get_param {
>   	DRM_AMDXDNA_QUERY_AIE_STATUS,
>   	DRM_AMDXDNA_QUERY_AIE_METADATA,
> @@ -382,6 +396,11 @@ enum amdxdna_drm_get_param {
>   	DRM_AMDXDNA_QUERY_CLOCK_METADATA,
>   	DRM_AMDXDNA_QUERY_SENSORS,
>   	DRM_AMDXDNA_QUERY_HW_CONTEXTS,
> +	DRM_AMDXDNA_READ_AIE_MEM,
> +	DRM_AMDXDNA_READ_AIE_REG,
> +	DRM_AMDXDNA_QUERY_FIRMWARE_VERSION,
> +	DRM_AMDXDNA_GET_POWER_MODE,
> +	DRM_AMDXDNA_QUERY_TELEMETRY,

This is more than DRM_AMDXDNA_QUERY_FIRMWARE_VERSION.

The other ones should go with other patches.
Like DRM_AMDXDNA_GET_POWER_MODE should be in patch 6.

I didn't see DRM_AMDXDNA_READ_AIE_MEM, DRM_AMDXDNA_READ_AIE_REG, or
DRM_AMDXDNA_QUERY_TELEMETRY used in this series, are they just 
placeholders?  Maybe a different patch for the placeholders?


>   	DRM_AMDXDNA_NUM_GET_PARAM,
>   };
>   

