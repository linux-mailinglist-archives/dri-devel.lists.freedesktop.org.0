Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCASM6HdqGlmyAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 02:34:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A988209E02
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 02:34:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAA010E1A3;
	Thu,  5 Mar 2026 01:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NbAfvygb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011040.outbound.protection.outlook.com [52.101.62.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C54510E1A3;
 Thu,  5 Mar 2026 01:34:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aGnTgpNctBxVMVobaRXVipiLFEmGEsSgr0mBckTYv2Mg9FzYA39LZO88LlNmscIRSJ9dwA4C8jTXZsJoAc7EsjZYRp5F/JhDVDjBLICHFS3j0ZFfA50qUfRL+I5GAy4CZ19kWY/eTE4u8O0jV0mLwmcAG24rze8L7654uUhRqtJoGvtaYfY1EPydUSje3wo+kzf1UeiNTYRlKdDiZXjAHx+XEg+RngBstqA6xm54sPttXIgY6cBYeswEpU3ihtUsDL/lLVJI3DtSLU13AlDfXvPYaah9xwgAVKDTDIJh8mc2tEmYgbyp2a3+6yVMUmGMGEmEwjMITlrSPjWc8So6yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9W1eLA7EW/LQSeadPR/taVI1X5RJAQN4YRtRysB+Jo=;
 b=Uk6ELnO1rRcuhsmYZ6cAJOi8LeFCb3AdkfKzNUGBTObeox8fOEQJuO4ISSLy6AEmZsbhLIL8/9yWRMhXxvb2JtIBhMUknJ1vzNFPyTLbAoaocL1HnmulwDFKnaXzNKy7vQ2eA2WWxhg7YRoPbqcWFuqFK0utl1coVknjiNOuhB62ytNRr2rg7rLojNsXkPfnZQ5z0S79RSHp0OJHCGHULOq/8fCQE3mrkIA8k6xkJzgpMYlxXI8iirIT+kckO+V5XDEBQ1+en0+tPNBKYPXlgY7OMWgNqgH1mN1ztd/1711zgcHGmo9HTqwLzHsOrkfE22/qQ6HCHtrZyL1ltJOl+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9W1eLA7EW/LQSeadPR/taVI1X5RJAQN4YRtRysB+Jo=;
 b=NbAfvygbZsidMRDsIDHKWwKFBTv516BUdtJhBZjL/HoxZceADTNRTJv6GBsPCA5T+X6VZ99km6BI6h/pwkeDPgCQQbfCXq2UuNVVrP1Fd3V6jJjvWC/9GP75m2Dq6/8fOl8rYXw2z04nvHN2LTq5SbED+g6QcK4dutJ0cZ9KCCXCKrCnLfbpG0Yqx9CrcxSxnrJuQu/PGyilwA8ZWTCnyegiguhVzhBSL3DaUwu/GhtpBrIXYcOVHg5GVQ9gmBvuRxqMYzWqW6Idn/znuzlMMv/l9kS1n9S5EGdSiDAJr/e7qLihmOlYTH/6iKVfvXRLLGektaK02Og0biR6WpsUbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by BY5PR12MB4306.namprd12.prod.outlook.com (2603:10b6:a03:206::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 01:34:15 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 01:34:14 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 10:34:10 +0900
Message-Id: <DGUGNCEXKDD2.ETWE4H89AL00@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Zhi Wang" <zhiw@nvidia.com>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v3 3/5] gpu: nova-core: gsp: add reply/no-reply info to
 `CommandToGsp`
From: "Eliot Courtney" <ecourtney@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
 <20260304-cmdq-locking-v3-3-a6314b708850@nvidia.com>
 <DGTZ9NLS9TPM.2NRF5C9VN2B7C@nvidia.com>
In-Reply-To: <DGTZ9NLS9TPM.2NRF5C9VN2B7C@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0192.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::15) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|BY5PR12MB4306:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a1e6f51-1871-4a84-6f04-08de7a574f79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: oAjwsRiKXVWkHnbx+4GJrPaDnEudvO5S4k4NV0575fhwbaO0ylCMZ7ep2ytakEdbIKFkdrGMV4NeQcUb3bfnJG3HyTBqFgkvMRA59wgRsmVXTd93z3ZtTmMCeSpCZDtq0QPwZ6Dtw+m2UuiLi1HgXUsuemd7n5O856vyZ0vE+V59c2T7G8sDJxB/GcfD4Fh5IxlVJNCxDPPORpixwRCy9q3QYn/et4RWUP9u0iO6Pn5IrGodYj7J2APQLr2zbpTqPAxP7JjnhuzMXF1VDb6mHvNbTgEEx3uWYExtRfHrVe4Rt0Uq5xx79V15l7zEVCdITvk1yLyIrPxxpeF19YNu2SP5Nn8jr7Ox97EXlKK8nDpClYVB7d8mr2OeN60GNU8ZnilwALOY6MPjruASYn+FGzXLiHuD4QFNrRcH9BjvHTyqeQN52k5cPG+1NIPglhJGjwHi6ykAiKJ51+xOCtrsDu7UByqdyfiP2bDhXS/XKvfwu362na7ESwE99iRV26TveGu7zTxJadt51YhkCDWhpjNhxbBCLq4E/z6qzoVma3+NN+GPA8+4cHn7oT5rB/mrfwvnY24wU6X2lN2DGgMtfslLpfDczLJOD6Qam/668rPU8Tz1shbGlh6mu5M7+lduZSAjf8cP2p7Cqgz/n3CQDcu0N0Pf1y+RNwA0HpTfyp3fqAI0wPEnTukVvXoIlw5pC+Po7vueQIAvNMlzkUfCOPUa/xFCmiDjWBEH5vt4LOM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTVIMGdQQUYyTEtiaDltTFRSM1FscUxOSXdNOEF1MFJkaDJESGFsRi9rNm9y?=
 =?utf-8?B?NENGUGU2eFBCUFJzaUIwdFBPbElqeFFPRkVBUmVYR3ZMckFCMDNSeTdQek1p?=
 =?utf-8?B?VkF3TmZOSW8yV1Z3YmRNcVBQMlhOYWw5WWw2UVQ5R1doM2xiMEZlK09CSDJB?=
 =?utf-8?B?ZmVheHdyYkVYdEVLanY1OEd5Z3k4NGgvY0dlWFd6U1d2cTVzVmNVYlUyOFVC?=
 =?utf-8?B?aXJwbmlHVm1wdUwwcFRzcHRBOEhlWlh4ZXFVWnI3emxzRHcwWFlVYTErc0lY?=
 =?utf-8?B?ZEQwM21BcUFWcUQ0RnVTRkpDcFk0ZFVOdk5ORVArNGR5NCtGdVpERDd1K0dU?=
 =?utf-8?B?b3lyakhERmVuL3Q3UnVqTmVrN3RvU2xrbitDUG1WWUtiMUk4d0pPb09YSmFj?=
 =?utf-8?B?cnU2Nm9DTHZGWWhpcGl6VzFtSlJHNVVMcVJuSVJMREQ4RTdzMXZ4Z3JoRHkw?=
 =?utf-8?B?TEZPcmdqRnJpZjhNTFVsaWEzQmxOODZLUSsyL085emsya1Vob3I0cExBL1Z2?=
 =?utf-8?B?WVoxMzM5RXJMYnpSQzBDU2MwZEg4SmdOTDFSL2VsbWZOWjEyR2FzNCtkT1gz?=
 =?utf-8?B?MTZCblFKTW1PcEdVZGZxbTVteW5jeGUyOGc1dDNXeXVXaXkwMFZYZHZMeHpn?=
 =?utf-8?B?SDVucFJDZDdiVDRZbVdCQk5iQml6ZTQ5cjZxOVlPaE9FY0xObTltVElIQS91?=
 =?utf-8?B?aVpoWVlDeUtLanNGbFVHRU1rSSsyZ0IxaS9ZNEVSUmdESCtHV3ZjK0JqVDd3?=
 =?utf-8?B?YU16WW53QUpPVE9uL21KWHZNbkRsTTFEVmVXZXNheFhWZGJ2RWlXR3kzWkI5?=
 =?utf-8?B?MzlaM0FhZlhGTFk0V2U5d0VTTytWUzRYWDZXSXlIY1lpQkx1SGYxeWM4RzBH?=
 =?utf-8?B?NnZNMUtrZlVIaGN6WmF0WklHL21aRzg5b1dFTDk3NEdMM3JLZ2lHQmQvajEx?=
 =?utf-8?B?L3I3WEF0aDJ4U1NFY3c2a0p1NTBzWWh4aFFFbkdPNmpYN3lPU2tRL0UrYmhT?=
 =?utf-8?B?RzArQWV6UjU4NnVRQnM4N3VUNUxxMnJ4c3BQZWFYazk5c1BhNnkwazV6TnZm?=
 =?utf-8?B?c1U3RzB4QU1sWnNqL2RETlFMekVpdFJyZWFwODlZeEczSllucXRGS0FrcTlw?=
 =?utf-8?B?cHhiUitGOEdkMzRqRm9TNnJWYU5RY2dQbVBYVGZLNFEyekhqakE2L0VxT05M?=
 =?utf-8?B?R3JGcmtwVGlZb3ptU0I5Z041UDJzOTJGVVMxQjI4Zngrc2RiV0IzWGJsbzNh?=
 =?utf-8?B?SUhTNFdtaHNFaEttbEhHTDNSbUl4amE1RjNLUjQrVGhPTWYvbUdHQi9WbTdR?=
 =?utf-8?B?NGdUQlRjSjErUjBTc0lCUXIrTSt4b0ZVT09HUmhqYXhibWNaS0lNQjRkcnh1?=
 =?utf-8?B?cEVRcERhZGkxUU5oV0VWdVJjU0hGTlR4SjVlYjlYWXdxVjliRUhKTDE5aEcy?=
 =?utf-8?B?WWgzblIwbFVmN0x0SEs1WXQ3enhBa0x4anhJSVd4NDBRWFYrSE5Hcno4UGI3?=
 =?utf-8?B?RE1VZ3E0UWJLZ0VxZ2R1bWdqUHZXMGdDSWRRQy9aWXFsbmZnbUNHeWdyRVVU?=
 =?utf-8?B?OUhXZnBvYWx6S3ZHcGxON1R6cVRSOCswU2R6K0wxeGtXc0JZNk5mZkRITkZW?=
 =?utf-8?B?ZmhxYWdabUdOUVNmOEFUK3RWaVZiblk0TW5KZllJSHBNTjg5M1prVkQyWkNr?=
 =?utf-8?B?TFdlV3F6VFpabWZTMTdqdU9WOWpYdHBJTWRMb3FFem1TM2cvMDAyQTNaOVRl?=
 =?utf-8?B?R25QdlFHcjFiSXM0TE9lZ2g4cGlRNTVvWGVvLzNJano0YlhpKy9JK2FlRVU4?=
 =?utf-8?B?VThKWW9UTVJpZTVDYlo3SndKMk1zYVYvWHZrSHRXTC9uTGNWai91bWdMTmQw?=
 =?utf-8?B?M3RjSWpROEJXbGI3MFJzUDMwckF5d3lJcG1JUFpDYW95OFQ5RlFndU9Td282?=
 =?utf-8?B?Z2l5dnU1RE9rSDFnWGExblI0K0c0eVd4UVZVY0pCVW8yQkVjU0luMENsZGli?=
 =?utf-8?B?TkI3RU9SMU5YeE5GUVpyYktPUk52c2Z1MFRkLzdUVnFtenljSlptb3JXTk5N?=
 =?utf-8?B?eW1WUjl1TXQwbzJnNFhnUlk5REMwQ3ZYcVdNam9KTUhMUTg5eVg5V01NR1JN?=
 =?utf-8?B?V0NyZHU5cFdBcGdvcHNFWThpS1ROOHJRT1VuditJczNSTGxmMnk1N3lVYWc5?=
 =?utf-8?B?TjA3cDZvRnZNdXFTWFJZZkQwV1Jrell1WndRMzR4aHNMR2NxWUoxdWtwUU1x?=
 =?utf-8?B?ZEptZDI3NTd3cCtKc205WkJFejdmWE9aNTBwSERoUlRTZUNMMUN5U3djek55?=
 =?utf-8?B?ZUtGVzJXUHBpOFZPaFlXdXdjOHc5L1NzZytZcU0yaFZJbDU5U0UvbmpCWDNK?=
 =?utf-8?Q?IzrqDbaGpX5bLXnYCgHGXbz7wvTizYcL+Lfwj/yU+8yRC?=
X-MS-Exchange-AntiSpam-MessageData-1: 8UdHJ/fQDOQNxA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a1e6f51-1871-4a84-6f04-08de7a574f79
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 01:34:14.8456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yu3hvR2ufcT6+brkSeWUxBBJP2CufYiKLJYdnW7tRmFYQCRrWH2rVi+uO2Q24VVia9t523vX/3IS4n7SGeyQnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4306
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
X-Rspamd-Queue-Id: 3A988209E02
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net,nvidia.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Wed Mar 4, 2026 at 8:56 PM JST, Alexandre Courbot wrote:
>> +    /// Sends `command` to the GSP and waits for the reply.
>> +    ///
>> +    /// # Errors
>> +    ///
>> +    /// - `ETIMEDOUT` if space does not become available to send the co=
mmand, or if the reply is
>> +    ///   not received within the timeout.
>> +    /// - `EIO` if the variable payload requested by the command has no=
t been entirely
>> +    ///   written to by its [`CommandToGsp::init_variable_payload`] met=
hod.
>> +    ///
>> +    /// Error codes returned by the command and reply initializers are =
propagated as-is.
>> +    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) ->=
 Result<M::Reply>
