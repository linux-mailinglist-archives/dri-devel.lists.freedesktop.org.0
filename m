Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4623DA4E20C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 15:59:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C9210E0B9;
	Tue,  4 Mar 2025 14:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=cherry.de header.i=@cherry.de header.b="Rn0dzO4l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011051.outbound.protection.outlook.com [52.101.65.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9DA10E0B9
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 14:59:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dq0RHyWsbnNSZtUo9Do9JwLAvyAtBHHZTWuikaS4OzTP1uHLAG9vCns5ZCZcKCbHXqE+18ARtlaqtaegVI4NFzv9zQf+Gj3DzrYxhy7B3MEZc/7W6944NdBOhaC4SqZP04yjVBTbwO7i+M4SSRLWcUjzFEfzNYF4g3VBUhGhA+jlFVduTbCYFgKdmkdzToI0nQhi+EnbhIb/4x9ZigJFxYz3jjZiKETlK00RwQCco2id6aP7HahNJQOjwurikRSJX7oR9BEhAQLtiKNLSKju5WCKsq7TpxBb0OEaabEXJfS5CyBFyWT+YfHb0E7g3w+l4aZ344t1MulsCjAGROGX7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qRYErZuh/5nu8DU8GvOWimxZn4aHpAYt1U1K8bZhzY=;
 b=wG5glbCZPhNiu1kRZPZQLBF3kngdmKmD2H8LMY/WpHZzWwNMt05Y1gEkO2HyP/4gjg7nT4vPONaiK2iMHLw94595H+6mpZ99RQgqX9DSU9kdvlnA7eQsuwvMnVRf/yj+uuXCG8VxugqO34sdXH1ePN24g6HRdCpH6lo7a2AT3GwcaE/YaYRz1nzKRuVc4G1ACS2sfcvUZRw7nH7E5tu3JDPl8Dl09mexrV7FWZEx2kGaUIsEAidFU8e37HiK0ka8E1DWI63GhkvrLubLDJjRb+hWavPsJaYIdmO8EiCf2dLZAOL1MqcgIu8faFeSIn2/qJIgUKPhY3vE9gVVcug7ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qRYErZuh/5nu8DU8GvOWimxZn4aHpAYt1U1K8bZhzY=;
 b=Rn0dzO4lIF2Z/3qEt3AcPsLhpxmX39HtdxyPp5qp6/1+p1qJoa06/DARC8dsSnChTdP81TUDSJD8IY9FHbOGVam91haFNabjy/0GKgAVlQ/G+90Aeg3+DTHswSXj8SOwuE/SsAYoNQ02yybE9skRxa1mMT+8sdgb+/T8Or9SU1I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI0PR04MB10210.eurprd04.prod.outlook.com (2603:10a6:800:245::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.26; Tue, 4 Mar
 2025 14:59:10 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 14:59:10 +0000
Message-ID: <cd001ccb-41a8-4204-8945-8ea00006ef0c@cherry.de>
Date: Tue, 4 Mar 2025 15:59:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/rockchip: lvds: Hide scary error messages on
 probe deferral
To: Heiko Stuebner <heiko@sntech.de>
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20250304124418.111061-1-heiko@sntech.de>
 <20250304124418.111061-3-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250304124418.111061-3-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::7) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI0PR04MB10210:EE_
