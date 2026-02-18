Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDlfFOwDlWlbKAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D3D152208
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC8A10E2C7;
	Wed, 18 Feb 2026 00:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WUy+8Wcx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010039.outbound.protection.outlook.com [52.101.56.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C5110E2BF;
 Wed, 18 Feb 2026 00:12:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7niiZgoXGqHIn73/V/ER29MTkUUSiLdgXr4ghlCaSRx5E75JNcu+LrA16TOi3MBuM8jLu6EWYrS13VGEdLdNJJvSP6n8GmlpbIb/uGQJR2f9LamCnznP+bFHPvHmV7N3R6AToDU8kIrko30VN3uNhmG3B6+4T9nm0YnJWphwL9Jc0nFlj/h9PbjwvU6SyVgNR8DC2KqabJ4t+MoQsua/6tvxHaj2fTPr+Mfoi7sKnYfQtpFca1VFhJE3iuKz6VHbns26jEY844uB+HIjcJKlsx+srtGgxWw597nc6h2tAP331Ct9K71oEK22P0/wkQE9i/SvRWbgY8LMuou8Y6/9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7hCns2yrATZSNyXqS7iuZKuB1TD+ZPPsaMMsTDzBQU=;
 b=ZcoXl5FIpc1y0SNkUbKo/bPxcV9cvnG8BQET/G04SYlwmyAFTRe+z30Z5efqOMEJ0yoC7iK9jjaVBQhQdtwg1enUvHcT9lMUziQvsJZew3QJwafW7h8ZZ46JQ3RFSX/WKTNquUV/lZU6SSf9aLBqDrRdsa71e0PCDT4ZqAwuPQx0Zf2R+iL37Y/R2qSjZhn4mb7JSFz32Q9up9kJGBnAvNlP3t8oCGc12qWiagAmyr6OUauYqmclsM4f5q1FRk0+JpsrVQsdlqtJKSEJfwbXr79bIviaySTOERUXqGpsRZrE+zleMEg+oootIgMpTp7jzmHA+uK9MRTY4OW7sEAmhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7hCns2yrATZSNyXqS7iuZKuB1TD+ZPPsaMMsTDzBQU=;
 b=WUy+8WcxIKixPiYqrUHMOOga18dlI25SEFJ/bqf4m5DseX/lUMN+hH8ThfmWxcMZJ7okmyVIVcyhclBdYr0WyY/POdclY8zXdUZSuwzXOuZjaZvp+niPavEBDN+XrdPICHDH6FQs+hPrSMkJDqpof5S67L5sDOZLVnvj/3qrItwJCiQDdKJv4UZMHk12lBN3sEU7WJ5wxckD+IYg0Rzh0pSSgLRBjzOu3RxUwPylNgXPEV6PrxyDcwQOdTdmGEkOzbkhPBL3IpsiM7/xuxUSzjpwsG3kTqCGe6g1oKAwm3xS6CSsq01KTqBNpIqXgPXX3garSlVTqgqhAwr2Bstr5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA0PR12MB8421.namprd12.prod.outlook.com (2603:10b6:208:40f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Wed, 18 Feb
 2026 00:12:02 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 00:12:02 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: 
Cc: Christian Koenig <christian.koenig@amd.com>,
 Dongwon Kim <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, iommu@lists.linux.dev,
 Kevin Tian <kevin.tian@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH RFC 00/26] Add DMA-buf mapping types and convert vfio/iommufd
 to use them
Date: Tue, 17 Feb 2026 20:11:31 -0400
Message-ID: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0187.namprd13.prod.outlook.com
 (2603:10b6:208:2be::12) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA0PR12MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: e2ea3864-5989-4da1-7cb3-08de6e8255c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pdFSOHTCdBuNWS8ymFHJV9tEJV2BOIvGUwsrG5mzlLpVMWyMkcbLISmsGZwg?=
 =?us-ascii?Q?zIQ1ZSALXiz0JH9Xdnv4Eahp668P9JRSPye0LBaZL24qSCYAtRDIVXPSJFAd?=
 =?us-ascii?Q?sdill4E1Qs832MYYOtM60jK4lJ/iFxjxUcM2E3h4tK57NVwyvlh3uBpFJUXD?=
 =?us-ascii?Q?UkY2N6Ke1u0uz52SEWh6MTKOwXoV0HlWmIkqDEuRALzNsAbIbkSSXMQi4IcF?=
 =?us-ascii?Q?xOxr+mNEoQ5PatRQ3rGfn8VT5Z0ESUYXR1olzaYZUQL8a2MTJIJozsEdaiV0?=
 =?us-ascii?Q?SioXoULsLmtLqzfIjT7cCth+0L4mPU7VRGjrKHRXBDlGxZU/D4EefJNUOjNp?=
 =?us-ascii?Q?9UUyK9Y69kzUVam5Jp0SJrGfGG5ehNP2vvpaljPwY0Kuxx67fNueGZVusf+L?=
 =?us-ascii?Q?L14RBRjG5qJ3H8qj6DaPGBpWrV8tXw9W1M9FkUDTQaBGV7KdbzEhrZCuPNVp?=
 =?us-ascii?Q?HzjtDhBp/Adg1lUAEF7DYWLQYZiCmMGUDKSyFAq3sZ0Cs+2jqW/M97cF0m6g?=
 =?us-ascii?Q?zl6n208K0QvdgroLSKgwIt5RuZo+iJrr5sEjmBVWCEH1nWTVtF5EM31nXAUR?=
 =?us-ascii?Q?Kf880H1kqmSqomOuP7UzAwSdNoz+NmpgGDbfdvoFEASYre3Axd9pvZfI5qrY?=
 =?us-ascii?Q?BV5ByrG90YwkEFWL+skWBl5R1xiWnwxgKmqBGm+7IE4uIgq41D+GZguIWAP7?=
 =?us-ascii?Q?NJJaHwYy6YDhzZOnEFaUoLJYhChieNPhEF1VSVXSrJkqxXWpoxywXZPxO6Cc?=
 =?us-ascii?Q?EV4KWVKLDt5xJV/NkZrp/IY/jMThqe3PMW83HLm/KGE6cZTT3tFqMBvjtztF?=
 =?us-ascii?Q?3gjTPuvbuE2xyreDS/XJ8TTC/nmNOBaheIWdU+UXrn9TvNrAgbyweHRSiE8B?=
 =?us-ascii?Q?518z+/Uh2pZjYhcJvUV5lKXz3OuCgqkJJoyEJ1rJpt1vRXR5+/xCjqZa8jCr?=
 =?us-ascii?Q?8bPLgOibdzlDzg3c3OK/WRoEwiSbmDqVwNphxr0moeR97y3p1066n0pIXVKA?=
 =?us-ascii?Q?/R+HaBLmTky4Tu3idkBo3PbUjQ60p0mCXzbCfjut+I/0n2qn8qGR3u8RSbF0?=
 =?us-ascii?Q?7jIjGYpsmmYpC/5AdHE1vQe/6//j+K8l/YxNnwHSWmV/svKKY8L3LTxjXvka?=
 =?us-ascii?Q?DPwvf9xVgMRr0AG8fhjDdGI6qaEc5hRYToxZNQjP2BZJpKItg1BItOVhXMoB?=
 =?us-ascii?Q?sRnbpD2H6nHaVhtrL3q2VQPMW3zk2msqkyXiUJt19mhpQWLH9y+7Uc8EkAz3?=
 =?us-ascii?Q?d4+NWhcQk1eaevTJ9aC5jDITCYDifujoQmwp2QkKZzKO88SYef9oo3G+8vWD?=
 =?us-ascii?Q?afsu/C1cvJwFgIO0xB59Gtz6XagcSbEQuMsfv/glslnnt3MTBCxjHVP8ym+K?=
 =?us-ascii?Q?u3mhyDnLqzTbdizngMg3el2+eEDHmJpyHVZOZ+95cMPY5IXUaW8QiTT+5Jo8?=
 =?us-ascii?Q?gZrTxGFHtZwTJ2VfZcikPQHbDyLi3PbcjSRsuau0KZwW1bjr3YDh2+NgQcck?=
 =?us-ascii?Q?ZK/BCfNKsxsbBk3n4Klff3Pw+t+OH3fY9HgEw+zvdZjdfMUDXeS2IuFpyFjw?=
 =?us-ascii?Q?nNaFB491Tcom+PU5x6s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LfnV94cThnpO8A2C1e0IrbG8F1elz7V+7xS9V3SNXo7gSmR2YpjwFPnO+Oia?=
 =?us-ascii?Q?Bi6VN6aFmKpRnVBX5k8fo8rSFUAbmGR6WaufzWeup7/MtD9UD4Yso03VX1PW?=
 =?us-ascii?Q?nrqKnrjrDRm4tANYg/WOJ1KY9WKu41MZqldkFfpvr/5luN0kjR2/KTam9MSz?=
 =?us-ascii?Q?L3/zFymtr1+r/usb6Tl5VXORyEb0MiqWbUClKpqXLtHFyqCiysWWCJoaQqHp?=
 =?us-ascii?Q?Rm2zSFxr2oeM/T7VgGcFASVK/5xjbmvTyedYjnYqOBqqpdpFHDAxDILDyjjA?=
 =?us-ascii?Q?EtkXQhghO3s/AZkmHLh7C86OHLnjYuCLubZjjribD9ydMT0WTlcJk5FxNJvq?=
 =?us-ascii?Q?HB0CV/FWu73LCpQ+au1Gt/wyXPoJvXhujD//hRM/SaPLiCOKR/UXYFM/Hgq/?=
 =?us-ascii?Q?u+xbn4nThzerR5ZBnodSjZQiWtpboQGRzHFiJF9+yhrGRNLUvnrGSfqRRyjQ?=
 =?us-ascii?Q?+fOn1Cd4Pq+24cTBSOmP/1jbzp4SJ6C5bUt9QH4e1TMCLvo0AE03iCRfMoks?=
 =?us-ascii?Q?weqYdPoHK5PS812TsZu/N2aRZo/I2Rftii3eXk/Nl90KUWtd6WhOVZ+2a+8V?=
 =?us-ascii?Q?FxkVdNEtDm78TwyanKTWf098QRn9Df/C1lggKfHEiyqdho8qvOWvT3gijSik?=
 =?us-ascii?Q?zKzl7wkCSTgIDZti2SJaNxQR5QdZwYKhY/Oeu8LokhkHP267x36dKBl/sfl9?=
 =?us-ascii?Q?XHCbV0kTluqMcz1iDOX+TFmxsDWi8cVPNFdvf2+gqVkojm51Tt4QdYvsh/ZR?=
 =?us-ascii?Q?03eRdfgeV69AEUZY1RxIyG40Fg1mUd9SwEt2HMWbXf3jqVRKNYTbjtiu/vLA?=
 =?us-ascii?Q?JqoVbTvQ+yjl9YEG4g4KwI0Eh922XmLO/m65yWLCFdueABDRmI9Gd7+Nrsqf?=
 =?us-ascii?Q?1MbnE73YrIL8FWw/sz3B6j9St9w1nL5BUuzRTR8CA7ZDKkkSA/AzyLfW9PGC?=
 =?us-ascii?Q?dK5CxWUSv7w4EKKsV/uMu8yWM+StgnCFSkvR+tHOrvkdby4QyexQUJZdO1Nx?=
 =?us-ascii?Q?JX7AgH+yyr2xajV+LdcENnqMuU0gGZ/YjBeqUaTLWD9g4c4PIvZ00vzNBO70?=
 =?us-ascii?Q?uYHezTOJ2fIagWFyQ9eVrgpaR2FLvm1+6Wi5ZBsOhIfm8HdEsavPEspWe4+/?=
 =?us-ascii?Q?z6VJy/Xfx8ZL0YTfMeq2mo0t5T1roPrN0vdfBMHwAO5nyHGUOuRHqKAnFwxc?=
 =?us-ascii?Q?0IbILRn+N9zFmty8tm8WHT8F16jipYh5mLsiGsAFrSjfY91A9KHCUsX2b+FK?=
 =?us-ascii?Q?sZRiW66JFyEL2R2O/XvUai/xzvx3tNiOXFj3QPj9TCC98CgKaXxwmdbBvPJ2?=
 =?us-ascii?Q?fYfbVuoSShDRm+VqILPbjhk0uldH1GCZgTc+aHv2JjbDBLmU+i2WUM1dhm++?=
 =?us-ascii?Q?9MkIF35ouJ0VvgEq2qpe3YzWyfNJ7VQYTtkSXQbw6Be091fMooGk53ubC9s9?=
 =?us-ascii?Q?sb7bQgSeU48PCXhqBjh//Ws/j0a2texELIcDzSKZkwx4jSaHdh9jnSoaiGxq?=
 =?us-ascii?Q?lFJHfcwqi/4DsxybKAypWP1eTKEJwWQ0otZQVoPowhXgcqyhns88FdCzxBZN?=
 =?us-ascii?Q?9qEGHBJtpNslPmmUTR45mvxzTSE5WgxgJZZi1++AoebY20yv0bF9abuWz+Ea?=
 =?us-ascii?Q?k72enqoWRlMj7jlzRglw7FBXRdqj9rA6V+yybIRZYmkdN7v14II1sVnRdCfz?=
 =?us-ascii?Q?8xLEr+pexI/qfWMWUdrOARK709AlVepmID8xG6j8+jSZ20rFIc1hRtXg1dpg?=
 =?us-ascii?Q?tmaXgF8ekA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ea3864-5989-4da1-7cb3-08de6e8255c9
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 00:11:59.9747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qWBH99Q54h3/Zap4O6J1E1BD6rQOFtWLAcfnd+DSxAvvA0mKmdEBSaIZaK6dYjqV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8421
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E9D3D152208
X-Rspamd-Action: no action

Since its introduction, DMA-buf has only supported using scatterlist for
the exporter and importer to exchange address information.  This is not
sufficient for all use cases as dma_addr_t is a very specific and limited
type that should not be abused for things unrelated to the DMA API.

There are several motivations for addressing this now:
 1) VFIO to IOMMUFD and KVM requires a physical address, not a dma_addr_t
    scatterlist, it cannot be represented in the scatterlist structure
 2) xe vGPU requires the host driver to accept a DMABUF from VFIO of its
    own VF and convert it into an internal VRAM address on the PF
 3) We are starting to look at replacement datastructures for
    scatterlist
 4) Ideas around UALink/etc are suggesting not using the DMA API

