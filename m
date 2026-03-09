Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIU8DHpSrmkMCQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 05:54:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95812233BF1
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 05:54:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED4D10E482;
	Mon,  9 Mar 2026 04:54:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oPgbuSca";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010041.outbound.protection.outlook.com
 [52.101.193.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8268D10E482;
 Mon,  9 Mar 2026 04:54:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SYlEamDL0W7WivS+d8dGEpexqmPO3VWvoGau7y3feHekhK7+JevzTjHMPSwLXdFhQPJ6OIWxZECFfsjef7xqyAK3zz4A9x2VhV+kjOa9nk8kcuUUqiqOKoayt7zqFkwchjNQWomv8BfftYuVIW9Rnjj8keOJikC2GCWU6sEEp0JAPSiH0hZhmCfeS6P/oB3qbxzU+cqQQiA5k9CwnceKuywzUkXEfDwPXKabRujj8HQ+gnexiz2nt6lu+RLa/8t+ecFUFoO1DDpKftcnsuQ354sboAidJ8SKQc4FOBOZrr6+IjxdR/tx8B06kauksuDr/p1aETN1D/Th2XCVqRvapw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAqQVc6Kb/3sIUnTODb3h/hHFNQ5RfWkHbQqBtS3Xuo=;
 b=i1PHUPsFrtSa/CV+WJlnTAnnbVeCGQ4KCSvlnLihlACXSs0XOfwCnVMuQ3gfFrFdt7WrWYNJWtQ9PsZOZSP7DLAsfQS/W//iJ2luUDhsHuwhA7PkHpeNRJSp4KUVrnRxFQkpAXQVMdEmxfTCU8GIqITUcnZxqFjolPCS4Ln3Whh1YLgOKAu7kSnjwD5IVRUReFuqtm4Pu7fA/jI/fW3bjMJSNHdXjYRnyU3Gt/JF1GOPfQCxtySE42xb7PjPcz7XLLgDxsHs1eItM077u9pUpU+7ejxdHNBEO6weD5RU5NNy+qGOVhwii6KfHMmdYAgbyrgGGhQEVW9UOBskEUhtSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAqQVc6Kb/3sIUnTODb3h/hHFNQ5RfWkHbQqBtS3Xuo=;
 b=oPgbuScaA1i8Y3tnrzNtrhHGJq7lWtjhNLLGBraInwr13mWfScPvqFXbUh8LR0YWAaXszHUe9PtyBwFVsEroC5TtVP41BzGoJUjp71LYeCOdQeuluZTOhQC1ctflPVPZiigh4bnD5DF1gmClvpeh0DblmlqVCn7nMynPPaFbyt3EiaMQMD/xYdpoWyl1fS1aO9UAzZaRsBMraWMrF7odxK8VtklW0RLnrlHoLvVnNJxp09Cej1ffV19VF069WNw6JGqPEwcNdzlF/YZglO39ugvOcVsmAJqSyPHKr++orkYAL2h9QSsn2f714B9R7epdTrArjUkTAq0yclV3AuUMbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by LV2PR12MB999098.namprd12.prod.outlook.com (2603:10b6:408:353::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 04:54:10 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Mon, 9 Mar 2026
 04:54:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 13:54:06 +0900
Message-Id: <DGXZELRO15B2.BNAZM6AAJBZ@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v11 08/12] gpu: nova-core: firmware: add comments to
 justify v3 header values
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
 <20260306-turing_prep-v11-8-8f0042c5d026@nvidia.com>
In-Reply-To: <20260306-turing_prep-v11-8-8f0042c5d026@nvidia.com>
X-ClientProxiedBy: TYCP286CA0006.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::14) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|LV2PR12MB999098:EE_
X-MS-Office365-Filtering-Correlation-Id: 04ab7ce9-d6c3-44ee-815d-08de7d97e730
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info: pX4ZvoeffPx6aq+qW8fBN1+U6eMAyqgoisWmLkk2S5EZvKKFRpFWBmVkoOZchtItxBnHoyx8R246NWAI/R3y02UKMGmC85abyvqp5l5XIg+Msngg47QjO7bLN6iQ1PK0J9IhdBlaePVtWq5yPx7k+YcRutNybrnzlpAtjujd52yWBE8MhAkM24aawpcvttZKRufC3X0i6qafHzl6av4SYLJYyjoYhyUKRhioJlcZoaCB6aIqgBRJ4YQwH+/N0FGsZ/Hf2AMC1VbNxzm6lSnSTK5AJFHdwNKRD8y2ZaaYJ41fa+c1Hpag+B5VmdaXSxOckrbuOqk/IVS8xMr4LY2IjcA16+qVEcfHEGLM+y9b/JbVy5nD2/itWYi+u/LxRBp/76isL3vBYP3c5DnEsV20nYT8x8HINgWbcts0Oq8akg7MVCM47MIJdB0F3p1z5r31ppWBrpZ+TxagAcfpA8llQSkAPJF2uK4XXOAdgr9mTJXlsQzOAnJmboSUXk9ubtE7h/Jt+oNu73wnDaTg25G/Gf5I6dTrUEflNhozmz0WSY2VvmQcyjNP3dPTpMGb7M+MglLuYYzasSqTqDkcuyPewA864qD6Pgyy6H5Ch6qIDAPZrbVavm8dgfNaFnY3XCgt7b5zK8U7Q73pxvNo7wLVVRJe2Qo24xp/FiXOlAyI5AN0x5aaoKgGPRtOwma6AfrxDrv5CX677zm2rv8zEOqrzOUFwUqkc+k8x8cxOV/mFho=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?allKOXdRTE5FekNqSm03ODN4eTQ4T05pVGNnRHh6OW1JaGlkSnpvU1h2dGdY?=
 =?utf-8?B?aStTb1JNT2RMd2RHZUc2aDM2ZlJYdjRPNll3dGMreld1Y3lDUVNxc2JkaTkz?=
 =?utf-8?B?R2Mrd2Z1VkQrL1Y1dE8wTTlzWkduS0FVUldHajBBbTdOeFJLS1VKdWpPbkNV?=
 =?utf-8?B?RmhrY1owMGJYN2NjcDlvQWh1RWkwMzl5d21QYjhidU1DdmpNZVNOMHk0ZWF2?=
 =?utf-8?B?L1AwK0FENGpkT0VsSkhDekJITXpnVWd5S0VQR2lDRDNsa09UOHpvc1FiZUZ1?=
 =?utf-8?B?bHdZb3RsUys5N2FERTBXYzZ4SWZIaVgrOUxzM0lDY2prTVJuTXpxQ2lzU2lW?=
 =?utf-8?B?RzdDREQ5eGFtbzA3YnBoQ0RVdUpuaEM4Um94NWdka0FuRE5YVWxuUXB6aDRk?=
 =?utf-8?B?SVdtM0FiM3k3dFdyRGM1cWZDWGlQRmpxa3c2VHRYdXI3cEtCNlFXZHgzL0Vn?=
 =?utf-8?B?SjN2UmVJQXhONjE2OFdVTjFoRFJ5cnVKWTZwVk1nR2UvRnB4U0hMT3gvSWY5?=
 =?utf-8?B?TmZRV0pYdUZHZEtBK2lLdGVmMEJacEJNbVNDSEJvaGtIRFpaSStxZ3hPV0Z6?=
 =?utf-8?B?YWlnR0x6dTRNRGJIWDZDTlMyTXdqUEtCTGhXNVEyL01VT2ZVTTVjS1RqcStE?=
 =?utf-8?B?andGRUx1alBIRFIwZFY1OFo4NXV3ak5oa2NOSVZRNSswaFZUYXNRWkR1L2x3?=
 =?utf-8?B?bkg2M24xMmhOL0d5TGI3L01NUGFVTmhLV1ZLSlE3c3hDMzZDZXo3R2pJQlZR?=
 =?utf-8?B?eGJiQml6c2ZCdXhTaC91YkZTQkd1S2pjZDFHSmhMWFhURGpwMFp3aVJuZ3Jx?=
 =?utf-8?B?Ykx1TWp0TnVRMGR0M3I0Q3ZPS3BiK2tWaStjQko4NkhYTVdMM0lZVHFJa1J4?=
 =?utf-8?B?NndxMHZ6V2pubGFkamV3Q0pwSmVJZTBOQXpWekxJTVJOK09XZVhDL3R2YVVU?=
 =?utf-8?B?TGFCMmpZelUzQWVIZ0grcU5ET09OV2cxemhZMU40RzNDRnVTS3pUSHRjZ1RW?=
 =?utf-8?B?Z0NnNHA4N2R6bEFSM0VEUkZtRWJYY0xpdUhIcExLWTRNRW1MSXZsdk5XTEtR?=
 =?utf-8?B?VXI5NVNKQWY5QlZhdTZmL1F1bjNrS1VzZzJDdEJBOVhacE1QOFEyWGk5ZDVS?=
 =?utf-8?B?WmFvR3l4T201a2pSRHlHc3kzQm5PbnJndmVXOHVYZHBxZk1tMXFFN3N4M2o2?=
 =?utf-8?B?YWFuMkdQT21VMTN3Tkx6ck45RU5QN1V1YmZkK2MzWENxK0NsQ0NIMkdEMkFk?=
 =?utf-8?B?UHduU2NoNGh4K21kK29UUU9NUFlSV21HSkZOZEZzYkR4MDFpTTA2NmFUS3VL?=
 =?utf-8?B?cEJDNThXNysyWjlYZW9FMjBaRG16VzE5c1pFeXVMMnJnelgzZFB3UTZPa2Vj?=
 =?utf-8?B?SkNJSVB4ZUNrbFNZTzArcjZPSlJNNEg2dW1ZYmRCdndVZGRtRDM5TVFNMktL?=
 =?utf-8?B?dEljUmlJd2VGVHhjMGhlazdyM1BQdWZpNVdHMjgwdDdGSnRMYjRVd3J1TFZZ?=
 =?utf-8?B?anVuSVh2dmxWR1lSSU8yRS9KNDVTSWZhQ214emEwTDlHczJpZWdNQ3JwR0lH?=
 =?utf-8?B?THpzWVNtbnZQbEh0UDdySStCakYwTGZWZktZWHpsbXhWcGN3MkwxZ3RtTTVz?=
 =?utf-8?B?Ukx3UWJnWWVmOXcwRGN5VGdmUkdMTUxyS3Ntc2txY1crTUFuY0RWbDZMREFk?=
 =?utf-8?B?Q2NLeG9Xak9sNHFBRWU0MUxCQ2REWmZIempGYktjM0ZuMi9Ub1p4NyttSE9P?=
 =?utf-8?B?aWVIZjZPYXZRckZ1V2RTemxzLzhLK0hYejFKMVA0eEhFZjFaeU9DdXVUY0Jv?=
 =?utf-8?B?S29sUjE0N0lyZVFGNHNCVFRuMUdUZ0dLNkREcUxqbWtDQmhZMXVBZlNGcWlU?=
 =?utf-8?B?a1FsSUZMS01NWTR1Y05Ic3BZamlXNTVZQjVETW00amdvbVlvTUhkNjB2U0sx?=
 =?utf-8?B?a0NaWWcwVDQ4SnV5WFNXT3o4YU1WVWZQWUk2dXF3VnBCYnhjemhobkhtVlpF?=
 =?utf-8?B?MjVoZ3E2K3NndUdybjN0bVBJOWJYaWVERHNvblF0RlBQaXN0aldmMTE2ZHNC?=
 =?utf-8?B?U2EvdjhpeDJBbklTbkhrSlBoV2pNeHF0dmdVdEZkR2xFZzE3ZUNJWEQ5a2Ur?=
 =?utf-8?B?Q0Y1Q2pwYXVLOFZKeldocUpLblQwdXJORG5wVHNaaGZhMGE4OFJhQ2JHeWFQ?=
 =?utf-8?B?ZUdRTXBReGRabmRKczgwaW0yaTdQcURZUHRMaHlvSk1qUXRHL1NENHB2N2FD?=
 =?utf-8?B?QjNqVmoxVW9iajdQbkxGVjhpRnBRSGFnMkI1OERIR0dBaVpwU0lrN2hSRXRZ?=
 =?utf-8?B?cUoycGdqTW8zWVFPVXBnNWNXVDkrcm8xV3JyckZwSlpXMUxtVll2UHdqZUVs?=
 =?utf-8?Q?Uc0Q8VOBSiE3utBqqJAlIodT1bGKCYFW6tiJs2rgewX6j?=