X-MS-Office365-Filtering-Correlation-Id: d07d5766-f900-4413-324d-08dd5b2d1ec8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bElYWlBta0VZTkpvMGlhMjJUbmRQbEdaLzBaNWlZU3liekxZamVJQ0pQbG0v?=
 =?utf-8?B?QmdtQWpTSy9kb1FMWGNuaDZMdSt6ZmtQMHRYQ1dRdWsvQ01SaGhIQU9XcWNE?=
 =?utf-8?B?RDRNRFdhZDVPS1YzeVova2preUdDMFAzU3haV1c1MmQyZ3JibUFwdEdMbXlu?=
 =?utf-8?B?RGxxdzZNdDB1QkExK0N5Tnd3ZldNeDVFTGIwZ04yamZZdzZMc2Fmb3l4VXpy?=
 =?utf-8?B?bkIrQ0c2bmp2MVdjdjBjWkNtYnpmSUJrODNyT3R4UGFWZDh2alNqV3VJUGNE?=
 =?utf-8?B?V0FuZ2ptVlh5dnpWNDNmaS9BUXdhMEthS1NXMEFZK3NycUV5SmU4R0Y5cE9y?=
 =?utf-8?B?aUJ5ck91anJHSXNGNHdmbEFqeE1aTm1uRVhUT2lKY085RVJ6bHNrWklsMnMx?=
 =?utf-8?B?ZWlFbmNFY0tBVlB3djI3N2lCUDZhV2pGWEg1Rk0xWHljb01wRmMxd0s2MGlu?=
 =?utf-8?B?QXFEVWJjYjk0dGlmT3AxUHFDMDV3Y3d6bGgxakxIc1hhdjVJNVpjbXpLcWIz?=
 =?utf-8?B?bTdQT0xzNDZnOFFSWG90bXJuVGEvd0pXK0o1dXFQb1pydndkWVBqNWlxKy9u?=
 =?utf-8?B?Nis2SXBqWG9YVi9FemtLRTJGNGNCdzlEemtlcU1ENmJMOXk0TWpmdUVHMG05?=
 =?utf-8?B?RDZ5czZvNTFVMTBzNWdpMVF4NnQ4cVlIMVFpNW9jQUtFU2l0TFRyeEpydGVS?=
 =?utf-8?B?aGR3UEd6NWtFb0tlelpVQmpLbmJUUnpxWHQ2dzJXZjhFd0lUV1lHaFRQSHZ6?=
 =?utf-8?B?dDE0L2ZvSzlBNW1nQ01Uei8rR0owK0w4MXptYi9iWXpvL05wbVM5Y2E5cjlS?=
 =?utf-8?B?VnkwV0djTXh5S0RTeTlJNGl3eGpoSzdDZ1VQZm8ydm93ekNyaHdHa2F2WVNR?=
 =?utf-8?B?dmhkajhHbERkU0h0TU5uam1UWWF4dyt6dy9OTk83N1VLa0djOUZMUzBNdHdG?=
 =?utf-8?B?UGhVeVdpS1VMOW9NbWhKVGdacHR1blBwQXlvbkhtL1ZuTG5iN2pIeEJOaGZC?=
 =?utf-8?B?TXRvTWRFREIyekI3Y3htTE5PR2ZORk1RZnhNajhMdjhuSGE3ZWRWWUVHbUVm?=
 =?utf-8?B?djNoTWhMalpSVU9xUmNsR1JBdGlpSnNhRXA1SU05Tmp5K3d3SmNVSmhIYzRI?=
 =?utf-8?B?dnpCVWwxSHZVKzdJT1d1OStWYU5mamN5eE5YNlAvRE02dVExSTcyT3ExTWJF?=
 =?utf-8?B?b1pEZi9aVFQyVWxQb1NTTnpuSVpjS0M0NlBhVnJRS2lUQTM3VnRtYWhsWVhj?=
 =?utf-8?B?Ky92b1ArbjhkcGJDR3dTeURwYTdCbFBzems2bE9qeWNhaHdzek1jQkkxZXdC?=
 =?utf-8?B?d0dnVk4wZ1RzcG5mNjBpV2FWeGp0VnZnTDA0WTk4UjNXL0ZlMnpVSm5oRnVk?=
 =?utf-8?B?ejdTL0NOeWl0YU95aEhJeWJ6VWpCUHYzblE3NGhEVllMMFQrK1BzMmxtSm91?=
 =?utf-8?B?SVl4Y2g3bmdPaWZIa0Rva3JvSCt5UkI5dzJKaytkQU9Rem1PTkwvSUNkRTBk?=
 =?utf-8?B?Qng1ZzNYbVdFeU1UbU15Rlg3UlF6cGh2Y2VaTE5Gd293bytnMnRiaWlpLzhv?=
 =?utf-8?B?MFh2VldmSDg3UFlOeHFNck5peWFWK0dFaVBraWFFbUhSeGNBcWdqWDFRcy8y?=
 =?utf-8?B?OW5KQ1I1NW51OXROMGdjYjdqTnMwVnc0anhxT2UxQzNSQ0N3Z1cySzcxU0s5?=
 =?utf-8?B?STlOTjdvalI1eERoTTVrWGtZN0xQMnZEcmNGY0pLT0xzVzZYWVRGVi9KNkNl?=
 =?utf-8?B?ZEZSTTE0bnhqbUxYNlpLS0JtbXJ2bzF3c21VNUl6akNYVHlxTDV5Q2JXS3p6?=
 =?utf-8?B?RkY0NmQ3cS9zL2puVGdDSHZIemtQZklxdHdZWnBIM1ZRRnRmNkdLbTZEWEFO?=
 =?utf-8?Q?vCq4YMf+UofDB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8897.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDEzZlZUNEdMb1hqSEpFMnNBQitEc0ROM1BUaFBob2l6L0xuRzJxQk5pWHJK?=
 =?utf-8?B?b2tHb2xObitlN1gvRGQ2a1p1TFVFL2ZoZzJhdzFuUG1UVHppRjJrRzNxS2pL?=
 =?utf-8?B?bk1xVTA3NFE2NHhFWDB5OVF3Rzhod0NVU21PMzA3cWRnajI4a2htTm5hbldT?=
 =?utf-8?B?U2I5cTM4c05pRFBhdHNhUkQ0bVNQQnhXSVZDTmQ0NE8weFVCWGFNanFRdVdL?=
 =?utf-8?B?M3RaU2F2MXdQYWRRbU50WkwzaWpOcVZ3am9EZTFsY1ROYllEZ25VdEk2NDhw?=
 =?utf-8?B?M0JVSHVhR2I1T1IrVGxKYlp3dDBiYmxXZnhyYW9lYitlRXJBT2I1Zk9QNWxu?=
 =?utf-8?B?V2JNbDN6SmtVYXpVbDd4eE9ZTDUzOStidlUvc3J4YjR3b1RUVWhrV3NuWmxL?=
 =?utf-8?B?N09ubWlkNGhnSjFhcVhRK2RqUW91M1pmcU1kSWJSQTdleldmTHNNRUFpblNJ?=
 =?utf-8?B?bnFUMHk4YTF6TVp2dGlNc0Z2VCtLM1RnMnNpUHlNeGtWZ04zNXl4aG5kWFpq?=
 =?utf-8?B?RmhaR1ZaUWVPTkV1Wm16aFFBdEN0RHFhL2xpd28yN05lUDMyQ3FUSzl2dy9S?=
 =?utf-8?B?cWtjZ2srZFFVOElLQUhNVEQ0b0RTdFNMR0JtR0tOSWZ1SGZSNVUyOTB5a0pt?=
 =?utf-8?B?L1VzT3N1eWkyWUlmc2NLd3k0T1d1c2psc1pTelRhNE9IWkxCcU1ieXQydHlj?=
 =?utf-8?B?SjNjMXRuTjBzYm4zRUNQNlRPeVdhUk9hM1ZlVVg2NllWUUZRUFNnS0N1cUIz?=
 =?utf-8?B?M1piQUR5Z0VmdXo2SEprT2pXTURNT29zS2QxcmZIZlNyQk9WU0dNUTR1aGxy?=
 =?utf-8?B?ZkE2R1BzZnFnZ0FtSFFPY3hPeElGMVJsVUFsR2tVOERhbHdWYk41T3JKVkV1?=
 =?utf-8?B?VGZoUlFmRnVjRzBVTmFrUjZaWWxETm5rcU5LRTQ0Z20yUFNJVWlnVit2ZG5m?=
 =?utf-8?B?YVh1YlNDOTBQZU5vMVQ5eXJrMVR1WGJDSkMrMXdCcEVFeGxOOWRGWGg4OFdX?=
 =?utf-8?B?WG12QTlpaE0vNGxCS1V3cEoyc21JckF2MC83RGJzeElzUkYzQnVMd1M0dkxy?=
 =?utf-8?B?bXZlYmp5SHlMT05CbjIycDNhdjVXeFh0ZFFnT1lHNnV5Q0VjY3ZhbXFQQ3gw?=
 =?utf-8?B?TmJURURvVXN1VDhlZDJFRWczRjEwT3crL29CbGhNZDBBR0hpVjlNUElkVXRt?=
 =?utf-8?B?Sm9QblpEaVNSM1kwSDRzSkI3Mmt2TnFOYXQ3SDBIRFlacGtjUlJKWk0yaWFC?=
 =?utf-8?B?UnEyWEZZcjE1SjJVRk9RSFBKNW9tVHZIdjJCbkxJNVhlaFl3dnZHRmtZOTRw?=
 =?utf-8?B?U1lHUk1Rc3h0aC9UR3JTd1pydm4zdDcxOGticnBobTVYanZZR09yZFRkSGtn?=
 =?utf-8?B?cnRoc2lnakVCNWtYK2JDcXpJOERJWDd6SkRtU0wrQkIxSzlvRlF6YmpwbkNY?=
 =?utf-8?B?bU1CaVJ3ZjU0Rys4dmFRanVYQ0MwajV6WmxpTEYxS3RGR2dGVVNKdlBVOHU4?=
 =?utf-8?B?MG8yZWVQRTZ1aUR4eU0zMG12ZTZsLzFmeGljNzUxWmFBTCtPSDlaaDFyMTZJ?=
 =?utf-8?B?NlN5N1NadSs3a3IzUFE3L0ZERXNWeGs1NnFqcDBxZnlpSG53dHd4Y0ZvaGFw?=
 =?utf-8?B?Q0JyRG9vREFHb1BKaGRmb0MyRWhnYTc2YjhMdXVFYlZRVjJJaTVlYmZ2Qkxu?=
 =?utf-8?B?M1hDSDUzK050bmUyeVNyOXEzY1loU0Y0UzFTeW03RmZheUs3VkNtdGw5bEVy?=
 =?utf-8?B?OUtSbmR2ZHJxeWVUR1hKYk1zRThvV1NRMlFqbzVnNUJKVlE0R1RCV2N3NGhH?=
 =?utf-8?B?bTVyaGRNNkRTa0c5djRsbzE5OHNQY2duZGU2enNjT2FXVVZqL1o3d2lVem1I?=
 =?utf-8?B?NHh6SVZ3enJQV3NUUmRQejF2S2NjM3hldnZPNkFHdzRMenNNVW56ai9Ib0ZN?=
 =?utf-8?B?YXVoMU1HS3hRTmlYQ3pmL1RZQnUyeXFwYzBJS3ZoU1lCM0pUbUlyL3MyZFd1?=
 =?utf-8?B?Y1FITlVQOWg1ZTF2SDI3V1VMcHJHeS81Z1gvOHpDUEd6T1BjRG9uZVp2aS9k?=
 =?utf-8?B?N3NoTzY3TmlXcFBscmNlMzRrQk5LdVBXUWJsRUUzUXZwT2JEbUhxUzc4R2FD?=
 =?utf-8?B?d1cxNW1QV3NvTVNncDhWU0JvU3hmVEgzZjZwMzkvSHMvSFJCUTJoaVVuRFp4?=
 =?utf-8?B?WHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d07d5766-f900-4413-324d-08dd5b2d1ec8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 14:59:10.7157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jeHP3RCe0DjsSw+3PIw8cjz94txdyuJFmnhdz6yJGNG280TBwzeh43tvwEvl5ngIL3JRjOPmUb9SoO5N8z1e83uAQXxBwPhJb2e9xPfr0bQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10210
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

Hi Heiko,

On 3/4/25 1:44 PM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Commit 52d11c863ac9 ("drm/rockchip: lvds: do not print scary message when
> probing defer") already started hiding scary messages that are not relevant
> if the requested supply just returned EPROBE_DEFER, but there are more
> possible sources - like the phy.
> 
> So modernize the whole logging in the probe path by replacing the
> remaining deprecated DRM_DEV_ERROR with appropriate dev_err(_probe)
> and drm_err calls.
> 
> The distinction here is that all messages talking about mishaps of the
> lvds element use dev_err(_probe) while messages caused by interaction
> with the main Rockchip drm-device use drm_err.
> 
> Reviewed-by: Andy Yan <andy.yan@rock-chips.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
