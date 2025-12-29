Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D769ECE5BC1
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 03:25:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3A810E8C8;
	Mon, 29 Dec 2025 02:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="c3Wdgv8i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012005.outbound.protection.outlook.com [52.101.53.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2153B10E2F9;
 Mon, 29 Dec 2025 02:25:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u7rVKnwV6UL4g95VJ+fg6Z8b1iKNs+fMbD4si6gZcU1P7jIcm8QlTp5VQErg8PqYqSWT3L0IwikjmlfLy4UoNA2tYS7rhkF5hBR2mNryWeid96Uo7sjGbH6pIM4+sICqcBb260T2sSu01FgcEDSh4H0H8hBE0rD7Y2H0QZTmiOoMBm2+LnO9mNJJSICd4tyDJMvqIb9bvYnQH/LSvXmtqho2RsE5+Xzixuq0MdizznXRkDxIGQ58PFI1rA0naXI9NrTPdjYCbXK8t0vYbIYj/QJCIboquAbe5zhNFPZ4skHac0MTcpf4T6HsiRBtxOuV3g+i89NfpQybcqIHdgjNIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McmHkWOhb44LLO/imeMp4TenhqDDVpQyLg10cr6LsVk=;
 b=MgTOo+kKzsMbgJgCF6xaocLP8cnnngS3tP/PcE7HtNjnXQ9ApHn8g0/HmPSn2OGC49qQc21hLzVWGOsXeo3q74jUBPwM9u9g67A6Bln/kNqffhypeiA9ViR9Z48Dua82GejvTUYXQhXJqJON6h/4pMU0wroku9M5zLiuxXvcvltUZs+iwHIn0o0beqV+uTR5xL5h/GdG6zZ+63btzTQIYoYizpd5DvMgmNrR8qbL/Qq25d/afXQJFCKw+wru4ZvqPhTryD5GvN7AhGY58F9VAeOnbwxomZ5ajG9ERLFgm2ck2KMbKzcMAIWHjCUXd3kV43RMqNNQIN0UD22tjM35Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=McmHkWOhb44LLO/imeMp4TenhqDDVpQyLg10cr6LsVk=;
 b=c3Wdgv8iApGTwL7WuhvQc0PTWEnaa4mQwzKWPOsQMDw4ESnlOLEa9IYSGkKcdUxZ35LFVQsDrqujJdt4h0KE8+vksVCnNJcjyEK53lzoO++bmkalGCi5j9ilkPzye37HEgQ9m+Ce3A6CWxtQuD/BmLvOuNP/c3ir2roTJ0YSr5Y=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by IA0PR12MB8837.namprd12.prod.outlook.com (2603:10b6:208:491::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Mon, 29 Dec
 2025 02:25:12 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::833a:459:cc0a:fd2f]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::833a:459:cc0a:fd2f%3]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 02:25:12 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Yaroslav Bolyukin <iam@lach.pw>, =?iso-8859-1?Q?Ville_Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>
CC: "Wentland, Harry" <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)"
 <Sunpeng.Li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v7 7/7] drm/amd: use fixed dsc bits-per-pixel from edid
Thread-Topic: [PATCH v7 7/7] drm/amd: use fixed dsc bits-per-pixel from edid
Thread-Index: AQHcY3tEyFN5MTrPs02dSG6UH6lT/7U4DH6S
Date: Mon, 29 Dec 2025 02:25:12 +0000
Message-ID: <CO6PR12MB54891B24DC9AF32086009E6FFCBFA@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20251202110218.9212-1-iam@lach.pw>
 <20251202110218.9212-8-iam@lach.pw>