X-MS-Exchange-AntiSpam-MessageData-1: KAvTC/Edmu7xxw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ab7ce9-d6c3-44ee-815d-08de7d97e730
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 04:54:10.6944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IQBP+vRiBXUXEEdVpWqAGSiJCY27P6G/7o+IVJ2SQEUrysHZ/Yh9QvUEjl4mj2/x3YXhSWHn20pPVVXmWtD44Q==
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
X-Rspamd-Queue-Id: 95812233BF1
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
	NEURAL_HAM(-0.00)[-0.941];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Action: no action

On Fri Mar 6, 2026 at 1:52 PM JST, Alexandre Courbot wrote:
> There is no member in `FalconUCodeDescV3` to describe the start offsets
> of the IMEM and DMEM section in the firmware object. Add comments to
> justify how they are computed.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/fi=
rmware.rs
> index 677e1dac6d9f..c2b24906fb7e 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -260,6 +260,7 @@ fn signature_versions(&self) -> u16 {
> =20
>      fn imem_sec_load_params(&self) -> FalconDmaLoadTarget {
>          FalconDmaLoadTarget {
> +            // IMEM segment always starts at offset 0.
>              src_start: 0,
>              dst_start: self.imem_phys_base,
>              len: self.imem_load_size,
> @@ -273,6 +274,7 @@ fn imem_ns_load_params(&self) -> Option<FalconDmaLoad=
Target> {
> =20
>      fn dmem_load_params(&self) -> FalconDmaLoadTarget {
>          FalconDmaLoadTarget {
> +            // DMEM segment starts right after the IMEM one.
>              src_start: self.imem_load_size,
>              dst_start: self.dmem_phys_base,
>              len: self.dmem_load_size,

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
