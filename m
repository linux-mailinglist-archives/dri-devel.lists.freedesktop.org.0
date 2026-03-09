Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOfJKrRSrmkMCQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 05:55:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E09233C1F
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 05:55:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B93D10E483;
	Mon,  9 Mar 2026 04:55:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uLweT6Ru";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010011.outbound.protection.outlook.com
 [52.101.193.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A25F910E483;
 Mon,  9 Mar 2026 04:55:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qoQrPXBQLYmAgkzXtEu6u/716KWVxFYeRPNSXJaQjxM7VJrXzgVDhcDG0FAk45ZQPBiP5ntHAHe7uKcY4ldCtQ05RyoWVnfnqXY/M2EtIgUGAUvp+SeR3fG9itZ3NLlLLc2zJ+mBzqhGZAPXWCR9Qym3JTmnJKsPshFEfnKFan6y3YkewytMeQD0Z5NnS5IaxZ0itX9uaK1fx5GoozeHSMzt/PaxvnSkP3T+gybp8bbKHw2fP+RUiSZjzbl0BQ40tIZXPr7pScGi6RO0fWhAyTK25dbykGVvtQTvpWMkooeKptcHoY9PgWQfqrHQ761SlYSDCInP9WEv3OGV5efvxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NOywUD35uXMDQotERrpQ/4wsUfzgnMLVMXA1yuVNxKs=;
 b=ZsPb6Rveh8JKBQptYBq/BUuMTBLTpbGZpZ2Yk2BiDBI1mZhanRZ83F3eXsXcWWLu5QiiSSpC+Eiot8gAFKq1VOKyjGwIRuQ5GbCd2ZM26avVxpWpHFGDlYrZonFapXvzmKnt46JiOaaxq5Daj8bZNgtEqsYFTlE2Vf0FPqYq/YZtoS5mroaqyTZGTfeYGpcYmmVS7XLnem3iFnarmJJ6GVTK+4h/7LiLHo9Km0WZn+/9QR4URsQCdOpPTHx9U4R1c37237/vtlQQxO4L0ST9p0khUOoQm7bVZTrwN4WpyfYflsqhYjUY1kEL++aafNDUw0qPXKlHQmSqAzxaNbkLUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NOywUD35uXMDQotERrpQ/4wsUfzgnMLVMXA1yuVNxKs=;
 b=uLweT6RuL7zZS0jQ3mNMNVfKnQPhYOlE3zc/NNWNNdUkahWEu9F7zmISgwxyw9TGlr5O5i+0/8hjxlcwaBalpbZ8Dvj1X0afKE7uRPEyRMKiLg679PR5LvDC6zwDFTxtm98//LDttWFPRzDIi85WZYB0IoI+a1LNkelXSMaQDA3avC74v6+klDZcU8uJPD9QnD8cb2JpcLDtHq/Z6Df3i7UevfVKqPbg5ZxNy1EZKR6GLa2DMLZ4FALfaDNZAIlfZ0lwEdSoIkQE1cJSp9LI17Ni7XE0ZAjNVu6xz/99QVoTts5YZ7TfPvWEIAenhRjcGIVLcxDtOYGYLPCuK202cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by LV2PR12MB999098.namprd12.prod.outlook.com (2603:10b6:408:353::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 04:55:10 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Mon, 9 Mar 2026
 04:55:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 13:55:07 +0900
Message-Id: <DGXZFDLI9O35.3023FHY0RXX5Y@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v11 09/12] gpu: nova-core: firmware: fix and explain v2
 header offsets computations
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
 <20260306-turing_prep-v11-9-8f0042c5d026@nvidia.com>