>> +    where
>> +        M: CommandToGsp,
>> +        M::Reply: MessageFromGsp,
>> +        Error: From<M::InitError>,
>> +        Error: From<<M::Reply as MessageFromGsp>::InitError>,
>> +    {
>> +        self.send_command_internal(bar, command)?;
>> +
>> +        loop {
>> +            match self.receive_msg::<M::Reply>(Self::RECEIVE_TIMEOUT) {
>> +                Ok(reply) =3D> break Ok(reply),
>> +                Err(ERANGE) =3D> continue,
>> +                Err(e) =3D> break Err(e),
>> +            }
>> +        }
>
> There is an opportunity for factorize some more code here.
>
> Notice how the other callers of `receive_msg` (`wait_gsp_init_done` and
> `GspSequencer::run`) both use the same kind of loop, down to the same
> error handling. We could move that loop logic here and do it in a single
> place.
>
> In the future, we will probably want to add handlers for
> unexpected messages from the GSP and it will be easier if we receive all
> messages from a single place.
>
> This can be a separate patch from this one, but I think it makes sense
> to have that in this series.
>
> I expect the last patch to change a bit as a consequence of that - maybe
> we will need a `receive_msg_loop` or something in `CmdqInner`.

I agree we should migrate all callers and make Cmdq responsible for
draining / handling spontaneous messages from the GSP, but I was
planning on doing it in a separate patch series until now. I can put it
into this one though if you want though no worries.
