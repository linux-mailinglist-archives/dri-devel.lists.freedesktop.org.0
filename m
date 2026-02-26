Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEuVIC+QoGkokwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:25:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE821AD915
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:25:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046F310E9CB;
	Thu, 26 Feb 2026 18:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="T5Rd1Ref";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010038.outbound.protection.outlook.com [52.101.201.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA1B10E97C;
 Thu, 26 Feb 2026 18:25:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DUduklsZrHkQishuUPheRHmgVXZDZtxmGW/ZDp/KN1jcJEU5FAn+/plxULygOltk5HUm6z/1OENO8oeodgTQMMQZ/xuFzuJnocuX46lG34Bg0pyTrImLEJrhO1moAvlp5pfaK+ntLOB/lXy/jQBFb3jsGnjgl23UQ7IxwqZmESPzrTKC7V7P2ZDGA9rk/JhhsA2PGATemEJYdyA7KrofffH1Fz2yBk4KW9yLcHd/k46BNz9jLB4VVe9eExI7J0a2+9OweDp/qE7fo3Uzii30HJOqlA4SlZOgHIuowTTrxawVVAixzKpiaiE9CzXjVkiG1fMuUtR7rdtGxphbooZwUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPJp5w19Fx+MlYCGTQ73OECtl6RWRLR8f56KXzk5WL0=;
 b=jWU5DksezKpEO2lrEqIpywS5iCGg0U/kdTkSE5fSRGQd0VPW1QkZzI4vuFwpZYJGVN72eqQWulR5w3W1+lNoEyoFlWFboQj7XMorTTIFSsKljek/Eq6NeW+LIvd3T4hFLDHI2qeU90kXu0x4jbeFuo9rupuUblhShPpk3+9UGenNrGfSIUdqziliBEzGfjDynkEwnT7wPkAhHLY6njeKpqzecKmrh/Erx1fvMWLQ1HVXhOI2JRUa54J8+6Bawg1B9FUfodWkx/4dDhi2PqUaK8tZp4SsGuZQL3kDQWF98CG7nYb+4rLU2drYgz7n9WlNs2Cu8QaVO91j/oHcT4EIMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPJp5w19Fx+MlYCGTQ73OECtl6RWRLR8f56KXzk5WL0=;
 b=T5Rd1RefJz7HEyjGB5AdSupkSAwnPBJ3/dAGQmGJzq+YHWfDIBx0ldTGkENN6GS1JKVxfmV4L9xSUSuqbkHlrZZFQUtrF6f7nE1GpUNjsYx3EPVrJC7LZ5gqJ1HK6qihTn8/ew27NdN5hw5miJABNDDzPDmJzd/k2zaEoXvoPofG7G6NoBQwDsP5W8VeeLcPrTNDOItEOYV+ywmqbD30DcxbMDCG5KiAAVH/lT6+dbWuey230mosgTA6dIUijSC9CEm7i1Jn6/DmNKqaVOEtVcDzxo0V/dKFYy7vYSJ2I/Iah9sW/u426AwhatO/GTY/W/G45l9MCId+4xqVQHU8GA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB7548.namprd12.prod.outlook.com (2603:10b6:610:144::12)
 by MN2PR12MB4173.namprd12.prod.outlook.com (2603:10b6:208:1d8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Thu, 26 Feb
 2026 18:25:41 +0000
Received: from CH3PR12MB7548.namprd12.prod.outlook.com
 ([fe80::b710:d6a1:ab16:76de]) by CH3PR12MB7548.namprd12.prod.outlook.com
 ([fe80::b710:d6a1:ab16:76de%5]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 18:25:41 +0000
Message-ID: <fb23d54a-fca0-43a2-ae1d-03ae52112192@nvidia.com>
Date: Thu, 26 Feb 2026 20:25:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] PCI/MSI: Conservatively generalize no_64bit_msi
 into msi_addr_mask
To: Vivian Wang <wangruikang@iscas.ac.cn>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Brett Creeley <brett.creeley@amd.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, Thomas Gleixner <tglx@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, Takashi Iwai <tiwai@suse.de>,
 Maor Gottlieb <maorg@nvidia.com>
References: <20260129-pci-msi-addr-mask-v4-0-70da998f2750@iscas.ac.cn>
 <20260129-pci-msi-addr-mask-v4-1-70da998f2750@iscas.ac.cn>
Content-Language: en-US
From: Mark Bloch <mbloch@nvidia.com>
In-Reply-To: <20260129-pci-msi-addr-mask-v4-1-70da998f2750@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::16) To CH3PR12MB7548.namprd12.prod.outlook.com
 (2603:10b6:610:144::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB7548:EE_|MN2PR12MB4173:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a7bee03-677f-4c20-7d11-08de75647295
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: 9PsqS6ngW9OR79WvmoGbuLJT/Njq9tmn1Y4kvWKFRcHaqMXldP8HOWVYX46z8WeonfN8WfJUoVu82cTYacwuOgeqjFg2iX8mrd2TTwQTkl4KQKDMNN4CVErLry1dFopRS4rv4TntRLONZni2EQ8hVZ4uM64SHN0/hmx30g75xcs3CBS3ycUBWburJCmxM2xX4bonbAE1cfG3c6Xp6Shtx6/EwR+O4K21WVLphuRuQlcaw20fRpFe43mOG4g6P6tpqnRrr5QmiTKK9Tcm6A45A+nI1WRchacp4w0zkZPeN7ZcOpw8SWCeO1Qw7jmgU5kTDwmw1KTo9wsUAWjWeaGwrZYlg4Le6w++ekYYYVVd74QD/J1IvIQBOHMLhJrbr911iHYuLbXHvv56hT1bmaSaiYMfAEABEImTpp3TIYVEL3yB7sqAzOoSm1vvR9S5ozVhI8vMXqQO5Zeq02Bq1ORu/gPHjlDYHgNW9zTFUaQgFti4b+raO4CO8CL8gijpCzwVb6/qpuOJ98kh9Ty6vyh+DS4ygtC7grkJlORQsOceyiMrQQ8L6k791Uf2wTai+HMW+V432jJqkZdMs60jpUTIYmU1spudUBf1G/J2KY76FG6fw2RBsN0kJ9FwJoHBPuH/nvHpPOsdXVV2nUMig1EKk50lzeyrJfAkU+S2Y6wISuPx0Sw/8xXMNnZBlSecidU7H6Px9Kg/6CZt6DXIW+ZC9bGwtwWiYZa05uQAHUktPdmVHbP4p51UEIXYyTdmy+CjfzNomScronvuYkoyA3FWhd0PDkj4ATclX/WqjqoNUMM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB7548.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFdERFpreHJzMy8xL3kxTG5rcXp2S3JKa2FCRzRDOVp6bDBaa1dPZUtyYVMw?=
 =?utf-8?B?SWpJUXhxbTRsNGUzTW0xV09uamF6UzRIN2wvSklpTEFOWW1CK0E3cUJ6c1V3?=
 =?utf-8?B?cGpoU21vMDRaRDdnUG1nSy9ocXpaNS9zV293NkdsZ1ZWakE0bEFrRVZNdS96?=
 =?utf-8?B?SEEzYWdDc3Y0emh2cDRhWVJ6bHFhdmVaR1BSMGZVc2dPRUNmMGozdWx0TVpV?=
 =?utf-8?B?b3NWTkkzNTE3d2REdXZjL1dnOXE4eDFTbUZMSHBWalFrSUE2aFNXWituYVFQ?=
 =?utf-8?B?cXFwVGhxc1JvRDR2NUhHb0NJQ3pEdHlqUmliU0xOMm80dk56eVh0TzJEOXNM?=
 =?utf-8?B?SkpXZ205QXhvbTRjN2I0TWxYcTJIbER1bFVoVlZnN2cra2x0U1JZL3ZGcFRs?=
 =?utf-8?B?cG1QWE9JMGF5bXJsZkhWeEEwVng4RmJHZC9kZGRON2tiUmhkOXJ5eGk2ZzJ0?=
 =?utf-8?B?dGE2SlhJc25VMTgzRkJUZisxVGNiL0tiOW5oV2JwMXZGMHo4dDN6TXdPT2Zh?=
 =?utf-8?B?WEZQaWl5UndNYXkyQ3FwR3U5djNQUjVCeC8zdmtBOHcrVzgzaHJiL0VSQnND?=
 =?utf-8?B?TWNsT1ZGcE9MT3NCNXhvbkRyUUt5dWZzWThOQm5sc3IydWdGUDlZbXljcnVo?=
 =?utf-8?B?QWxhbC90ZG1CK25nM1p0QVZKTUp1OFZPU2ZSSGVON0d3bFVYZmlkQU9QYk1U?=
 =?utf-8?B?cVZJc2pDR1RlcnFmSDBoUjZBemF6ZnFDTFNoSGNGd3VIWFFrdGUxUzhHcnBx?=
 =?utf-8?B?Rmk0dEJNRy9qdStZdUNZQUVrRDVKODZQN3luS0tpKzVCZ0hVenpJS0IzOHFZ?=
 =?utf-8?B?dGpuazBBYnBlM2h2aWhNS2RqZGU5MzF1TktoYzFoN1ArcjFGYkVzVThTZXlp?=
 =?utf-8?B?U2pnNGJQL1IrZkkrSEFtNURkTktNVGJYcjVUUU15YmN1OWY5N1NjdWExOVN0?=
 =?utf-8?B?UnZtWUF2MjB6MnJSTzVjOWVaVkJreUtkaHgycGJRNTVmUiswMGpTS1BYSXNM?=
 =?utf-8?B?aTJOUnh4VTlrUmpHQmdrVGU0SnlXUktJQlVjaUFtdzhZSXQxcFdHZEZCMTU2?=
 =?utf-8?B?V2tBbnJJdjNFNFRJb3NkSEM1K1k0VEhWRlErRDFXdkIwYThPOW9zamRFQW9G?=
 =?utf-8?B?RlY5RnV4cFpKVmkxWWgxSHN1UTRzbjJXVURMMmJHMXYvUmNHN0o5THBzQ0tB?=
 =?utf-8?B?aVUreWhHY2xjbk84NFJmSlpQYUthZmhGd2xIbUUwSHgxRkN3b2IzMDlTNERN?=
 =?utf-8?B?Qk85YXF1dkYyRGE5TmQ4c3F1T0wxdW5aaDg1Y0FETjYvZlVPUWhLSm92R0Ft?=
 =?utf-8?B?TVdqY2crRno5Ym43VHl1NHl3djZVYjR3amE3ZElsT2d3ekdZQ0xDaE1tNDhs?=
 =?utf-8?B?bHdFOEpSMFNMRm0yRFpPTG9iS2ZqdWd3MjNuTzNDeXdjMDNMamZySXVCakdk?=
 =?utf-8?B?K0VDK0xKMVJucjlsTlhhWFJtN3N4ZSthVnNEZE5maElxOC9XVGFJNnNENzZP?=
 =?utf-8?B?dUF3djh2WDNmNXkyT3VsYkdHZTcrTjB5UU81ekpyWHl0WXROVTNpd08zU09L?=
 =?utf-8?B?ZHZLS0RQVmU5SjJXU3RwUDBiMjQrZDZPM2pNdkR4WC85MWNqNzlPQ1pYM0Fv?=
 =?utf-8?B?TlNlVDhwM2dZeHpKSStpSTJ0TFA5YU80UUNkSWtuVHpNQzMxMnp6QjMvZHNj?=
 =?utf-8?B?eVp2cnh4clY2MEtCRk0xRXhUZ2FtVTBvUGRseEdkcVJ0cG51R2NESjNRUkZt?=
 =?utf-8?B?bU9GazZZTFYxRFl3dlkxaEtjTzNwazdGWFRqWWRpUWdacFhGVm43cHFnUFRj?=
 =?utf-8?B?NWFRTklybTY1YU53aWNXWTBvdUdkdy9SdldQOTgxQTVCcW9GKy9vZlB0cnJX?=
 =?utf-8?B?eGlMZTl2TWg2SlZqOEhNRzFwUEx3QjErb2paY1VOeC9HZGZEY0VJNC9nQ0sw?=
 =?utf-8?B?Rm9NRDBrTyttRVlyT1NCbzFKdUxuMVlWOTR3RW81MXlUeEpzNkRucU54T3pR?=
 =?utf-8?B?ZWNjNkx6SFJPb3oxTWdLTFJ3emp6S2pnK1Jkbko5Wk54OEYxbXFMd0xwRTJQ?=
 =?utf-8?B?VlBtMERxbVRPKzhicjl1enM2b3M0T2FGZU9KWXNFWHQ1SnNuS2NzbXdta21G?=
 =?utf-8?B?dmVZYU1rQi9nZnduYzhjRm5IaSsvcEZMY1lDQVovY3BweUdNazBsa0xsR0dt?=
 =?utf-8?B?Y2Y5cnhSTG90YXZPMElQTVdadnRNUGgvUkFyTVNiYWNYUFF0REJPZHdMWklS?=
 =?utf-8?B?NkJYS2wweWgwT2VEc1BEVkREY3ZCRll5SmZ3WkZydnp3d1FFbEpnVnI2RElk?=
 =?utf-8?B?RXV2TVd0ZG5YV24xbTF2QVEycFpwV2h1dDMvQnRtenVSV1RkQUhNQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7bee03-677f-4c20-7d11-08de75647295
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB7548.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 18:25:41.4895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OlFLm3GZ1y9vpyXQeLQV0YKwzzLKC23HIr14pChwyB7Gy2h2Z79whxlIAx9Hcgzrm4pA4z5E1CcLKN7aJgyqPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4173
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[iscas.ac.cn,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,amd.com,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[mbloch@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,amd.com:email,Nvidia.com:dkim,nvidia.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,iscas.ac.cn:email]
X-Rspamd-Queue-Id: CEE821AD915
X-Rspamd-Action: no action



On 29/01/2026 3:56, Vivian Wang wrote:
> Some PCI devices have PCI_MSI_FLAGS_64BIT in the MSI capability, but
> implement less than 64 address bits. This breaks on platforms where such
> a device is assigned an MSI address higher than what's reachable.
> 
> Currently, the no_64bit_msi bit is set for these devices, meaning that
> only 32-bit MSI addresses are allowed for them. However, on some
> platforms the MSI doorbell address is above the 32-bit limit but within
> the addressable range of the device.
> 
> As a first step to enabling MSI on those combinations of devices and
> platforms, conservatively generalize the single-bit flag no_64bit_msi
> into msi_addr_mask. (The name msi_addr_mask is chosen to avoid confusion
> with msi_mask.)
> 
> The translation is essentially:
> 
> - no_64bit_msi = 1    ->    msi_addr_mask = DMA_BIT_MASK(32)
> - no_64bit_msi = 0    ->    msi_addr_mask = DMA_BIT_MASK(64)
> - if (no_64bit_msi)   ->    if (msi_addr_mask < DMA_BIT_MASK(64))
> 

Hey Vivian,

We are seeing issues while reloading mlx5 on a PPC64 platform.
We see the following messages in dmesg:

mlx5_core 0000:00:08.0: mlx5_load:1266:(pid 1283): Failed to alloc IRQs
mlx5_core 0000:00:08.0: E-Switch: cleanup
mlx5_core 0000:00:08.0: probe_one:1959:(pid 1283): mlx5_init_one failed with error code -19
mlx5_core 0000:00:08.1: lsa_required: 0, lsa_enabled: 0, direct mapping: 0
mlx5_core 0000:00:08.1: lsa_required: 0, lsa_enabled: 0, direct mapping: 0
mlx5_core 0000:00:08.1: firmware version: 16.35.4506
mlx5_core 0000:00:08.1: 0.000 Gb/s available PCIe bandwidth (Unknown x16 link)
mlx5_core 0000:00:08.1: Rate limit: 127 rates are supported, range: 0Mbps to 97656Mbps
mlx5_core 0000:00:08.1: E-Switch: Total vports 2, per vport: max uc(128) max mc(2048)
mlx5_core 0000:00:08.1: Flow counters bulk query buffer size increased, bulk_query_len(8)
mlx5_core 0000:00:08.1: mlx5_load:1266:(pid 1283): Failed to alloc IRQs
mlx5_core 0000:00:08.1: E-Switch: cleanup
mlx5_core 0000:00:08.1: probe_one:1959:(pid 1283): mlx5_init_one failed with error code -19

We've bisectedthe issue to this patch.
We've pointed some AI tool to look at the reproducation script and this patch and it came
up with the following idea:

"
The bug is a missing initialization of msi_addr_mask on PPC64LE, caused by a PPC-specific PCI device creation path.
On most architectures, PCI devices are enumerated via the standard path:
> pci_scan_device() -> pci_alloc_dev() (kzalloc) -> pci_setup_device() -> pci_device_add()
But PPC has its own device-tree-based PCI enumeration in arch/powerpc/kernel/pci_of_scan.c.
The function of_create_pci_dev() does this:
 
pci_of_scan.cLines 215-235
 
    dev = pci_alloc_dev(bus);       // kzalloc -> all fields zeroed, msi_addr_mask = 0
    // ... manually sets vendor, device, class, dma_mask, etc.
    // ... does NOT call pci_setup_device() !!!
    pci_device_add(dev, bus);       // calls pci_init_capabilities -> pci_msi_init

Inside pci_msi_init(), the code only sets msi_addr_mask = DMA_BIT_MASK(32) when 64-bit MSI is not supported.
If the device does support 64-bit MSI (like mlx5), it leaves msi_addr_mask untouched -- meaning it stays at 0 from the kzalloc.
"

We tried a patch that moved dev->msi_addr_mask = DMA_BIT_MASK(64) from pci_setup_device()
to pci_alloc_dev() and it solved the issue we were seeing (don't know if this is the proper fix).

Can you please have a look?

Mark

> Since no values other than DMA_BIT_MASK(32) and DMA_BIT_MASK(64) are
> used, no functional change is intended. Future patches that make use of
> intermediate values of msi_addr_mask will follow, allowing devices that
> cannot use full 64-bit addresses for MSI to work on platforms with MSI
> doorbell above the 32-bit limit.
> 
> Acked-by: Takashi Iwai <tiwai@suse.de> # sound
> Reviewed-by: Brett Creeley <brett.creeley@amd.com> # ionic
> Reviewed-by: Thomas Gleixner <tglx@kernel.org>
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
> v4: Patch message rewording (Thomas)
> 
> checkpatch complains about the comment include/linux/pci.h, which I have
> formatted similarly with other comments in the vicinity.
> ---
>  arch/powerpc/platforms/powernv/pci-ioda.c           | 2 +-
>  arch/powerpc/platforms/pseries/msi.c                | 4 ++--
>  drivers/gpu/drm/radeon/radeon_irq_kms.c             | 2 +-
>  drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c | 2 +-
>  drivers/pci/msi/msi.c                               | 2 +-
>  drivers/pci/msi/pcidev_msi.c                        | 2 +-
>  drivers/pci/probe.c                                 | 7 +++++++
>  include/linux/pci.h                                 | 8 +++++++-
>  sound/hda/controllers/intel.c                       | 2 +-
>  9 files changed, 22 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index b0c1d9d16fb5..1c78fdfb7b03 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -1666,7 +1666,7 @@ static int __pnv_pci_ioda_msi_setup(struct pnv_phb *phb, struct pci_dev *dev,
>  		return -ENXIO;
>  
>  	/* Force 32-bit MSI on some broken devices */
> -	if (dev->no_64bit_msi)
> +	if (dev->msi_addr_mask < DMA_BIT_MASK(64))
>  		is_64 = 0;
>  
>  	/* Assign XIVE to PE */
> diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
> index a82aaa786e9e..7473c7ca1db0 100644
> --- a/arch/powerpc/platforms/pseries/msi.c
> +++ b/arch/powerpc/platforms/pseries/msi.c
> @@ -383,7 +383,7 @@ static int rtas_prepare_msi_irqs(struct pci_dev *pdev, int nvec_in, int type,
>  	 */
>  again:
>  	if (type == PCI_CAP_ID_MSI) {
> -		if (pdev->no_64bit_msi) {
> +		if (pdev->msi_addr_mask < DMA_BIT_MASK(64)) {
>  			rc = rtas_change_msi(pdn, RTAS_CHANGE_32MSI_FN, nvec);
>  			if (rc < 0) {
>  				/*
> @@ -409,7 +409,7 @@ static int rtas_prepare_msi_irqs(struct pci_dev *pdev, int nvec_in, int type,
>  		if (use_32bit_msi_hack && rc > 0)
>  			rtas_hack_32bit_msi_gen2(pdev);
>  	} else {
> -		if (pdev->no_64bit_msi)
> +		if (pdev->msi_addr_mask < DMA_BIT_MASK(64))
>  			rc = rtas_change_msi(pdn, RTAS_CHANGE_32MSIX_FN, nvec);
>  		else
>  			rc = rtas_change_msi(pdn, RTAS_CHANGE_MSIX_FN, nvec);
> diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c b/drivers/gpu/drm/radeon/radeon_irq_kms.c
> index 9961251b44ba..d550554a6f3f 100644
> --- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
> +++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
> @@ -252,7 +252,7 @@ static bool radeon_msi_ok(struct radeon_device *rdev)
>  	 */
>  	if (rdev->family < CHIP_BONAIRE) {
>  		dev_info(rdev->dev, "radeon: MSI limited to 32-bit\n");
> -		rdev->pdev->no_64bit_msi = 1;
> +		rdev->pdev->msi_addr_mask = DMA_BIT_MASK(32);
>  	}
>  
>  	/* force MSI on */
> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c b/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
> index 70d86c5f52fb..0671deae9a28 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
> @@ -331,7 +331,7 @@ static int ionic_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  
>  #ifdef CONFIG_PPC64
>  	/* Ensure MSI/MSI-X interrupts lie within addressable physical memory */
> -	pdev->no_64bit_msi = 1;
> +	pdev->msi_addr_mask = DMA_BIT_MASK(32);
>  #endif
>  
>  	err = ionic_setup_one(ionic);
> diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> index 34d664139f48..48f5f03d1479 100644
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -322,7 +322,7 @@ static int msi_verify_entries(struct pci_dev *dev)
>  {
>  	struct msi_desc *entry;
>  
> -	if (!dev->no_64bit_msi)
> +	if (dev->msi_addr_mask == DMA_BIT_MASK(64))
>  		return 0;
>  
>  	msi_for_each_desc(entry, &dev->dev, MSI_DESC_ALL) {
> diff --git a/drivers/pci/msi/pcidev_msi.c b/drivers/pci/msi/pcidev_msi.c
> index 5520aff53b56..0b0346813092 100644
> --- a/drivers/pci/msi/pcidev_msi.c
> +++ b/drivers/pci/msi/pcidev_msi.c
> @@ -24,7 +24,7 @@ void pci_msi_init(struct pci_dev *dev)
>  	}
>  
>  	if (!(ctrl & PCI_MSI_FLAGS_64BIT))
> -		dev->no_64bit_msi = 1;
> +		dev->msi_addr_mask = DMA_BIT_MASK(32);
>  }
>  
>  void pci_msix_init(struct pci_dev *dev)
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 41183aed8f5d..a2bff57176a3 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -2047,6 +2047,13 @@ int pci_setup_device(struct pci_dev *dev)
>  	 */
>  	dev->dma_mask = 0xffffffff;
>  
> +	/*
> +	 * Assume 64-bit addresses for MSI initially. Will be changed to 32-bit
> +	 * if MSI (rather than MSI-X) capability does not have
> +	 * PCI_MSI_FLAGS_64BIT. Can also be overridden by driver.
> +	 */
> +	dev->msi_addr_mask = DMA_BIT_MASK(64);
> +
>  	dev_set_name(&dev->dev, "%04x:%02x:%02x.%d", pci_domain_nr(dev->bus),
>  		     dev->bus->number, PCI_SLOT(dev->devfn),
>  		     PCI_FUNC(dev->devfn));
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 864775651c6f..0fe32fef0331 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -377,6 +377,13 @@ struct pci_dev {
>  					   0xffffffff.  You only need to change
>  					   this if your device has broken DMA
>  					   or supports 64-bit transfers.  */
> +	u64		msi_addr_mask;	/* Mask of the bits of bus address for
> +					   MSI that this device implements.
> +					   Normally set based on device
> +					   capabilities. You only need to
> +					   change this if your device claims
> +					   to support 64-bit MSI but implements
> +					   fewer than 64 address bits. */
>  
>  	struct device_dma_parameters dma_parms;
>  
> @@ -441,7 +448,6 @@ struct pci_dev {
>  
>  	unsigned int	is_busmaster:1;		/* Is busmaster */
>  	unsigned int	no_msi:1;		/* May not use MSI */
> -	unsigned int	no_64bit_msi:1;		/* May only use 32-bit MSIs */
>  	unsigned int	block_cfg_access:1;	/* Config space access blocked */
>  	unsigned int	broken_parity_status:1;	/* Generates false positive parity */
>  	unsigned int	irq_reroute_variant:2;	/* Needs IRQ rerouting variant */
> diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
> index 1e8e3d61291a..c9542ebdf7e2 100644
> --- a/sound/hda/controllers/intel.c
> +++ b/sound/hda/controllers/intel.c
> @@ -1905,7 +1905,7 @@ static int azx_first_init(struct azx *chip)
>  
>  	if (chip->msi && chip->driver_caps & AZX_DCAPS_NO_MSI64) {
>  		dev_dbg(card->dev, "Disabling 64bit MSI\n");
> -		pci->no_64bit_msi = true;
> +		pci->msi_addr_mask = DMA_BIT_MASK(32);
>  	}
>  
>  	pci_set_master(pci);
> 