None of these can sanely be achieved using scatterlist.

Introduce a new mechanism called "mapping types" which allows DMA-buf to
work with more map/unmap options than scatterlist. Each mapping type
encompasses a full set of functions and data unique to itself. The core
code provides a match-making system to select the best type offered by the
exporter and importer to be the active mapping type for the attachment.

Everything related to scatterlist is moved into a DMA-buf SGT mapping
type, and into the "dma_buf_sgt_*" namespace for clarity. Existing
exporters are moved over to explicitly declare SGT mapping types and
importers are adjusted to use the dma_buf_sgt_* named importer helpers.

Mapping types are designed to be extendable, a driver can declare its own
mapping type for its internal private interconnect and use that without
having to adjust the core code.

The new attachment sequence starts with the importing driver declaring
what mapping types it can accept:

	struct dma_buf_mapping_match imp_match[] = {
		DMA_BUF_IMAPPING_MY_DRIVER(dev, ...),
		DMA_BUF_IMAPPING_SGT(dev, false),
	};
	attach = dma_buf_mapping_attach(dmabuf, imp_match, ...)

Most drivers will do this via a dma_buf_sgt_*attach() helper.

The exporting driver can then declare what mapping types it can supply:

int exporter_match_mapping(struct dma_buf_match_args *args)
{
	struct dma_buf_mapping_match exp_match[] = {
		DMA_BUF_EMAPPING_MY_DRIVER(my_ops, dev, ...),
		DMA_BUF_EMAPPING_SGT(sgt_ops, dev, false),
		DMA_BUF_EMAPPING_PAL(PAL_ops),
	};
	return dma_buf_match_mapping(args, exp_match, ...);
}