In-Reply-To: <20251202110218.9212-8-iam@lach.pw>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-12-29T02:25:19.991Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source; MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=1;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|IA0PR12MB8837:EE_
x-ms-office365-filtering-correlation-id: 8bf98eba-64a3-4f23-559f-08de46817ee0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?YT0kDHzxv83TUTX7R9cIObles9uTUdwdL0eyYXdCTI4wbLTEl9abCKDbzg?=
 =?iso-8859-1?Q?VMJ8VNUs7U+1fd8U3MrKr8QpQm7FQOwMRcAzO2L/uw2+VvFVPvk8+RZKv2?=
 =?iso-8859-1?Q?X3iZlEDEmziGsc0RJJBpl+a/BEwb5EY6BMMjZ0HvFsavEAF9AiS0BiBYOJ?=
 =?iso-8859-1?Q?NFFy6dz1wvRk0Bi+4UIgMcfIZYGE9acPaRyri/YVv3uvjFX0TwLchWCsyF?=
 =?iso-8859-1?Q?PfbdPrgd3km1cI52e8+961B0H4AowrLDMyhiqPCZzFsJL+npdEoOgi74jP?=
 =?iso-8859-1?Q?whASCbzrdeL14Het6vyAvGFcp5LmTRBovNecVgtTMYN5vvetKQencnz+3k?=
 =?iso-8859-1?Q?lw/6tkbAMpwPH+IC9PPvjS/z2Kdjlv/nfbkbHZlocMuvOrf3NoUajjKliZ?=
 =?iso-8859-1?Q?pIyErLRKj7Zi/+KjahKIfxnHm/5fJp/ghz5kPlpgD435xgfd+RBLHh3R8B?=
 =?iso-8859-1?Q?d5cNN3lPuBMmVsTF8yXW638slQ3nQt3p6ua+QMfNm/56ON0TmX6CFxIR9b?=
 =?iso-8859-1?Q?n5BWZbgDjkfM5+RaW2z3VNcYMx1DFyU3mqUQaS5yec8PFAzP0ui6JsfdQd?=
 =?iso-8859-1?Q?Csmjwpvz+IWvXE3L8B8ExMq2KqR0IE3gquE9IthA1tb3kDbCbnzXgo4WMG?=
 =?iso-8859-1?Q?I6idfX4Cb8AuK35u5jixaNzjBb06TEVPngItS4KBlhT8dtvrr56vWOoGsm?=
 =?iso-8859-1?Q?Or8OWf61UyxeaRiPxKwLpnEMt6R4jzPjSdDk7TPkaQjJ+7kAL3RCQTXYFl?=
 =?iso-8859-1?Q?1aGfnxVGqfOqZB0AH5CNkKP0PwEI54SxidGZJGwLsIghO8ZoZxZCEtmxNi?=
 =?iso-8859-1?Q?DLQ8yvk4Y2/uKVE7ZFQwzIMBNThrrJCz9evoRztiNcK/ZglV8JP2LBi3WF?=
 =?iso-8859-1?Q?dCSjBZoaXPRDYSUq05GVzqSEUuhj4yK5SoUTLMMNc+bY7IZEL9LemZzKoV?=
 =?iso-8859-1?Q?GyG47AT4daMjLC5qZRdDguAqY1ujE+Lt8Y/Ar9oycGn9DrWYs8I79p7fiv?=
 =?iso-8859-1?Q?lUe5yUpW2tCmJfbvXXi25HTjtjLdOP+9XSdAyxTqAGjDh1JuEYAvObGAgC?=
 =?iso-8859-1?Q?XfomIcaxJjDa4ibajafVQ566jFfnqEHFsV1deGkdvRad2BPQcQOx5vkm+M?=
 =?iso-8859-1?Q?u2yoXlEbFz+Bnp8W94KEYai9nhNIpDRvC4DWBZURVCqquJRFXzUNiNz5MW?=
 =?iso-8859-1?Q?bIjwLC9GynePycm60NWVC09sFp4j5HF7TVkzXNnwlbZLJwTupzto7rnI/I?=
 =?iso-8859-1?Q?AyPaRMV7+h4pcGmg/DBt8LJJNo3HN3znvZS1EY2ikkZBt//aaqhMtln8eI?=
 =?iso-8859-1?Q?du9KFgKJWk58qRj6JtYytl5zMt8OgbO+/lsZ8e2p05/gub8rxH/FHPvMNk?=
 =?iso-8859-1?Q?G1IymffwRwBgq2UdFFqeK60KKh72haa8Wq7ZmJ0S98LQPn9sFUdr16cFMe?=
 =?iso-8859-1?Q?yGp6pJ1w5wpE7yUhbxqP3pCkOsbx9H0+H7k0ThQRYfxm7shoT0othQFl4G?=
 =?iso-8859-1?Q?ub+YXf7af63RWjAK5G/TnsXsXvLWwZtjpnli53Np5eRFCuc3TWgjoVDYSk?=
 =?iso-8859-1?Q?gDNyZutQhPHr8Q/jgOlAhALFH6RR?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ZV3ZsT9vDQbYN9OVSYaElwnWHzPCsIxPr2qaA2CNAbpp7YTUM6whZcamyW?=
 =?iso-8859-1?Q?qyKxpoR57dlNZtwtvgj7LHytyinUqPKf4UDuxkto9zyNcwwZnwLiW/9HMC?=
 =?iso-8859-1?Q?71mbnp/I5U5DfVZLv9PbhOqiBKxmYoDwByrVy3eZqVlwbQ5zZvNZbCKQZZ?=
 =?iso-8859-1?Q?yU+VFGWE5f0GP1B5nG+v7zK1RqXiZCG0ZC/FRcaweDOnI8W8rIDN89+6EA?=
 =?iso-8859-1?Q?pbIeclGujSn10lRFn07rLMqIn77eI6dbJlREAKB3KoVH2YMyAldu1HGGVW?=
 =?iso-8859-1?Q?gqS57Q8btaJ1I5oxmw1gPslkWlGe0lzUtbIPj+wJ1mam1NY8Vx9IAsdAfY?=
 =?iso-8859-1?Q?5ZC1dJfcG/NlCEtSLOZsccX+eDzY7aiB/h+zjyJ9HuGTTR/qo7O8jdxtJJ?=
 =?iso-8859-1?Q?DzhNXTOs+dqf0SiDtefqsTcaH2FpoGF6RIftncpqaZ0CPgA7ItYCQaikdi?=
 =?iso-8859-1?Q?07JSQdXN0Eh1PJ3i6AQhHjmELWl1OKNA2SMxhyER9VPPZ2gOFUj51fQUp0?=
 =?iso-8859-1?Q?wnOhhU4t6KfisOCFemSmveK0pFQ4DIVUl/DTdDTrimN4/AdEYfNNFG4v6j?=
 =?iso-8859-1?Q?UrSqiYB4S9z7mM6Bpm05LLoCJVBXpJRlJURjqGKUsk12q+ZeDoWoyMJl7r?=
 =?iso-8859-1?Q?Bs+M1Z+FMcnuKCITBMQT12BaCPrY4hjTxo5HGlFGcmvnQeWwl0Zhz+6YDk?=
 =?iso-8859-1?Q?pc5n9aswW5pRajYFKQUvWcosOb70ITwa6RZOungEW56+GRAuZ8SXwz+Onn?=
 =?iso-8859-1?Q?gH5omHuA0EhVlCzYdVPnFof7cQUNwZGQFIfw91zDx1czKbrU8eKNdMWFj2?=
 =?iso-8859-1?Q?854VDyZQ4+mXBjaShBr/P11Qu7BNwo1JrINf5WAgEWfjkCotqF/w5ZYGKN?=
 =?iso-8859-1?Q?KJJkOwi8h5+5yvwDj9vRCuC/4R7+XhKVigiFaXzvWmk7O/hWPQVYeYoOJX?=
 =?iso-8859-1?Q?ua0mYLS/Y1n/bY0EwKVzrtNK3F0qfkIPd9m9YdHwoNEoMzh7NwCOGYn166?=
 =?iso-8859-1?Q?X2Yc1ARdYAgEvMbU/s81uomqg661Yc24/DlzMcx0kOxtDjU/UAZ1DGtUMo?=
 =?iso-8859-1?Q?VQVLdoT1qYzZF4qKcqAfvsnOXJn0eeuIQCeyw8wN81MGe5FRkEady/kL+H?=
 =?iso-8859-1?Q?zbtHt6lZ3qg0IyxDQuv3f/Egs43SZQbCH3sDtzupwkelHqk4HwQYmP0uYS?=
 =?iso-8859-1?Q?HCZHMFZcCnjH4V62oiA4WO2eNOjrDgyiciGztLKjJRGeUBZFBx65CRKvnG?=
 =?iso-8859-1?Q?+icAn/X27f3As50UJZVjX/Srckgwjxni8ByzSKdzzkfrplCPIc78okSUWu?=
 =?iso-8859-1?Q?tOJbVeeiY+jfrdJEn7U1/OA9OUlGNYQdDiDhjnBPl8YoWIiCnkOXVb7P+i?=
 =?iso-8859-1?Q?b8N9gqD+0iEp9rcuQNzS49VidNqKdZmGHMPu3B8KB8niBHx/GXKCfn9hxs?=
 =?iso-8859-1?Q?9Uv7XrmV9UIp1W0UZAk1yiLT8AliOiroY5Z9bg0bStJyzSIJKE4M2SrABj?=
 =?iso-8859-1?Q?MDt0KkIX7KeyE8P1Sx/yR0pQXFnWNUDOB8sVnP2CqNnyMvMV/nM2gcYfyp?=
 =?iso-8859-1?Q?QGPf9oJ4z0n0hljkzrw68TVxMcAc+7IqQ3EaTIbShpNidoq/xoI1y4uJQb?=
 =?iso-8859-1?Q?NBSv79AKwtYJmktnSnPesrsp+MPVvhGU/k0knr/hzJyR9cowds5M36F1Yv?=
 =?iso-8859-1?Q?bWqiKlaP67ImU2t7oP7G2LAlAR6V0EKaU/SHPlmrp50WLU/c6/p3HGOhQS?=
 =?iso-8859-1?Q?UU4OmM6JYTjrVtjKdm+wBE616cJMZLq2YfGygCGXSSsa8Q?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf98eba-64a3-4f23-559f-08de46817ee0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2025 02:25:12.6358 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ugQcF1VnQxytpW+bpAIN7a8KMKtPmKi4nwmwUiilxN8Ray+1Ax4He5e31z9ytzIDKfjitRo/VmnVO47TYUPLBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8837
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

