Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C40490B54E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 17:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE27710E443;
	Mon, 17 Jun 2024 15:53:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AU2zDsLl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A52E10E43C;
 Mon, 17 Jun 2024 15:53:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lofwb4RM0D8gepbJHX11EYuMcss8woyp2KPgOcpj5DkWqXScafdVOWDxG83AvZs4/DXcDxD6RzUhy4oUSkJ/S93F0fdJcnJdORZxc/ONPsm59Ni7wOhbRiXksCopO8xIbWEL2HmgouLGUBrns5uLWHvi7Uo3VeKhHzJYarR1FEVfI+v6harZEcwxwuozGMgMajfXoJ5R2txurCuJVQB3l5n3YAwCpoJa14yMcBdB5l+M68r/bpvj+2j+pkSA7yfgpKLnywpzhZJ6JgAfertLfe3kZ4p8OFRXkNOOTXVSGgqAoTMcTuagmAM2Uq5QfHA8aNPkx6xbGHz8rHMoRsRHJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5HdZlcHo6hngi3X8CFVVNKmQsUrbeoUpmDduDJS/WY=;
 b=f2GUKqq6Dzs/5bZ1ptz+8iA4FHiG9sNmRssIPHJjlpbHM/EybDaEy+YVsOacA2E/eDOGRpcYGrzyRXlqKqKv9lcke0btwQhEHrK3OzI74l+Ebr9IPE+xoDNWUopCaXOeEUAmKbtzDF1+AgTSsAOeJpDv+0E/hUzGiVnw2v9GfVKWqXyOdJx1eaHIm2/FQ7iganJr1MnaOk/h+gS7EUDtkTjpFrs4Bl+mPWgOdaybyip8SHhlpg5omLgslYrYz8n6MJDiidNyNPkyda9NcFSRXJcD0LkP7HMkU9iy28jNR10FhGZk3+4tLWfffqFso8qIB3yIoPKHeSEP7+6i9rRYxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5HdZlcHo6hngi3X8CFVVNKmQsUrbeoUpmDduDJS/WY=;
 b=AU2zDsLlFq7IL08soiTknyk+R3I88MhdhSTqnpgCy45A7IJbsCY337KM2cwxtPmFBkl/jHFkIxsSIoMrc7K+ZxgxE7lRHF1rKurNy7Y/4JeeT47tZ6/aqjku510qdKyaW1hiq4F6A7G27iFdG3LRIR1rM05wL6CTZidIv56BOgo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW5PR12MB5684.namprd12.prod.outlook.com (2603:10b6:303:1a1::21)
 by IA0PR12MB8982.namprd12.prod.outlook.com (2603:10b6:208:481::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 15:53:29 +0000
Received: from MW5PR12MB5684.namprd12.prod.outlook.com
 ([fe80::9eac:1160:c373:f105]) by MW5PR12MB5684.namprd12.prod.outlook.com
 ([fe80::9eac:1160:c373:f105%6]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 15:53:29 +0000
Message-ID: <3cc0d360-8f51-4cdd-90fd-1fa0a199c2ba@amd.com>
Date: Mon, 17 Jun 2024 17:53:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amdgpu: make duplicated EOP packet for GFX7/8
 have real content
To: Xi Ruoyao <xry111@xry111.site>, Icenowy Zheng <uwu@icenowy.me>,
 Alex Deucher <alexander.deucher@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
References: <20240617105846.1516006-1-uwu@icenowy.me>
 <20240617105846.1516006-2-uwu@icenowy.me>
 <88337509-3ad7-47aa-b70f-5294f7f1e486@amd.com>
 <b4ebdbce2f44c06806a650e72b1b6eb9a16dffe6.camel@icenowy.me>
 <09fbcd1f-c7b1-47e3-9146-17f8189978a8@amd.com>
 <e88d4722fa3bbd7104b140debdd85cb212628944.camel@icenowy.me>
 <d44651a7-0c07-4b84-8828-f1d405359aeb@amd.com>
 <1e5f86991635b9045e91fab6397cda87555f85ff.camel@icenowy.me>
 <e27a5acebe5c7d1e09edbc9dc49f52b672d72988.camel@xry111.site>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <e27a5acebe5c7d1e09edbc9dc49f52b672d72988.camel@xry111.site>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::18) To MW5PR12MB5684.namprd12.prod.outlook.com
 (2603:10b6:303:1a1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR12MB5684:EE_|IA0PR12MB8982:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e85fa5f-ba9e-400f-c756-08dc8ee5a1b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|7416011|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WE5MR3c1a04vY1pJT3VIZng5NHB0cDVPVi95dWtaTGdhcnQ4S1Bwb1VsaVVL?=
 =?utf-8?B?cmYzWXFXbFYrVStoNGNUUGViTmZ0d2R6dGVVK1hyVThQL3A2bXQ5TWpXN0VV?=
 =?utf-8?B?cGgrQnVwSCtDQzIveFZVRkZuQTdTNjNGNUhEaUVFN3U3VkJhdnZtVGthc0ha?=
 =?utf-8?B?Nk51eEpOa1RJdUhWQ29vM0FUcnYveVkvM3NWcHhRb0FXWVlVNDFXYk9pQnZ5?=
 =?utf-8?B?QVExamV3di8wNHAwbUpKR2l4cUZTZUFKVTZNTEdKMGMxRFAzOFhSaFUwRHJV?=
 =?utf-8?B?TXlZR2ErVzBFR215UjJLUVJVbmd3RU9pOUtqK0dIYXYxbGVQNEZHcUJPRDlo?=
 =?utf-8?B?UllxbC85UnduUXAvMzVaUWpNUmpjd3k0RldvTDlWdDBmbU1jWlRWUFJxMVAw?=
 =?utf-8?B?VldYb2J4ODhZd3h3WCtvdmxKMGUxMEhmd05hb1RoSGhXVFlqeGFBaGlKU3ZE?=
 =?utf-8?B?VzdiV3hpb0hqOGE2c28zSnhMUVlJSm12Z0Mycm00aWtKSDdEUlZDM0ZjeXZv?=
 =?utf-8?B?a3dGS1ltczdkRFQ0NkJNd1dJcHVrWHZZdXZ5bGh5eVdGYUZnMHZGS3FlZjFo?=
 =?utf-8?B?dDNrcGZXTVR2UXJ0TjBDdkY3WmZRTk5UajErS3hpSUhXOHV0eHpnOTBWVjQ4?=
 =?utf-8?B?cU1RS1VsRitkM2JQcEJEQ09DRkRrdnVVSkJvbU53OUMxYkZFdjFMekFhQzdJ?=
 =?utf-8?B?S2NocWowYUlLdFZoejRJK29BVVVlRnB6Z2g0dDVzYWVQQlJrZDZWVG43YmRL?=
 =?utf-8?B?blF3eDk3RlpycWlha09aN0JzbFU1YnQ1REdLbG52ZThmV2ZKNHpSL1ZyYUxj?=
 =?utf-8?B?RVA5d2kvYURsSWxlaVBmRXQxL0YxMStkLzEwMHRrR212cUlZNXZodHQwbnFu?=
 =?utf-8?B?M1pVTEhNS1NSV0NOMklPSGxRR2Y4c0Rmbzh6N21mUDVoQ2hHQkp4UGFJWTVV?=
 =?utf-8?B?MHNXVEZPWnZ2blJobzc1bHVLWTJhbTc1WjVPYmZKN2U0WnY3bzNOZThHdlc1?=
 =?utf-8?B?QW1oYU9QMkNPeE16K1M3TDdrK0ZiNmJuNGpra0pOWXB2YjBvaXFZK2d4bkhC?=
 =?utf-8?B?R0dXUlVTUkVaaGRCeVNVbmV4b3R0eENqb3RZZGdyVzZJUE92b3F3dERHL0th?=
 =?utf-8?B?aDJTbWMrSG5jVDRZSWNqZnlrN1JWU1FaTE9ydE1vV3JCMkJhMTlCMnhOa2NV?=
 =?utf-8?B?VmtyVjFsejROMHdKeW11MjhuSTZGTTBrOUJKM3J5VVJkUUFQTlpUZmZLem5k?=
 =?utf-8?B?UlV5MmE0ditBMDIxamZTQUNnUDFPK0k0dTNDSVlya0lUQnB6MU94RjhJSWFS?=
 =?utf-8?B?STRaejRtTkZGUll6VjVYN0NDbWRXQzd3REIzaTEvTjM0eUc1ZEN2bUhnM1Jz?=
 =?utf-8?B?TG1EUHN5NWlkRE8yUG4weHA5NmtFQzByWFlTSlQ4amorWVg2T2lBZmd2QWRM?=
 =?utf-8?B?YWR3WmhwVW5oYktUcXVWdCtTdTNIOXl4K1Y4aklHQjVHelJKRC9hZHJhSDN0?=
 =?utf-8?B?Uno3WHJmaHlkenpSYm9FcEx3QWdwTW1TRTdHM3l6UmhMcWorSVRnN0pGYnkx?=
 =?utf-8?B?VmF4UXdMSVhpOEFGd0dMZ2JKRmVXT3lpV0VnemtRQTBmRHJDWHloZmVkZkVq?=
 =?utf-8?B?UmJwWFFzeWRRTm8wMEQ2N2xZZEIrZHpWUTU3ZXp1ZVlqR3VNanlqRko0a0px?=
 =?utf-8?B?cTV4SXAveUtncDRiSys1QnJQQ0tTRXZpMHNBUUZUbFRhWStZVVlnVVYxMWlJ?=
 =?utf-8?Q?3JLB9CsJCuVcV6xUY2y8Kr6q2jtYQTgJeZk35Vd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR12MB5684.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(7416011)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UElBSENrd01aellrRjcxN0ZzeTVZbFBMRGNqdmhrdlBJR1llVnRRREhxWTBr?=
 =?utf-8?B?cTFzQWQvRTFJMEVNbXZRQ28zVU5UM293OTVXNk0zVHAyTDVlOWNnZ3VmZlBK?=
 =?utf-8?B?cGlTK0p0czhDaEU5MTZ1K0diMkErV3pNNXlCZ0xLa1h3TDl2TkFPL1VtNW1D?=
 =?utf-8?B?UGFkRkd4T25TQmNGOTd3aGRCazQ2ZXhsbUNpbjFOTklsWmdmdy9sNm9zeXFZ?=
 =?utf-8?B?UGdpNFdFek4xL1A0c3JOZjhmV3dkUHcwOHZGZDFpM3lBclprS2NYeGhmQ2Yz?=
 =?utf-8?B?TTVvU3BGTkNpaEEydmlvUzE0Mk5GNE5JUUZBNkhVWm93L0xsaGdrVS9PU1g1?=
 =?utf-8?B?T1lwQUlhaFIvR1NYQ3FRYk1VMmZtTTJaUGdrVDJuaCtuVWJ6VXpRYUZQMG91?=
 =?utf-8?B?TGc1UFpDUmc4ckZQRjlBR3dhZ3c5SUprbEFveWFoNUhLZXVkYlFadHB6MDQ5?=
 =?utf-8?B?SGpSdUlvYjh3QkFqVVVQcWl1UWlRN1RLR1NvMGxMRlE4N21iZGdVaWRwbEpl?=
 =?utf-8?B?bU5DeHhzQW1VQzEyemY4WVpRVGxlanRiOS96dFRXSDB3b1NlQzZER2FxWncv?=
 =?utf-8?B?eXFJd29YRUFOdVdDaW8xVkRzNWtNNUxZbkpPaDBVcy9sZ0pnQmtDdVBHcUpU?=
 =?utf-8?B?elk2WDl0T2NlekNFZUV6VUR0aUFhU0RwL1p6UHpNZGI3YzhwU205VW5ZNFZx?=
 =?utf-8?B?VDhjMUc5Wll4bzFkQU9OenZMVUtYazdWL2I2dXhoVHZEVkN1R3hQZld0YXV0?=
 =?utf-8?B?dDNvOHI0Lzc4K0s0dU5JSDRBMmdoVEdBck41alFZc2t6cWtpbHRFNkxSTWU0?=
 =?utf-8?B?NkdUWk1uZWxtSUNKZ1BvM3ZxRDQyczZURGxDUmJMZWt4SnBTcXZpQlRoR0RZ?=
 =?utf-8?B?TTkyNk1QblorVjJxMFNLdTdMcUUzQ0J2dGpGTkJXdXlLV0hWZE1xdkc3U2pC?=
 =?utf-8?B?QnRtMUx4MkJOR0J0MGNsWjlRdlNTUXcyUTQ3RlBRK1htbzZTeE14d0l5a3RQ?=
 =?utf-8?B?MHk1MFJWSUlGbFlmQXVnc1lJYTRua0sydWl0OTk5ZUJtbFZoY3laZnBEbzJj?=
 =?utf-8?B?SzFQQW5lSUdVREwvaFJkM1lpSTdTSTd6OUxtM1lqdkdxaVZVOXZ4SlgyU1k1?=
 =?utf-8?B?S2R4YkhsOE1seXZSbThOMVpCZnlMakE4bEYyMWlHdThEUnZJRG1vbFVZa29V?=
 =?utf-8?B?dnJIUjFvK0NrdndkWldMbGlrb2U4bkQ2OXZldGhuWFoycTkwNEx1b3pScnBa?=
 =?utf-8?B?ZHZQZVRHN05McWx5bi9HMDRXTC9oQXY0MElQK2hvK2VNb2kveVVxQmdYdzdW?=
 =?utf-8?B?enVUeDk3UnhFaXZWY1pBZHZEWDgvV1Jxc0FSWVJwWDdDRHc4Z2x6cGE4Tjgv?=
 =?utf-8?B?MWltRlQwZWowd2J4YWFUZjZsWDRqRzhrcVJadGpYdk9Eb3dZS3BZYVVmbGFR?=
 =?utf-8?B?am9JWitDWDhZNnF6TlJBcEVZMXVHdkZjTFY1Ui9KbmNNWXVrMXpFTTNwaWh5?=
 =?utf-8?B?NVBoM1pjV3lKUmVXVlhIZjc1NndQOU1qTkZmdU9jbVRKUWU3NlRqMzAydGVD?=
 =?utf-8?B?V0RoUXJoSDVZaG1pY2ZyaC94RkE4bmxraGp4ZzdWMi92K3dRTm5KNGNCNzZT?=
 =?utf-8?B?TG5ka0pZMTEwaStyc21iSjBNSHRSOVp3eFlta1hoVUhMRXI3cFhRZ29GdGJM?=
 =?utf-8?B?b2Q2VkExekt5YlV2QnZZNU9JbTZsZTIvc25QWWxuUnlyZS9BcTRwTE9ibHow?=
 =?utf-8?B?TWNBaVpYUVlsbGdTMFIzMGFacXQxS1B4N2RFbzRlbjNBT1NYbjlJcVZOSkhN?=
 =?utf-8?B?dVVBZ3FXL3NtL3BrQXcrZmdYWlJzSHN2YWxqZWg0UFNpdnBYcmtxWWVlejRj?=
 =?utf-8?B?Z2p1OHJGa0lUR2FYVkk4VmRhVWVxZUhhOFFKRmQwakxvWVFlNC80QVA5Q3pp?=
 =?utf-8?B?REJIK2c0RHhlR2ZmR1hBS05CTVBCd2k2U1JEQlBvVzJGNHdnSnlIVmxsNmpY?=
 =?utf-8?B?QmFXdHU0Zjhja0srUFNJV0lxWStiNWxmTE5QWHFCUmhKNFJGY1kvV3lXTkY2?=
 =?utf-8?B?T1lzelNWMlZUKzQ1UzNJOFJhczY3ZE9EZHhsWk5yb3A0SjhOcU9EeWxqSkt5?=
 =?utf-8?Q?MLyx+TEcgGwW9K9PROV/MFZ3X?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e85fa5f-ba9e-400f-c756-08dc8ee5a1b2
X-MS-Exchange-CrossTenant-AuthSource: MW5PR12MB5684.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 15:53:29.2649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UlH4MTf3RbZGnkVBpOy2v6ScSqEI9ZDevr7dXyZ7GTumDlyBHoD85P17/xKMV2Ol
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8982
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

Am 17.06.24 um 17:35 schrieb Xi Ruoyao:
> On Mon, 2024-06-17 at 22:30 +0800, Icenowy Zheng wrote:
>>> Two consecutive writes to the same bus address are perfectly legal
>>> from
>>> the PCIe specification and can happen all the time, even without this
>>> specific hw workaround.
>> Yes I know it, and I am not from Loongson, just some user trying to
>> mess around it.
> There are some purposed "workarounds" like reducing the link speed (from
> x16 to x8), tweaking the power management setting, etc.  Someone even
> claims improving the heat sink of the LS7A chip can help to work around
> this issue but I'm really skeptical...

Well when it's an ordering problem between writes and interrupts then 
nothing else than getting the order right will fix this. Otherwise it 
can always be that the CPU doesn't see coherent results from PCIe devices.

In other words if the CPU gets an interrupt but doesn't sees the fence 
value written it will assume the work is not done. But since the 
hardware won't trigger a second interrupt the CPU will then keep waiting 
for the operation to finish forever.

This is not limited to GPUs, but will potentially happen with network or 
disk I/O as well.

Regards,
Christian.
