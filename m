Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C540CACA87
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 10:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5101810E0FD;
	Mon,  8 Dec 2025 09:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ye+1x3sr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011028.outbound.protection.outlook.com
 [40.93.194.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A16110E0FD;
 Mon,  8 Dec 2025 09:27:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yC3kWiB9ogS+pLF88OpOmQANz3tI8KIu7AFl5KSMdScghnNCrmTFgr0mX4r4RgTfFDDmXhW0WZuh+5OJJPPPZBOlIA/P6cQLPV15KJNSTXg5V/dkaACjr3ESEXyM//D1fPjUDiZZJTVNO1oKk89aYUsEI667OVFyx3idiYrUXTZwQRgGp5h5tSYQ+fA2BUNaFM4TeID59sVkGK9Vt9Yj3XPzQ7xCTeSIUI9MFKbl8UQGmK9TbJ5LJReoZKscpvk7Mg6A/L/7ZrX43C6dHyAXjh/uXrEMV+nLwI634xR+qeWYypXEMIFPplyQffPWS43Piua+ZxiTB3vmEEYyytxuwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51Z1BnbwZ9hN0MMck/Mo7+mXS7VaXGhmquWWi5yM14k=;
 b=KuCUhK9rAd0qS90k24/bX7UcbaReT588oCQjwUcGuRClUfnrpY1ZM5hAyetoUU/zInSfng3OFDsLVGvYX/r+nPNsxHJxMknqdmjSQwv3XbpI+yRKFBH2Z6p9BHk4JUUYWdv9a6zCkUgcHHQfPBzB/ZF2qq8z2j+CEnIloHALLKyBHdg/hzJ51tbFEw0+iXHL6ePFTYjglD5i5NmfZrS7eEjn2WrSHZvd6/l3VJiCu47w+xQX/0RgwF/NfZ2VzaHvDHI2RyW23S9F3TrBEpUnMUrUooYRn7Z2nlxNCUrRgxb8V50Nzz7Vk5mBCqDrjveuWCYgdprEAekRSolfERlXWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51Z1BnbwZ9hN0MMck/Mo7+mXS7VaXGhmquWWi5yM14k=;
 b=Ye+1x3srBecQQGXvDm3R/RyKCNTyZ6uw6hbd+xcV+OXXHXfjCDkaY0ywJuTUadJc8ymPGmhKQEyIHZo7AGXQf/V4DBpGkasF69MqJSc+9NHECTV35riBIvDjnPjXRVWCHcfKVObrlZVfyKwP+0QJJKPPePhkirkXNx4B/GFc9rHM/BjhW8HZsUz7Je+1+f8kiYXhjtLJPwkRMRQ24XhXfg1z/r6cWqyj9Xqs8Oyr6Qai8T4UOOm2E33nJ3q3hy/+mmWj5Mfazdx0oVaF19V7fbpV6ktIcXSffql38BNx6Hgjm5GY82Wnvxctm/bN21M/Ppa7zT1ZstvgA/vbD0kJ/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8108.namprd12.prod.outlook.com (2603:10b6:510:2bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Mon, 8 Dec
 2025 09:27:18 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9388.011; Mon, 8 Dec 2025
 09:27:18 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 08 Dec 2025 18:26:55 +0900
Subject: [PATCH 3/9] gpu: nova-core: gsp: simplify sequencer opcode parsing
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-nova-misc-v1-3-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
In-Reply-To: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0070.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: a186c173-1edc-42a9-3b2f-08de363bfb36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmQ2RHBIU055ZzAzWm9LR3pLaDFzWGxFcGJJb0hwbkhTUFZjMytQUk5QRDNo?=
 =?utf-8?B?YTRKK1RGaHUxdWVMZDNUMEYrSGh5ZW10bnUzQ3dxOXRlakk0dlRrUzF4MVVL?=
 =?utf-8?B?LytrSE13R1FHM0x6dDArZDE0Vm1Vdm0rRkFYbWthdklhYUg0L04zUk12MmdC?=
 =?utf-8?B?TmZTb09HMW9YSXN5WmVSRGRLSHplU3drM0JWVU9ucUVKZTNDUmp4K2p1NVlJ?=
 =?utf-8?B?OWh3QTlNcURxNmQ2a2JEVExvL3dPODE4aFMwQ0EvYjF6UVk4SFpuTjNmOWlo?=
 =?utf-8?B?S0xlcDh5TERidW9RUHBONTBCVGNXcnpacEV2OVczdUxpdWFrNWNBbkFac3VP?=
 =?utf-8?B?WDkzbzRCNUhueGdKK0QyQlBGK21FQm43bVRkUzZzRmdOQit1OVdBL3JMRGZU?=
 =?utf-8?B?RjhlZllOa21SWDUvNmxiQjU2TzQ4bmFUL3VZb2tUV2FMZVp4dW5Ibm1NRUJj?=
 =?utf-8?B?SkRSdERKWXZGYTIwRUdxRjJUM3hWYWo3N1g5NEMveHFldUxVb1BFUzVPa0Jv?=
 =?utf-8?B?blovR3FwRitFMlJ6clpGT3JBWDVzbkNXWm1UTk8rTXdOZDBkUG0ySVQxUnhw?=
 =?utf-8?B?M0FpK0ZHNkxEb1JPQ1R2a003OG40aUV3S2JBZkhrMzRtSEFFb1Uza3BQbnJj?=
 =?utf-8?B?MXVrTXZWN0FObUxjYW95MDVFQjVnUi9uYm9rRHgyZ0h0Z3BYbzlCYUo1WTJx?=
 =?utf-8?B?dE9qUjlIMTg0MnBLZkZuL2VIdlM1TTV0YStqVS9LdEh3SHlJR2lkeXE4eFN1?=
 =?utf-8?B?WTFZWWJzUXFPYkF3Si8vVGkzdXpIT1VWVjNtcWRYU0NNdHVsdmFzUnRZdkcy?=
 =?utf-8?B?M01peFZidm0rUkp4aUlBaUh6d1RFUzUxZ0tDVlMydHdDU2ZxU2YrcWRlQzY4?=
 =?utf-8?B?cHNHWlFEZkY2WEZaU1FieGYxS2VKS01kSktka2ZPRTJpMnlhZnNoc2dSLzNJ?=
 =?utf-8?B?Zko1Uk5HM1puNVhLN2YrS013OWg2OVQrbkMrVENGazVmMXBIZUxHQzRxcXNk?=
 =?utf-8?B?UktUSVhtbGhJaEk5R3JEN3hxQ1FoSW5DUlhucUh3ZHF3a2VBZjh5RTYzZS9V?=
 =?utf-8?B?VU11Y1ZLOGwyMC9oTDc5b0Y0Z1pRc3U2VmNXMUgwRTNlbUpuVlF2dk0zM2RH?=
 =?utf-8?B?ajVBNFYxcVRpNkRNVXFyOW5Tbnd5NHR6Uk1SSWpNSkJZMTVLRGNCeFRaMVZj?=
 =?utf-8?B?TlNDK3QyaTMvWkdkdWZZek9IdVpGWWZiTlNrUGRlUC9oaXB3eHVTWWRIa1F2?=
 =?utf-8?B?eWxGaGl5cDdmQ1FSajU0UElTN21QY2lMRjgvU0lXMUl3eEZsOXJlWFhRYkg4?=
 =?utf-8?B?bHAxUGp6ZFhVTGJGeWdlZWhnWEFGZG9aa2xGVGZGMmhyNElmekJWVkdod2l6?=
 =?utf-8?B?akR6azVyRlZXT2xYRHlmMzZoT2VmczRvb0FjV2JPazNDeUt1Q3hEMEZwMmc5?=
 =?utf-8?B?Z25sV2YwUnJ3elAxNDVmdjM2OEo1ZGxiUlFrUUJPV0xCWDRxRUl0RXNXakNq?=
 =?utf-8?B?eUxMckZqZDdTcW1wblVHaUI3TzFFSDllYkR3c1ZseUo2Snh5Y2V6Uk9rL3lh?=
 =?utf-8?B?cEpuV2lJdVM2ekQ3cEthdytXYkpWRURoaEREdWl0U2RUK2ZmbzV1RHkrSHdn?=
 =?utf-8?B?d2wxbytOU3h3YUxQMkFybUYyTkUwd1BxQXc5Z1VZOG8rdFZLcWxPM2JjdERO?=
 =?utf-8?B?Vk9iMDNoYjdackR6NTFtR3E1RndnN2puL1V3MGJwNGE5a05PK2plemQ5Ny9y?=
 =?utf-8?B?MkRvUFVFWFNKaGlEUWFhSXZrYUZHYkk2ZEtLUnpJMkZiTVhMVXpwTWxNdTNC?=
 =?utf-8?B?MjZqdjN6TklDZFkwUEdWMGN1SDF0T2RmWDdWU2YrTjRxU0NLanA1MWNwUzdi?=
 =?utf-8?B?aURNblB0b0dnbXZZUUNxczZmNWVRdFZYbXFsL0dZTmxYUzNpN29Od01iTlJm?=
 =?utf-8?Q?C5Wemg1sFD0TOS1yMx6fTE9oGMqcQ+Vk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WG1CeEx6U1pvZkp5VE8weDVsWnF2eDhudG9Gd3UvQlZMTkMvc1FLa1E1SGRK?=
 =?utf-8?B?clN5OWd4TzdmVDloclIvK3c4R0FHUGl1b1hybndYdXFJNVBoclN0UTlNNUMz?=
 =?utf-8?B?QVFtdkJORkJGL1FEcUNuY3hJUCtMU0dkMDBWZUtXYWs3WldiaTRHdC9SeGQ4?=
 =?utf-8?B?dC9qb2tURXpKNFFjSXBQcVZ1LytLeXZBbWZteFc0Y1N5ZW5WQ0NSVXh1ZUZZ?=
 =?utf-8?B?SWpmSUNxM041bm5EVmM5QkM3WFpPQlpvelNMTktxUTJGcjJJSWMzMmNnNHRl?=
 =?utf-8?B?RXFKYUFrMFVkQ01vRnVuMlB0U1NJNVFIVzVpZzRJTlJ5NkxYOHJVdkh2WGlU?=
 =?utf-8?B?QXkwUEFWQ0NsNnBKbnZ3VG5xYS8rb2Z4OVdubEwwbmdEL3FkS2dvang2alNv?=
 =?utf-8?B?d2dtc2g2dTJNRnFTNTlvQkdsMDNXaDZPcWhHblVWQUlSeFhLbGgrTnhKNXZG?=
 =?utf-8?B?U3B4SkM0UHdHaXBMQTZDWCt6Tmh0c3lQODJBM3NjZU4rT0YzT3JQM25hQVht?=
 =?utf-8?B?RmZKbE5wYlA5cTVvWWZwN0N1NnhtYlNpY3grQ2V4d2NROFRYUW1oays3RG9a?=
 =?utf-8?B?K3lYanVmYWxpM0diRE1kY1g3ZTZLa0xmZEJua1FhbmZjaDByU1Y1eEtkQ1Nm?=
 =?utf-8?B?L21JSDBlMjU4ODAxbjB4dElzc1g0SnB2cUhSNEhDYVJ3T3BGSHhGT0ZDMnJ5?=
 =?utf-8?B?TFFrTWpTcGoxck00K2FabnJpbFVSQk9SSDBkdVRFVlB6bEtRQm50T3R5ek51?=
 =?utf-8?B?bGUrTDIwWDV2Q2VsM0Y2a1hSMmlUbWZXT1hwckswYXc0d2ZWNXN6Vm92eVhv?=
 =?utf-8?B?NEJQaENVc0NnU3dlZ2RRemIxVENYM0s0cUZYNVBBbkpxM1dJeUYzcVppOFZh?=
 =?utf-8?B?VkRrQzA3VTM2RnpzdlFHZjBYVE9WS3R3REFTOW1tSXNVeTF2emV1a1k2Qm0z?=
 =?utf-8?B?RjI4T2NCVTVSV3REcE9YTm01SGZMaVJxQmY4aWx4UXpvU2VBdUQ5SnExL1Jn?=
 =?utf-8?B?V3NFSGxMVzNXK3oyOFRHTXZhay93OFNYWUJ4VEtmaVNKTWhIZ3pmRFZNUHJs?=
 =?utf-8?B?dTdCVXplZkRxYlhRTC8rSWM5cEtPTGVjVHc0blVxRm1RekY1RU5nSkJQakhh?=
 =?utf-8?B?NWZ6Z29ld2JFNG1aWmo4cVNHU1E2V0tFL2lxNnhjRnc4SUhiZGgxUTgrbmxr?=
 =?utf-8?B?ampFT01aVE1ZdU1iNFVRQmxSaVVERkJ0THYyNXdiQ0x5bGMrMWs5dTRvK3ht?=
 =?utf-8?B?MnVKbUJydHM5YWo3UDk3Mjlwdzk1bkFGNUxKTjRzVklLWmxkTHlDRXBpck45?=
 =?utf-8?B?ZUJ5bUJqdlpBZ2tkR1JpV2dsbndBU1BMc09jaXRFRm9UVVR4enFYVjI4aDFU?=
 =?utf-8?B?RVVLMDYyRjdlMUpnYnZueVJqRjR5dWVRR3F5ZjE0VFE5UjZPLzdhQWQyMDRa?=
 =?utf-8?B?cUJETUtzdWEzSHppaXZ1Y2ZURktKWXQxbWRLVldnMmhyMFBiR3RnanlmUHFK?=
 =?utf-8?B?MjFHazExWEF3TGQ4d2JCVDlCbmxhN3NpWVYxTVdhTHdxQUorRVBmZThudzdZ?=
 =?utf-8?B?OXB5L1BzSnQvRXgyK1hmY0hzNVRIUHg5eHVlVjgrVExvQ2E5RHp2TWhiYXRX?=
 =?utf-8?B?QVNib29wWmpWdTJFeHA3eGtFamNwZGFRTnk3ek1yQ2lrSGViQnRmaUZDcjJG?=
 =?utf-8?B?ZWtXRFZOS1E3UGRzMDNuaXJFelh2Rmt4bTNNbmVGUHJUVTI2Sk9UZkVZeXZy?=
 =?utf-8?B?LzA5T21qajhYVHcvVkUzc3dIaVkyL29NRXpLYlVOZDYzM0FUOVdodlFKaFdV?=
 =?utf-8?B?VUg4VnR1Wk40NFRENStudFprelZhVUwwR08rcTJxbXRvZUlVT00wZTBVSzQ2?=
 =?utf-8?B?VzZuVldXU0JoMnJDZFdrOURmVlBJbVd3V3V5VUJjbDNFZ2pnWGpqWjZ4bU1h?=
 =?utf-8?B?Z2NOSktaOWRNa0hpSzV1VVA2cW1XeWJaNTBNUEJacWdLTkh2M0pzRERtdjMv?=
 =?utf-8?B?ME9FYjYrb0ZJd0Q4Vkd5ZU4vbzQzeEJTNmZSN1RCUkx1WVdXVzhRR00yTUdz?=
 =?utf-8?B?QWZETSsxZmRDNnFQMm1wTDJORFVQSlhwSGJhUHNYVDN6Z3dXYU5SWEV3RTlG?=
 =?utf-8?B?VURJcWw3M1cyQkloMTBJbG1DWnFOcEt2TGtLYWZRRGQ4ZUNDZVcrWnl0bklo?=
 =?utf-8?Q?VlkmKoPg1GClvwV6fksuUxTJjgi5Tk5sd0Mp7LRGMYw3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a186c173-1edc-42a9-3b2f-08de363bfb36
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 09:27:18.3597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bXP30j3asp8z1dR7N8GDRtvZwfk7PNLxhO2XH9vDroyQ61+/ZWyU/yQGKKSCXA+mB//jcLtOi4BgTpd7eY7+Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8108
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

The opcodes are already the right type in the C union, so we can use
them directly instead of converting them to a byte stream and back again
using `FromBytes`.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 40 +++++-----------------------------------
 1 file changed, 5 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 24e4eaaf1265..d06c0fdd6154 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -472,13 +472,7 @@ pub(crate) fn reg_write_payload(&self) -> Result<RegWritePayload> {
             return Err(EINVAL);
         }
         // SAFETY: Opcode is verified to be `RegWrite`, so union contains valid `RegWritePayload`.
-        let payload_bytes = unsafe {
-            core::slice::from_raw_parts(
-                core::ptr::addr_of!(self.0.payload.regWrite).cast::<u8>(),
-                core::mem::size_of::<RegWritePayload>(),
-            )
-        };
-        Ok(*RegWritePayload::from_bytes(payload_bytes).ok_or(EINVAL)?)
+        Ok(RegWritePayload(unsafe { self.0.payload.regWrite }))
     }
 
     /// Returns the register modify payload by value.
@@ -489,13 +483,7 @@ pub(crate) fn reg_modify_payload(&self) -> Result<RegModifyPayload> {
             return Err(EINVAL);
         }
         // SAFETY: Opcode is verified to be `RegModify`, so union contains valid `RegModifyPayload`.
-        let payload_bytes = unsafe {
-            core::slice::from_raw_parts(
-                core::ptr::addr_of!(self.0.payload.regModify).cast::<u8>(),
-                core::mem::size_of::<RegModifyPayload>(),
-            )
-        };
-        Ok(*RegModifyPayload::from_bytes(payload_bytes).ok_or(EINVAL)?)
+        Ok(RegModifyPayload(unsafe { self.0.payload.regModify }))
     }
 
     /// Returns the register poll payload by value.