Hi Yaroslav Bolyukin,=0A=
=0A=
Thanks for the patch.=0A=
Reviewed-by: Wayne Lin <Wayne.Lin@amd.com>=0A=
=0A=
Regards,=0A=
Wayne Lin=0A=
________________________________________=0A=
From: Yaroslav Bolyukin <iam@lach.pw>=0A=
Sent: Tuesday, December 02, 2025 19:02=0A=
To: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>; Maarten Lankhorst <m=
aarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>; Thom=
as Zimmermann <tzimmermann@suse.de>; David Airlie <airlied@gmail.com>; Simo=
na Vetter <simona@ffwll.ch>; Jani Nikula <jani.nikula@linux.intel.com>=0A=
Cc: Wentland, Harry <Harry.Wentland@amd.com>; Li, Sun peng (Leo) <Sunpeng.L=
i@amd.com>; Rodrigo Siqueira <siqueira@igalia.com>; Deucher, Alexander <Ale=
xander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Lin,=
 Wayne <Wayne.Lin@amd.com>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.fr=
eedesktop.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>=
; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; Yarosl=
av Bolyukin <iam@lach.pw>=0A=
Subject: [PATCH v7 7/7] drm/amd: use fixed dsc bits-per-pixel from edid=0A=
=0A=
=0A=
VESA vendor header from DisplayID spec may contain fixed bit per pixel=0A=
rate, it should be used by drm driver for the modes that declare=0A=
they are only supported with the declared fixed bits per pixel value.=0A=
=0A=
Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>=0A=
---=0A=
=A0.../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c=A0=A0=A0 | 16 ++++++++++++=
++++=0A=
=A01 file changed, 16 insertions(+)=0A=
=0A=
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c=0A=
index e6728fd12eeb..32370279283f 100644=0A=
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c=0A=
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c=0A=
@@ -6613,6 +6613,11 @@ static void fill_stream_properties_from_drm_display_=
mode(=0A=
=A0=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 stream->output_color_space =3D get_output_color_sp=
ace(timing_out, connector_state);=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 stream->content_type =3D get_output_content_type(c=
onnector_state);=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 /* DisplayID Type VII pass-through timings. */=0A=
+=A0=A0=A0=A0=A0=A0 if (mode_in->dsc_passthrough_timings_support && info->d=
p_dsc_bpp_x16 !=3D 0) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 stream->timing.dsc_fixed_bits_p=
er_pixel_x16 =3D info->dp_dsc_bpp_x16;=0A=
+=A0=A0=A0=A0=A0=A0 }=0A=
=A0}=0A=
=A0=0A=
=A0static void fill_audio_info(struct audio_info *audio_info,=0A=
@@ -7071,6 +7076,7 @@ create_stream_for_sink(struct drm_connector *connecto=
r,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 struct drm_display_mode mode;=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 struct drm_display_mode saved_mode;=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 struct drm_display_mode *freesync_mode =3D NULL;=
=0A=
+=A0=A0=A0=A0=A0=A0 struct drm_display_mode *dsc_passthru_mode =3D NULL;=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 bool native_mode_found =3D false;=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 bool recalculate_timing =3D false;=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 bool scale =3D dm_state->scaling !=3D RMX_OFF;=0A=
@@ -7162,6 +7168,16 @@ create_stream_for_sink(struct drm_connector *connect=
or,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
=A0=0A=
+=A0=A0=A0=A0=A0=A0 list_for_each_entry(dsc_passthru_mode, &connector->mode=
s, head) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (dsc_passthru_mode->hdisplay=
 =3D=3D mode.hdisplay &&=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dsc_passthru_mode->=
vdisplay =3D=3D mode.vdisplay &&=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 drm_mode_vrefresh(d=
sc_passthru_mode) =3D=3D mode_refresh) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mode.ds=
c_passthrough_timings_support =3D=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 dsc_passthru_mode->dsc_passthrough_timings_support;=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=
=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
+=A0=A0=A0=A0=A0=A0 }=0A=
+=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 if (recalculate_timing)=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 drm_mode_set_crtcinfo(&sav=
ed_mode, 0);=0A=
=A0=0A=
-- =0A=
2.51.2=0A=
=0A=
=0A=
