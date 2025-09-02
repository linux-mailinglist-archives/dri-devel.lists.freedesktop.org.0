Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F08B3B3FFF1
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 14:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1760410E691;
	Tue,  2 Sep 2025 12:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MyYRNJj3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2054.outbound.protection.outlook.com [40.107.236.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA3110E68F;
 Tue,  2 Sep 2025 12:19:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q9qnfsjdS6cGAYdPbtARBhFtKNhQeQ9O54vfyfPk0tbd+Tsu9iZMQlLatd46s8hoCVNlDHAE5SOQAlJ4rsdmAOoD55a/zXPlusLdNg1ru2kAsGvgeOeKH7oDrL5t8EqF6JmFbHP2V1VU72h3F/zltLN6q9xzx+oIl8sb605hUkb95kDd5Gg+8OdII0GhgZZoxo014zSEvfoGfcFTDlvI1jf4a4VaKr4boG4JCL6iU8A4NjK4U7YAiVl8KvM193jTvJ+HcWVLb5zI7QrLOBf/lpqdpmObGzFiU3lCwdK0PpXAt+9vkNYmRX5PiuHVHg3MxqORUxIgUpTAtXVnWhFd6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRjqyakUrp0/dxtTpsIWNu6Z+u4ynuuYx+Pik1LammM=;
 b=sgvn2gQjG71yXC4tsTjouqiAOEJ/3+bymrFgmuP+pLJ8Gilty6JeO/dk5EDiCTfPH36cOqYAUM0RhQKQMucr++jhFvXhSToL5Bqp6LrldiQf415vQ1aXaaY+bOUJuZwZnjuJekc9DQNt7CIi9Q2QFtJZ2oXolMBl/DeKauxc7e5an8QU99vUZ+IPC4pBwvG2KRSe132K6VmgD4e0gowfsvRPU/cT5sbZN78rFZy8X6wXCgxr238r7bkEVt0XZ4A6QsmSbPJJmgHcrKdPsFpz+zaPoZ7HzjyKZAIo6863+EzxE64towO/a1SWjdNTxbTL+zV6ZkVn+ogV1gYor9ng4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRjqyakUrp0/dxtTpsIWNu6Z+u4ynuuYx+Pik1LammM=;
 b=MyYRNJj3pmOpV0AimDYb5ObUeMnd4uqwJUQnMXDpnJu8S0PT7/9+19BamSAoCmCoycDurVIbQB6vOrNPdMYDdmbE8I95oZt4Bj60JoTsIUZdHvMPpJIi9zF8rBUszq7I5iC6bn6DnVrEJsbCngQD4ixjiCk516iehd/5h9mpFz9yfShJyYD9cWD8/hrcvf11UkCHMuAmbQkDaX8UXy+a8RKfssJeVdkeRO/k5P39OBBvWqpN51hKrLknXuc7nlmeN6q+k5nfLLkdXn/lz3Glo+GR23Y4theR3GSdBcnpxZbO7gZ9uBuL92JShC0fyYCfnHTkOweecs/ifpfaE7jcmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB8079.namprd12.prod.outlook.com (2603:10b6:208:3fb::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 12:19:06 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.027; Tue, 2 Sep 2025
 12:19:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Sep 2025 21:19:02 +0900
Message-Id: <DCIB4UMNO1HQ.3VPZ239YP7PY2@nvidia.com>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2] gpu: nova-core: take advantage of pci::Device::unbind()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250901150207.63094-1-dakr@kernel.org>
In-Reply-To: <20250901150207.63094-1-dakr@kernel.org>
X-ClientProxiedBy: TYCP286CA0138.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB8079:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f97a192-76c9-4df1-57c5-08ddea1ae975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnNhSnlBb1Y4cXRLc29PTmxsZVVyMVpnTHlNbHBMTEtieGVUWW9ldW9peDJr?=
 =?utf-8?B?UlArNmFNcE1Vck9wdVMzZmJ1aERRZ2lPLzVDRGxheTllNTdrNlcwblZ5dVF2?=
 =?utf-8?B?ek5hVDRRcEM5OXJYS2Zwd21lc2RwSGs4Mkc0TXRZb0ZOelFWU25tN2ZIdk9t?=
 =?utf-8?B?MmZGT2VENmQ5aFF3U3lXVlJxVitwKzI0Q1Q5WldxR2RjQmlFQ2lLUS9JM0Nw?=
 =?utf-8?B?Nk5TOHlabVJLRzNSbnllZHhLbTVobUFHMjFYRXd0UERMbUhJb1hsU05nR2pT?=
 =?utf-8?B?cWFVUzZmblRoU28zNWxNZi9IdEhOYWZVbm5NRy9sZGovb1J5MTN6RjdpQjJX?=
 =?utf-8?B?c1BYamtvUXR1OEZaMThpK0tPeHM2bUpjdHQ4WUM0Z1Vac3hVQ1JiTjFTZHpO?=
 =?utf-8?B?MlRBV1krY3NvV2ZhbXRzZUp6dk1LeXJEMTVyOEpaMmlHL1JUUFJDb2JjOFpp?=
 =?utf-8?B?T0t0SlVaZk9DVjQrMXZKR1ZBSEd4c1dFVnVNUEhwd0ExNzRqaFY4aU5DUkJq?=
 =?utf-8?B?ZDBmazBSWEFDdmpaMzg3UWp6dkpDQUFWNFVlTHFjeFMrVy93WFNNZ2FpOXkz?=
 =?utf-8?B?eTl0RkdJTWw2eEUrZ3NPOFBITmw2cThGL0thVXRjT1lUdlN2V2xYV210U0hi?=
 =?utf-8?B?Y1dYbEcySnpYWDcycDhtN001Y3dwekN4YW5SSW1ib2NWSnFyOFFIQ1NDWDNB?=
 =?utf-8?B?RUZTL2p4QnBISUpKSm9HQytHSDF3bVlBd1hmakNmR2pNMlBrS3h3ZFZGcTJt?=
 =?utf-8?B?ZUhoallwdDZCMSsyb1JnaWpNa3F5cmFLSnFYS1lRdWp3bUoyNnhxb3dSbk5C?=
 =?utf-8?B?UlU3ZCtFKzRRY1JPZVVyTTNqMEFHekNXeVBobFgzR3hUY0R5MUk3NW52aXVs?=
 =?utf-8?B?bC9lNkxDQmFnSm9jcmpZWEFKM3hsN2U1YXJGd29YWGpFNHcxVXFRbG9YOHM0?=
 =?utf-8?B?VnFQd09abytxTlRrSXE1MGtIbWV5bnlQWVR4K2FxaXp2Y3BIUDQrVXZXaTNG?=
 =?utf-8?B?bElnbGZkKzIrQ3I0bEcvb3NRbE4zeENzRHAyUjZZTGowWmFDamJmd3l6TWZC?=
 =?utf-8?B?YS9BN3VMajVpS1NaSGtMM214V1lnaDRBR0pRenlKdHhBVWw3VFJPSzlZYmts?=
 =?utf-8?B?aHJ6Rnk3dW85cXNQRVBlU1l1NkZxOGpyaVR4SElwYk9pbW5tR08rUHdBQnNh?=
 =?utf-8?B?T3B6R1MzMnV4SnJSSzVRY0t4VWFFYk8vNTBmQlBJM3EzRHgwYTh5SW9pdFdS?=
 =?utf-8?B?cCsxYTlBQ29ReklEZCtuUzIzVHdadDd5WlB1dytOd0dpcFltczJXZUFucDA0?=
 =?utf-8?B?UEFwL1BGNm02WUc3RVNWQy8vMmlZOWtiR2s0SmZhM2lVL3Z1dUo1UWZwWTA1?=
 =?utf-8?B?YUFleHFTWnJ5TnNRZXcxQjJFS2s3NlVrcGRaalNOb0pKU2QxOUtFUEJWMnBv?=
 =?utf-8?B?TUdMam5ZelZFejFQTlNSVUJwU0Iya2dBMnYwaGl3NE5DTDVMQjhnbHZVL3BB?=
 =?utf-8?B?UGJ2bis3UGFZU0FQZHBiVVV0RkJwSVhQSi9ONkdFZEtoUDhRMXV5NjVuTDBF?=
 =?utf-8?B?TU41aXNzOHRrNkt5bFVnOVhHdVdxREpIN3VJZzhmbzFVS2J5RVlRdmRDRElu?=
 =?utf-8?B?cklUWVRTbCtOUmpFeC8wdjRxSUNRN1RQTEZ0LzhLWXZJZUh4VnBtRnRaU0JR?=
 =?utf-8?B?UmFYbFd4ZjhZbEVsaWFYVVBiaTlRUFhkVW00ZVV5TDRuRVlMYXpJUlUvdWFG?=
 =?utf-8?B?MEkzZzBUM2pNNTVnQW5EcEVDdnpEcThIOGhWcWIvMDUrSVRJUU9aQ3Q3NG5l?=
 =?utf-8?B?NVZ1d05mMTZGdDdOK25VWWVWdm1kaitXTEM2b0hwOWc0aVRZckVQSktUeDlN?=
 =?utf-8?B?TVg1My9QQmpkWjFKVTBWRXMycFZEVDJZUjVUUCtpd0txVWp0Q2hDSkJFOTFk?=
 =?utf-8?Q?x3Mxy37RMDY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXZGSnpwazlGT3d0RkV6YkZHc3RGQndtM3J0SWtuSGx0cmdQVnlEY1JtdUdK?=
 =?utf-8?B?N1psdG4weWIvRlB2OTVmeWJWemFpNEhTSDdhdytKQUNuVXNwVWhBVWc2TWZ0?=
 =?utf-8?B?TmdwdWlKSEJXSld0aEVxVXg2Nk5qeEc4YnNuNERhajVxR3FKUlA1cU1zTDNx?=
 =?utf-8?B?SUFBNXZFS2l5cE5ucGcwU2V5K0hTNEtrbllwWmdrT1U0djJVVmVYNFlWaVZi?=
 =?utf-8?B?UmtkeXJPekczSnU3d0hYUlFwY1Y1N0JyOG9SSlhwR0xqMVZBTXlreVZPU25p?=
 =?utf-8?B?Y1pCNG5jdFl3bGZlcHVqSHAxK3d0U0FKYlRPVkxPbFhpRjMvanlHc1FzT25r?=
 =?utf-8?B?ZTFTVHFHTWtUZ0dIYkppdlhxS1ZXQ1pBNFhHWmU4NWtKWlZmSEU3S3FRbkR5?=
 =?utf-8?B?REllVnhhY2VxNFp6TzRlbDZQcHlvNUV2WHBrK0NISHRTL3c4Yk1kQ1g3bGVO?=
 =?utf-8?B?czRYcWV4ekt3bkNGUzh4V3VWQWY1REk4T1JRV2ZpTWhmWW11M3dYWTNxNFZX?=
 =?utf-8?B?QlNGNjdic0cvTGU0TnZSaldlY3BrOXg3QVJLRnlsOGdHYjl3TVdYSmhRbGZa?=
 =?utf-8?B?QzJZc1JBd3FNcm5hV2pUcU8zbDVEZ1FsT1hReVk2ZUFlWkhuOTg1SzJYcnR4?=
 =?utf-8?B?aXM4QWF4Z0pVL1dBMVAwQkhoMndFM3ZWTzVzMnU2eU1HTUVORjgvVm1zWTVV?=
 =?utf-8?B?L3dLV2N4RmRaZXUrRXRkUW1DOVppVWlKNGM5RjJiUk5ZYmVNelpHaWZQbWlw?=
 =?utf-8?B?THlWSVlaeklJc0R3L2R5bzJzcTNLd2JzSURoNm5wWGp1TzFuNDNleHhJb0xX?=
 =?utf-8?B?ZUhNbG8vR0o2bzlvOXlFdHNaR2NneFR2OVN3dVNzbDN6bFAyRXZnSDZRU0Ji?=
 =?utf-8?B?akRjdzQ2MS8zZ3IxZk50SU15cmRRNmtCdGZvY2FibVNUeEdqTll6d0RSeExO?=
 =?utf-8?B?UlkzZWQvVzNZa2h3NVBIWCs1NlRtRFI3Q3BhaklUekt3MkJmbWlBMnpQYkhr?=
 =?utf-8?B?ZjJtZitGMFVsajhZNUFQTlZvNmYvV2NrZkYvOVJ4bURHQThLR1V5ZVpVcGl5?=
 =?utf-8?B?UkQ5VngxT0Zqc3ZpM05wa3JLT1BMbTk1bUdXN1FjQ1lhdE56UFE1VVRBbS90?=
 =?utf-8?B?elZpVWZmcE5yWGNOZ3RoZHMxMEQ4UDAxbG5TK3MxOGFONVdMdHg0OWlyU1N5?=
 =?utf-8?B?M0VKL3U5RWFwVTdrM2VhK25lbmlLYlB4L2EwbCtGNmRYd0s5TUdyaGpDeHFV?=
 =?utf-8?B?RldJdFJSdThlWHRpQ09kV28zRlNOTkhaa09wVmJoR2FIZG9kc29xMlF1ZG9j?=
 =?utf-8?B?UTRLNzBRNmdHeUFBTjEzSFZRNkFWQjF6QXhZaGJWT3ljYUh1eXJMZHJhT0dl?=
 =?utf-8?B?dyszcmEwRVpIZWFVRGdZMmtuUUxuMksrK1lXcDBmS1dzUytHR0dRYnkyVzFE?=
 =?utf-8?B?dWdrQkx5NGtrU25FdEZWTVlmZXJRdDhxb0JTV0NOOXVSY2R0dTcwaTBhcStV?=
 =?utf-8?B?QkVZNzl1dGhxU3pKdENBYXluRzNkQmF0dnk2WU9kdnMvRTVJR09wSGtYRisv?=
 =?utf-8?B?K3NEZmVtUW1ObjdWVnN6K21rYlYvV0hEWXdkbFlBZ3diejBPcFVlOTE4UUlY?=
 =?utf-8?B?UWdtNDdKMFl0QmhVV0N1VFUxNHlCZjZlWmtTNG1wRTRkSEVmS2RRdVVFMDRB?=
 =?utf-8?B?Z0RyNjVoMXdLV2J6anRjYW5CSEJyUkZjK0xVNnBTWWs3ekZsVVJubFZQU2Qy?=
 =?utf-8?B?WFgrMGEvRFYyNU1yTVpLbmdPUG5tNTFUVGs0MkNBWGxQNDZyNU8xRGlVcERo?=
 =?utf-8?B?bW1QRVZ1ZjcwZ1lhNXBydGx3N3RKMzBhOHNqMjJ3NUpOQk95YzMwOHFLWTVu?=
 =?utf-8?B?UTNhSGFCVFk3TEhQVzJaNWxUZFhJSytOUVloNHA3QmRqQ2xxT0RJOWQ4cHlm?=
 =?utf-8?B?RDNpVGtRMDRwbU1KZWU1OTY0QWFCMTEzZmVRZFFITEtsYkRjcUNKWWk0UUpF?=
 =?utf-8?B?NWN0d0x6NC9iaisyRThhendPdlpzWUFYcUxVK0hla3ZZclNZeDRtaFJFaVhM?=
 =?utf-8?B?OU1YY2hZdVJ1TXlUbWljaXdleTJ0aTNnckt1QXBUZlRXNFRTY1MxTzdyNVJk?=
 =?utf-8?B?R2Q0dHdqQ0daUjB2UWp4c0FPTG4wOGI2NzRRaHcwZzl6M1M0ellZOGlBdVQx?=
 =?utf-8?Q?+wSgWbNhtVBK75p+KxfzICcFatO1ve2egXyZj4J/s1XV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f97a192-76c9-4df1-57c5-08ddea1ae975
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 12:19:06.5373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ni3+8cjp4OSnfX5dB/RzvoyJM3r0I3UCAXkvytcwBREm1haQXOUcD+trx6SRdpl6TSfxiOtAElANNmOGZPjxCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8079
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

On Tue Sep 2, 2025 at 12:01 AM JST, Danilo Krummrich wrote:
> Now that we have pci::Device::unbind() we can unregister the sysmem
> flush page with a direct access the I/O resource, i.e. without RCU read
> side critical section.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