@@ -506,13 +494,7 @@ pub(crate) fn reg_poll_payload(&self) -> Result<RegPollPayload> {
             return Err(EINVAL);
         }
         // SAFETY: Opcode is verified to be `RegPoll`, so union contains valid `RegPollPayload`.
-        let payload_bytes = unsafe {
-            core::slice::from_raw_parts(
-                core::ptr::addr_of!(self.0.payload.regPoll).cast::<u8>(),
-                core::mem::size_of::<RegPollPayload>(),
-            )
-        };
-        Ok(*RegPollPayload::from_bytes(payload_bytes).ok_or(EINVAL)?)
+        Ok(RegPollPayload(unsafe { self.0.payload.regPoll }))
     }
 
     /// Returns the delay payload by value.
@@ -523,13 +505,7 @@ pub(crate) fn delay_us_payload(&self) -> Result<DelayUsPayload> {
             return Err(EINVAL);
         }
         // SAFETY: Opcode is verified to be `DelayUs`, so union contains valid `DelayUsPayload`.
-        let payload_bytes = unsafe {
-            core::slice::from_raw_parts(
-                core::ptr::addr_of!(self.0.payload.delayUs).cast::<u8>(),
-                core::mem::size_of::<DelayUsPayload>(),
-            )
-        };
-        Ok(*DelayUsPayload::from_bytes(payload_bytes).ok_or(EINVAL)?)
+        Ok(DelayUsPayload(unsafe { self.0.payload.delayUs }))
     }
 
     /// Returns the register store payload by value.
@@ -540,13 +516,7 @@ pub(crate) fn reg_store_payload(&self) -> Result<RegStorePayload> {
             return Err(EINVAL);
         }
         // SAFETY: Opcode is verified to be `RegStore`, so union contains valid `RegStorePayload`.
-        let payload_bytes = unsafe {
-            core::slice::from_raw_parts(
-                core::ptr::addr_of!(self.0.payload.regStore).cast::<u8>(),
-                core::mem::size_of::<RegStorePayload>(),
-            )
-        };
-        Ok(*RegStorePayload::from_bytes(payload_bytes).ok_or(EINVAL)?)
+        Ok(RegStorePayload(unsafe { self.0.payload.regStore }))
     }
 }
 

-- 
2.52.0