Most drivers will do this via a helper:
 static const struct dma_buf_ops ops = {
     DMA_BUF_SIMPLE_SGT_EXP_MATCH(map_func, unmap_func)
  };

During dma_buf_mapping_attach() the core code will select a mutual match
between the importer and exporter and record it as the active match in
the attach->map_type.

Each mapping type has its own types/function calls for
mapping/unmapping, and storage in the attach->map_type for its
information. As such each mapping type can offer function signatures
and data that exactly matches its needs.

This series goes through a sequence of:
 1) Introduce the basic mapping type framework and the main components of
    the SGT mapping type
 2) Automatically make all existing exporters and importers use core
    generated SGT mapping types so every attachment has a SGT mapping type
 3) Convert all exporter drivers to natively create a SGT mapping type
 4) Move all dma_buf_* functions and types that are related to SGT into
    dma_buf_sgt_*
 5) Remove all the now-unused items that have been moved into SGT specific
    structures.
 6) Demonstrate adding a new Physical Address List alongside SGT.

Due to the high number of files touched I would expect this to be broken
into phases, but this shows the entire picture.

This is on github: https://github.com/jgunthorpe/linux/commits/dmabuf_map_type

It is a followup to the discussion here:

https://lore.kernel.org/dri-devel/20251027044712.1676175-1-vivek.kasireddy@intel.com/