In-Reply-To: <20260306-turing_prep-v11-9-8f0042c5d026@nvidia.com>
X-ClientProxiedBy: TYCP286CA0313.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::8) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|LV2PR12MB999098:EE_
X-MS-Office365-Filtering-Correlation-Id: b7fd485c-54e2-4449-e07a-08de7d980af2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info: jguJ6YiGEXAcfASXr64oOxUjA9kTxxgPV96SZQWYf1ACHkpkoT623Bq3ngmAtnNaZtIKjPl1y1ySzGwYsUDWNwWY3A4jFdmxDVroeg5VnQ5jFeZphO2VZljw3pU/2d5oE/wtdRkfh4gaTppTezGFaNCiait5EPfOELSKR7awKPtS2zt/7CrkekEeqn9R9HpHcJCceBKWeYgNo6GzzS+o+OUBphCpgWzfn56fc/UsA/tBrBokp0I7ojYz4/B1rA/1bTiVq1Pl2S9SChACXKVF5a4giQ+pRDj2W5csP2z9ZwS4dxfR/YKFeb5KFoTlYShdmzAfWYBn4YD8IMnapt9a2rH3Y+SG+JIYFn4Bl8sMZMZ2IrI1NZ3gnGdVhyz1ubq+qPd5qwWx8J8zo8vBiGGPk0jILUQUpOGnAoVtbviprWrqbi7+yknxVC8aOJ4nFttE/YmjW/1Z6JWz8FFxd3OKu3ePaQdjP9ozaeQIZJ3ofPsRp1mkAUyhWG+xZL9lGnXF9mEr7ts8njCVgEt8GXd8UdgqX57K0KqrmnybpW7ZXg8Wl2kanVz6DeqNVQ41/+8VeZap7Y5sk9TBndq+Ox52RoMjwXx+1lIVDlBzzANnahWOBGw1cwL0NEw/tEZIGZRD2cyvgjDKqyNrW7CiS3VgUM7azakDanVf9WsM9jZronj0Tj4hj3+7lQtrE1UcbUwPw4Buy3zEWkLR+aPfRwyLeTH/dfMOj3uxbO/Lbpto/Ks=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0o2aGNYWHUzMVVmRXNETXhQdlg3S3VBYWpzVFd5TFY1b1FlU0tEak1FZVlK?=
 =?utf-8?B?NHFCRmRERWJ4Rlk0N1BKMHlnc2pvTFMxd3pnU2RoSnFUTGlTbGx6SDY5U0th?=
 =?utf-8?B?ZnNwbHc5UU5ZSnBLaXJoUHFYL0VnT3NKZk5zcFFra2ZsMHpTaTZSSHBncWhk?=
 =?utf-8?B?VlQzYkFwZ0dSdStEZlNkMnVGcG5rczV0NXM2TTJMUjdqOWdoSml5dFRPcEov?=
 =?utf-8?B?UzVDbW41S2NOZStWcEZRc3o1amFCRG5yRHZ2VGVLS2IwQ3FHSVJZQy9ST1Vh?=
 =?utf-8?B?MlNXcWhHd2IraHlBYXBhWHJxVWJPRWo5Mm1PODByTjZpWnVSUGRDeGZWd0dT?=
 =?utf-8?B?TVBVYVBURURRQ0lRcGp4QlBYMGlZN2JYOXU5ZHdBRFEzYUNWdzZ3L0JCeDVX?=
 =?utf-8?B?WUdEODFETzhsWDE3NVdxTDFST2EySjh4ZFRVZFAxS294UUNEdWlOYWxndUc5?=
 =?utf-8?B?T2VYT3k3dnllUU9WS1dWUjFkcGk4NjZXTElVNWtQYVZJSTFaWUFZd050TzJK?=
 =?utf-8?B?LzhPRTd5QXdMVTJlR2RXaVh3T2RLWEo4K1RVNFZaT25CRnowU2RIaUZlVGxT?=
 =?utf-8?B?cis5dnV3SDF2bUorRXJGNUlHQ3FPUmIrc2ZtOTd2VE8vdHh3d3VlTnpTeXd1?=
 =?utf-8?B?NHJueUhEUFJkSC8vZDl4S0gvKzBtNTN4U0JMeDlPTDNiOWZ4aThLWUJLcFN4?=
 =?utf-8?B?eWh0WXkyb2pCdm5aKzRQZWEvZDJzczRaVjkvdVNXemVNK01uS0tXejFNUmdZ?=
 =?utf-8?B?UWhYdW5vbkpvQjNxbFU0UlMxQ2RUMWdPNDBGMGwySmtyMWlYWGpGZ1VIUGI3?=
 =?utf-8?B?MkFwY1lqSnR3dVN0eTRHRWlWaGkwYjJNZUg1U1RMcE1uOU00ZzNqRi8zVWIx?=
 =?utf-8?B?UmhNbEJYZFJhcHNYWjhDMWNiakN5MC9lcERSZ2EzNXlQZ3ZVSy9SbFoyTzg0?=
 =?utf-8?B?TUE4Y1JYL1JQMFdYQmtTYWdHUTlTeGtDREd6TU85dyt2REp1dWRzK3pTL3N5?=
 =?utf-8?B?ZUcrTGNWYVRldW5meTlTL3pXaTZkQWpaMTBmdWtmcUZPazNKSkkxQ1NkMzJ1?=
 =?utf-8?B?a0JQY1JKcjh4MjN4aGlhMHdLUDRJY3FrSEFGdGdDUllzcnh0TEtqcVNUZzFv?=
 =?utf-8?B?c1czTTdJbitxZWxoQlJ2d0tyMmtpakRuS0Y2M2FBQTVLdTNLSllJNkxPMk9U?=
 =?utf-8?B?Mlg1WUxlL0o1Z0R5MWlvNTE5Ymg4eUpOMmttalVtSkdaTzhScDl6SENzcU0w?=
 =?utf-8?B?WElaYTVIMFFKWmJ5VDkxdXc2ajVPci9peUZvK1FoVDN5ZFN5VGlnMFBzMEc4?=
 =?utf-8?B?Q0xPMUMrQ2ZVNjdzS1RuZ1h3dERwZkV6MVNOdk9FVHVUZlB4VTBRNGkrRjFS?=
 =?utf-8?B?eUtiM2wzdlQ3RVk3R1RWWGoyN3FveEc2QVZmTmp1bzlDSjgrdmVmTzFNV0hY?=
 =?utf-8?B?aXQycVpQWXRGUVJIRGNBQkI2NkFUaWEvZXdKd1QrRlo0WC82NWhVSEU1MmZT?=
 =?utf-8?B?ZU9Hbm96THQ3MkFsNUxzVWdFdnZFR0ZYRHYvNy92ZHdGUEFzRk1xVlN1dVBR?=
 =?utf-8?B?R28rQW5Hc2UxR2lRaUNkeXBIRlRKci9TY3l0ckZlZTQ3aUNKZVJ2d1ArUW9W?=
 =?utf-8?B?VFpqN0hEQitQTHhOODdZdnNPMVE2ZFladkhSeXRNaytJSHN0UGd2TlpYQ2d3?=
 =?utf-8?B?THJ5ZW1raGM4RUFvWnVPNml1MjU1MnFjdWJVZFBxeU1uekVmK3BnSmNFbzJ3?=
 =?utf-8?B?U1B1d3FONWZoTWdYbHJtTEtueThEOERtRHRvdk80cEhaTjZSalNzRndYbnZO?=
 =?utf-8?B?L2xOK08xa2NkU2N4OThYdFI5ZXFYWmdSaEhKS1NJOGdWL0ZSb2xMajhRMmw0?=
 =?utf-8?B?bkRTMTZvdCtDclFsRzhsckpYYTBsMDVIU2VrUnFNamxGSkJBTzd4VlgzSTEy?=
 =?utf-8?B?eHArWFV6azFPWktCMHZ2TGpvdVR2YnE0NUNvU3ZvUDdWdDJqRUd5MG9WemdT?=
 =?utf-8?B?UVJpbndNbmpmd3hDaGZzWDdJVUtVaG0yVWU3c0FMTkNuQndNQkJQT2hzb253?=
 =?utf-8?B?a0h1bFB0WmJNcSsvNU1Ib0xUcW9hUzZCR3lPQ3c0eVZGZFZrc255TjBEeFRz?=
 =?utf-8?B?V3p4TGNTanNXdklMSjBDVmdRT3pac2RkcG9EREczQkZ0MXgzM09VSEJ3Y1Uw?=
 =?utf-8?B?SXNCMUk5QllidkhVU1JhV0NjeFZJTVZTYTVIVzg3c1k3aWNHK2dQTEhCSVlU?=
 =?utf-8?B?WTBUS0ZNNnVOdWhlU3F0OUVlNnFNSjVPaUtDNFh6bnI3eTZXNWlod1V0UGlH?=
 =?utf-8?B?enUrallLN0hKN1h2VXR0N1ZrOVJ6SzVXZVVUZUNEVzQ3Z2c5bFRHeVBvS1kv?=
 =?utf-8?Q?aSRVi5wKWurQvhCGr/WNG6tXQeAZhBvVgWwGqYqU73KME?=
X-MS-Exchange-AntiSpam-MessageData-1: IKbV9BL/7/0npA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7fd485c-54e2-4449-e07a-08de7d980af2
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 04:55:10.6695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GiGb64z5S8ekCYuyttSASwQ3bK+2/x+oiSTUB9JbjLr68IcI29tLxgryE24SxbR6rqO0BiXtSEssHEZNFb3LYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB999098
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
X-Rspamd-Queue-Id: 45E09233C1F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
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
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.929];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Action: no action

On Fri Mar 6, 2026 at 1:52 PM JST, Alexandre Courbot wrote:
> There are no offsets in `FalconUCodeDescV2` to give the non-secure and
> secure IMEM sections start offsets relative to the beginning of the
> firmware object.
>
> The start offsets for both sections were set to `0`, but that is
> obviously incorrect since two different sections cannot start at the
> same offset. Since these offsets were not used by the bootloader, this
> doesn't prevent proper function but is incorrect nonetheless.
>
> Fix this by computing the start of the secure IMEM section relatively to
> the start of the firmware object and setting it properly. Also add and
> improve comments to explain how the values are obtained.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