Jason Gunthorpe (26):
  dma-buf: Introduce DMA-buf mapping types
  dma-buf: Add the SGT DMA mapping type
  dma-buf: Add dma_buf_mapping_attach()
  dma-buf: Route SGT related actions through attach->map_type
  dma-buf: Allow single exporter drivers to avoid the match_mapping
    function
  drm: Check the SGT ops for drm_gem_map_dma_buf()
  dma-buf: Convert all the simple exporters to use SGT mapping type
  drm/vmwgfx: Use match_mapping instead of dummy calls
  accel/habanalabs: Use the SGT mapping type
  drm/xe/dma-buf: Use the SGT mapping type
  drm/amdgpu: Use the SGT mapping type
  vfio/pci: Change the DMA-buf exporter to use mapping_type
  dma-buf: Update dma_buf_phys_vec_to_sgt() to use the SGT mapping type
  iio: buffer: convert to use the SGT mapping type
  functionfs: convert to use the SGT mapping type
  dma-buf: Remove unused SGT stuff from the common structures
  treewide: Rename dma_buf_map_attachment(_unlocked) to dma_buf_sgt_
  treewide: Rename dma_buf_unmap_attachment(_unlocked) to dma_buf_sgt_*
  treewide: Rename dma_buf_attach() to dma_buf_sgt_attach()
  treewide: Rename dma_buf_dynamic_attach() to
    dma_buf_sgt_dynamic_attach()
  dma-buf: Add the Physical Address List DMA mapping type
  vfio/pci: Add physical address list support to DMABUF
  iommufd: Use the PAL mapping type instead of a vfio function
  iommufd: Support DMA-bufs with multiple physical ranges
  iommufd/selftest: Check multi-phys DMA-buf scenarios
  dma-buf: Add kunit tests for mapping type

 Documentation/gpu/todo.rst                    |   2 +-
 drivers/accel/amdxdna/amdxdna_gem.c           |  14 +-
 drivers/accel/amdxdna/amdxdna_ubuf.c          |  10 +-
 drivers/accel/habanalabs/common/memory.c      |  54 ++-
 drivers/accel/ivpu/ivpu_gem.c                 |  10 +-
 drivers/accel/ivpu/ivpu_gem_userptr.c         |  11 +-
 drivers/accel/qaic/qaic_data.c                |   8 +-
 drivers/dma-buf/Makefile                      |   1 +
 drivers/dma-buf/dma-buf-mapping.c             | 186 ++++++++-
 drivers/dma-buf/dma-buf.c                     | 180 ++++++---
 drivers/dma-buf/heaps/cma_heap.c              |  12 +-
 drivers/dma-buf/heaps/system_heap.c           |  13 +-
 drivers/dma-buf/st-dma-mapping.c              | 373 ++++++++++++++++++
 drivers/dma-buf/udmabuf.c                     |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |  98 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   6 +-
 drivers/gpu/drm/armada/armada_gem.c           |  33 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        |   2 +-
 drivers/gpu/drm/drm_prime.c                   |  31 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  18 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |   2 +-
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |   8 +-
 .../gpu/drm/i915/gem/selftests/mock_dmabuf.c  |   8 +-
 drivers/gpu/drm/msm/msm_gem_prime.c           |   7 +-
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c     |  11 +-
 drivers/gpu/drm/tegra/gem.c                   |  33 +-
 drivers/gpu/drm/virtio/virtgpu_prime.c        |  23 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_prime.c         |  32 +-
 drivers/gpu/drm/xe/xe_bo.c                    |  18 +-
 drivers/gpu/drm/xe/xe_dma_buf.c               |  61 +--
 drivers/iio/industrialio-buffer.c             |  15 +-
 drivers/infiniband/core/umem_dmabuf.c         |  15 +-
 drivers/iommu/iommufd/io_pagetable.h          |   4 +-
 drivers/iommu/iommufd/iommufd_private.h       |   8 -
 drivers/iommu/iommufd/iommufd_test.h          |   7 +
 drivers/iommu/iommufd/pages.c                 |  85 ++--
 drivers/iommu/iommufd/selftest.c              | 177 ++++++---
 .../media/common/videobuf2/videobuf2-core.c   |   2 +-
 .../common/videobuf2/videobuf2-dma-contig.c   |  26 +-
 .../media/common/videobuf2/videobuf2-dma-sg.c |  21 +-
 .../common/videobuf2/videobuf2-vmalloc.c      |  13 +-
 .../platform/nvidia/tegra-vde/dmabuf-cache.c  |   9 +-
 drivers/misc/fastrpc.c                        |  21 +-
 drivers/tee/tee_heap.c                        |  13 +-
 drivers/usb/gadget/function/f_fs.c            |  11 +-
 drivers/vfio/pci/vfio_pci_dmabuf.c            |  79 ++--
 drivers/xen/gntdev-dmabuf.c                   |  29 +-
 include/linux/dma-buf-mapping.h               | 297 ++++++++++++++
 include/linux/dma-buf.h                       | 168 ++++----
 io_uring/zcrx.c                               |   9 +-
 net/core/devmem.c                             |  14 +-
 samples/vfio-mdev/mbochs.c                    |  10 +-
 sound/soc/fsl/fsl_asrc_m2m.c                  |  12 +-
 tools/testing/selftests/iommu/iommufd.c       |  43 ++
 tools/testing/selftests/iommu/iommufd_utils.h |  17 +
 55 files changed, 1764 insertions(+), 614 deletions(-)
 create mode 100644 drivers/dma-buf/st-dma-mapping.c


base-commit: c63e5a50e1dd291cd95b04291b028fdcaba4c534
-- 
2.43.0

