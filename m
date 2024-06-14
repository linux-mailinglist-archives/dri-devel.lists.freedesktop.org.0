Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C648908CA7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 15:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9933010E027;
	Fri, 14 Jun 2024 13:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2wdkSzhM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2083.outbound.protection.outlook.com [40.107.212.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE18010E027;
 Fri, 14 Jun 2024 13:45:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtaagtMO1gXfK0IJFUaG5VzwCi8otXfX9fYw47m2D7dW/Oz0rA16Ax987c8y75O6DOCXDxRPSiIps/XsSePq+Mic8NVi14Ulio1Xh1egx67CgaEPNqvANTfvaFs/IGXzWuCwIAFTzMig7a/G76lQMjaRfhGagjZGfQ9fotUkSubwoRNklbcuhSnLEy3JnB4Fnazf7A9zNQ8aUHD9v5ZEU2qi/CeZB+JwlqklHQR4+SGUrxfLY6TVs7vXhe7cI99zqK3XYz0hOJfNyqVT8La4WqGtaDiUGTDDjNnLcHLobxVLQoTppbKI9kGLDQxmQTiVZUWoBgsOXK7BY8d6he+ugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMQ6vGB0co8XbKv6J56JxCk0/0SjypYhsUlB9CGMBXg=;
 b=VxD5Rl2CDh9ID3HZ5ZinRr9Q0gn1i71nw79Wd1pi72SqnvioWTPDSf3gqlAvnebmalC4v8jAZOoJbp4jBhKPxe+f6Qpzq52G0QpktW2bIYhJ1xm/gR3uVZvbMQalkrEKMmNAMqEraS4HrqblfiiKlJLwPYo2CEYrsQ88EUBBQxokw5NIXfBIJfUQL+N246wtOPgESvwtlDluCqR5AxccjFYxLYJLwSa0rRgsJJwbk93QQFGvwm48gTnhWhECliDz8InOH6GJvoqlR3nBa60q3dIsMm4xVwH//amcCUT0tl3swBBND01/8cjXyOJRxxHEhSn4Z2nzYfS8amcaH0uedw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMQ6vGB0co8XbKv6J56JxCk0/0SjypYhsUlB9CGMBXg=;
 b=2wdkSzhMn1LgRtURoU+ECAOGdMf4Nvl9cXE5xHN6m6sQDUBFngPDNfc6JND9BuXOTj+SKmtRd1LBNuNXA1d7Sq5vd7cftlFdM6QLkBdgdYYHqAml1o8/YqYaeTeQ2at0fNFhxrlehlrrJaUfRM8+IImTNJkZaOuaZVyCIH95aOo=
Received: from DS7PR12MB5766.namprd12.prod.outlook.com (2603:10b6:8:75::12) by
 PH0PR12MB8776.namprd12.prod.outlook.com (2603:10b6:510:26f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.26; Fri, 14 Jun
 2024 13:45:21 +0000
Received: from DS7PR12MB5766.namprd12.prod.outlook.com
 ([fe80::7546:1785:7a42:1d49]) by DS7PR12MB5766.namprd12.prod.outlook.com
 ([fe80::7546:1785:7a42:1d49%5]) with mapi id 15.20.7611.030; Fri, 14 Jun 2024
 13:45:21 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Linux regressions mailing list
 <regressions@lists.linux.dev>
CC: "Petkov, Borislav" <Borislav.Petkov@amd.com>, "zack.rusin@broadcom.com"
 <zack.rusin@broadcom.com>, "dmitry.osipenko@collabora.com"
 <dmitry.osipenko@collabora.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, Dave Airlie <airlied@redhat.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, LKML <linux-kernel@vger.kernel.org>, ML dri-devel
 <dri-devel@lists.freedesktop.org>, "spice-devel@lists.freedesktop.org"
 <spice-devel@lists.freedesktop.org>, "virtualization@lists.linux.dev"
 <virtualization@lists.linux.dev>
Subject: RE: [REGRESSION] QXL display malfunction
Thread-Topic: [REGRESSION] QXL display malfunction
Thread-Index: Adq1XQDtRohTTtWlSaWZK1r1HvW2gQAALRPwAdoFIAAAA6rGAABjFFcw
Date: Fri, 14 Jun 2024 13:45:21 +0000
Message-ID: <DS7PR12MB57662053B081FBD62213016B94C22@DS7PR12MB5766.namprd12.prod.outlook.com>
References: <DS7PR12MB576622398096CB650FF6AF4294FF2@DS7PR12MB5766.namprd12.prod.outlook.com>
 <DS7PR12MB57665F9F4BDF0598D7CC53DD94FF2@DS7PR12MB5766.namprd12.prod.outlook.com>
 <67b279c7-1b65-46be-baa2-06794b47b9d1@leemhuis.info>
 <ab0fb17d-0f96-4ee6-8b21-65d02bb02655@suse.de>
In-Reply-To: <ab0fb17d-0f96-4ee6-8b21-65d02bb02655@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=96ef6f49-b484-4c48-a90e-2e2a402c4222;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-06-14T13:43:01Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB5766:EE_|PH0PR12MB8776:EE_
x-ms-office365-filtering-correlation-id: a68853ca-6962-4cdb-5750-08dc8c783c18
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|366013|376011|7416011|1800799021|38070700015; 
x-microsoft-antispam-message-info: =?utf-8?B?T1o5cmlRNFRHeENnWTIwZ0dyT3U0TmlSNTgxVUF5NXJyV016UHMweXBpcFRP?=
 =?utf-8?B?NXF5Y0hURk4xMjVUcytNUVA5QktvaXAzR21zZFN5dHY3cENxQXZaSVRkSFE3?=
 =?utf-8?B?NFUwaDBWeDhiVkd3NkoxOGMzKzZYdWVDRTRhM1p3YmdBM2E3aWtnS3dMcWFQ?=
 =?utf-8?B?cDhwQ25ILy8ycGova2xndnp3Uys2VlYxMUErNHNmTUtIZ0t4dnJmSkgwOFNW?=
 =?utf-8?B?OWNqcEw5TTVXclBMK1JaNkhyQ0tSek1QTThSTStaRlhmOFBZVmZGYnk5QXpV?=
 =?utf-8?B?d1ArSXVJWXQzZUd6Vmp4dktEaEtBUTdmc1gyVHNiMThwQ2ZJQStycVF4N2or?=
 =?utf-8?B?YWZpek1zSmVUL0JKK21pOGh5cFdxUU81by9QRTRvNDY4VTVBWUxMcWY4SFNu?=
 =?utf-8?B?MFNEZlB3L3pFMDBaWUFRN2oyaE1uUUsrWUF0SldpS1h6UnBqeUMyVC9EY0oy?=
 =?utf-8?B?MmVlVDVycWpJU1VsbnE4ajZaUTg2VzlSUzNVVmlBdk44L3RaZTRIVzVrZDdj?=
 =?utf-8?B?YmRUQlVvOXpJNzFjNGVFbDc4WC8yTkEvNDF6TG1mOXJNTlNEcHJ4cWNDTEM2?=
 =?utf-8?B?d2taeFQ2RFQwbXBzU0VHRmN2aWZMNmUwQkZJZlJUY3ljN0FWNmt0MFJtMHdW?=
 =?utf-8?B?Mm0yZDBQZUo4YzZsRWgwMEE1WklmSWhYRk5RMlFWY3pYemlnb29UL2R3VVdG?=
 =?utf-8?B?eFlEM3JlZjNEMjFGOHFQa0RkdG1hVm1CYjVOVUZXOHczTzhPU1NVcHdVVXlJ?=
 =?utf-8?B?TlBCQnpxOUVweVJOeDdMY3NCODJycGtuYzlxQzlHcGxsTkxDMTh0UFMxMTcr?=
 =?utf-8?B?dndrV3NaelV0ci9iTU1DdGxWTFNEL1lwbTdyMXYyb0hwR2dJWUhMbHZ2clY5?=
 =?utf-8?B?RlYxNmhBUVdkQUNPRThDRTdGNmEzK3VNVTVlbnJwTHNTV2czWjFMQWpRektU?=
 =?utf-8?B?NkNNcEdCWGhTbzBENmprcHMySXRoOVZGcGEzSThrdE1KUmg5SEQyL21NU3FT?=
 =?utf-8?B?QTBYMVM5UkxjR2QzcFpKTkNSZW04a2plY3VHM05OQU0xazRoRms3eHhNS0Zs?=
 =?utf-8?B?YkliM1pjK2Fvc01UMG91ekNSKzVCbEliU2JqM1pZZVZDSWNQK2xZSmFMaGxN?=
 =?utf-8?B?NDFBU3AxV1FETmJmRGNKMldOVUdXNVZOVUZIOWxSYyt2OHd2Zk5oUXpWUkRv?=
 =?utf-8?B?VjcvenY1Q2RSRzdWcE1FdVhXMzVodUg1UkRnUGhBUVBoSm9SOUFNbmswa2tv?=
 =?utf-8?B?djIvNWYyOTBmTGF2NUJJTGxuZlc0M0pieEJMUXRpV2hwb2wxQ0c3dk1FN252?=
 =?utf-8?B?WFpWdkN4V1BxeWJTRkxqZkliVFZ5ZmZEZ3Vld1A4Q1oyZklEV3NoOXBtUkkw?=
 =?utf-8?B?dmovUFhsSlpIWkkwNFFqRDYvTnlCNjhWbHNUQXI2VzQ0NUMyQy9tWUFTbWx5?=
 =?utf-8?B?WUVqd3o3NGFXZldQTzEzODFFZCtVR3dJWGVrU3pkWjRkTXdOTXIreXhUb0dZ?=
 =?utf-8?B?N0lJaG5ZYVc5aG5paTkzZkFKUmRYbFlVNFZzNm10SHBaNy9qelJvenRQYUEr?=
 =?utf-8?B?Z1BNcDVGVkJPQnlNTGtLYnVxOWV6NVBmeG4vMHMrb3hCdzkrOXArODVOVDlJ?=
 =?utf-8?B?OUZGalZZWGZxUjFsN2tKeU9qRElHZW5NK25vMzN5UHZ3ZkZUeVBrVlpRY2VD?=
 =?utf-8?B?U1FBQ0MwcERRdFJpVWMyTEUyaTFYcm9VME4wZzdETG5nbDgrTXpFREQrME9j?=
 =?utf-8?Q?8l++lx/O8KBYXCxaTaiSgfPAk4kjXED2w2QlnDL?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB5766.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(7416011)(1800799021)(38070700015); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1hxN29KNE9uS1hPc2hpUmdGUTZLajRSNWhZVG9ZcExqb3V0OVRnM3cvaXZo?=
 =?utf-8?B?RmUzTTR6d2M0bGVLM2hGeE5TWFJxRXJTTjZ4ckNWemdrK2Y5M0ZhbkJUQkQ5?=
 =?utf-8?B?TEo0Mm5BN25FWjRRb0V2U0FnOFpLVUJCbDJsQ1BVUWhLbE0vbmRHdklncWsy?=
 =?utf-8?B?NW1xWGhBanJidXZCMkJVSEs3Y2ZhU0dlQTB3NDJETGl5bWlTdlYxL3MrMTBn?=
 =?utf-8?B?RXNVK1ZTNVU4R0l0YUhsTy96U244K3lGOVVVbC90VFI1cHRqN0FNM0puQWNl?=
 =?utf-8?B?Nng2c3I1a05kOVFJWk84dy9uQVVaUDlRMDRYNWxGOXVyeEJ0dUtGMzNIRXRu?=
 =?utf-8?B?NXROTmxuYmxHZ24rcU5sNmZEK1I4TlU1V3AzbjVkWjA3R2F2MzAvcENZTkpE?=
 =?utf-8?B?a3ArZkdCQ1lGM3B5NTJBYmN2bGduOEF2R01OWUE2U0JWcWsxalUxM21sSFVW?=
 =?utf-8?B?Mk9ncTNlS09Kbld1aFdSYk95M0g4d2xSSEtnYTE3OHZ3Mjg0SnFsUTIvYmho?=
 =?utf-8?B?MTFtRkU3TmkrUmFMUThiRWNLUHlSNyt3b0tIdGl1eW5INmxhaDNPYnp1aGJT?=
 =?utf-8?B?NXRLYjZ5aForU2x0L3VnVjQzYUpYZXBmRHMrb1d6NTlEc3U4dWZSaUZ3dDQx?=
 =?utf-8?B?eHZobWRDS254THZoMjYzQWRVV0tQZ0hYc2pxN3JrWkJpLzZSWVVsVDVhRHYz?=
 =?utf-8?B?bmhHdnN6WUd2TUhORFNTTmdDcXRwNDBBYUgyVWVIZGllQnFJa24yS2JvUmli?=
 =?utf-8?B?djNrbkZnSVlYN2JvdG4yc3d5QTRuOURYYmlXdVZ1U3hqYzY5bEtpdVFTU0Ri?=
 =?utf-8?B?VVNxK1Y3QURkcVpSaG9PZnpJdFhWdk51aTdKWHBqMFIxY1VPdC9uMGV2M1hH?=
 =?utf-8?B?WVhHL3ltWWV2WDhaRmxIMGMxT2IzUXlhYmFyRG1LOWFCTldHN3B6UStsUWxH?=
 =?utf-8?B?dFFxbXRSeGU3a2RLN3BDMmZXRmRzbi80aWhicHZFZzVJQ0NaODNDVXIyVFNC?=
 =?utf-8?B?eE9BMU51UDZJU2srckxQTzMrZlZRaHJxSTN1QzFTOW5ENjV6aTlRU1cyclQv?=
 =?utf-8?B?RldWT3R5UGFWNURIUnN6YUl0cG1PT2RPWHV3VlEzQ0l2ZXhmOUJnYUZodS9j?=
 =?utf-8?B?aVJQUjFtc1JlbVVXNUxYemdmOW1NRUNqN1pSN3ZiL0VGYWs3c3FnQTdtZFJM?=
 =?utf-8?B?OGxxREQ5UkpVN0N6VkRMRjBYM2ROWjloQ0lVUjFRQm1HcEhyVUxkOUo1ZnVH?=
 =?utf-8?B?bjFNbmVJdHU5N2ZDY2FENFVjczZUdS9HL0QrUW1xZ2FWSzdVZWpKSERaUWtF?=
 =?utf-8?B?YzJLT0dWYWxPN3dpdXU5TWU0a1Njb3VZSmF3dWdFQ2NDalVhdnhHWTRZb2t4?=
 =?utf-8?B?czk0ZWZKdDFRZURTOE5WdGxnaTFjeFJqUHdOMnYwcWJ0eG9vNEVHWWZwS0JM?=
 =?utf-8?B?N0U1YTRUTE1jbEFwcXRHMm01Wm9kemlyTjVrT1dFVkhoWUxQalNZMGFsSzZj?=
 =?utf-8?B?WHNXZEJqNjNzdk1QRkhyM0xMZTVrYkdlbVcxMTVMUWZkZldEOEJzQVhaQzhr?=
 =?utf-8?B?eENjRUplRTYzZjVtSEdHcVR1VTdpRTZIU2pYVTlWSkwxbU5udE9PcE9xZjJR?=
 =?utf-8?B?QTBBaGJ5YkNldHI0UmxhdmZ5TitPTitkbWErYmh6K2lXTEdTaWpXSWo1SytN?=
 =?utf-8?B?b3g1OXFZV0FXYUpnbVl4VHVQaGVNV0VPTFRLVHZQNFhqOEdEUm9rV01VYStz?=
 =?utf-8?B?akJiNEk5MzNoTmpFN3hIcTk1NXlNOEh1a3grRGkyOGQ0K1lQMTc0ZSswM1BZ?=
 =?utf-8?B?cWpnUTJBd2R0YVhISm55SWs5ZUhYU1VzSnlWK1VIVUtZNENVOWRCYXArQ3Zv?=
 =?utf-8?B?SDgxVFhnZEJZUXpLNzZBNDM1SDdBMjdLZTJhUEIzalRrTkhQQXZVVWt5MGdN?=
 =?utf-8?B?MDFCS04waVlGa2NSUFgrc1ZDY0JvYzFxdkkzMTRWMkNpSS9kYUt1WHV6TXBw?=
 =?utf-8?B?dWtyakJXWEY1V2tabkxpcEw3V2RtTnVpYUwzMnRFbUxJVXFVWTlEUHRLZVFj?=
 =?utf-8?B?MEN5SUY4VEpvcVNHblp5YUcxSzNtK285YkxadCs1OFlhSUdlL3RyQW9iWnVt?=
 =?utf-8?Q?WLTk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5766.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a68853ca-6962-4cdb-5750-08dc8c783c18
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2024 13:45:21.1688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xpJL+efaC9CP58KHQSow2u6htv14SySo0jJrkTfHfs6f4wvx5MEQPuFJLcJv2Opi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8776
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDEyLCAyMDI0
IDk6MjYgQU0NCj4gVG86IExpbnV4IHJlZ3Jlc3Npb25zIG1haWxpbmcgbGlzdCA8cmVncmVzc2lv
bnNAbGlzdHMubGludXguZGV2Pg0KPiBDYzogUGV0a292LCBCb3Jpc2xhdiA8Qm9yaXNsYXYuUGV0
a292QGFtZC5jb20+Ow0KPiB6YWNrLnJ1c2luQGJyb2FkY29tLmNvbTsgZG1pdHJ5Lm9zaXBlbmtv
QGNvbGxhYm9yYS5jb207IEthcGxhbiwgRGF2aWQNCj4gPERhdmlkLkthcGxhbkBhbWQuY29tPjsg
S29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47DQo+IERhdmUgQWly
bGllIDxhaXJsaWVkQHJlZGhhdC5jb20+OyBNYWFydGVuIExhbmtob3JzdA0KPiA8bWFhcnRlbi5s
YW5raG9yc3RAbGludXguaW50ZWwuY29tPjsgTWF4aW1lIFJpcGFyZA0KPiA8bXJpcGFyZEBrZXJu
ZWwub3JnPjsgTEtNTCA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47IE1MIGRyaS1kZXZl
bA0KPiA8ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IHNwaWNlLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzsNCj4gdmlydHVhbGl6YXRpb25AbGlzdHMubGludXguZGV2DQo+IFN1
YmplY3Q6IFJlOiBbUkVHUkVTU0lPTl0gUVhMIGRpc3BsYXkgbWFsZnVuY3Rpb24NCj4NCj4gQ2F1
dGlvbjogVGhpcyBtZXNzYWdlIG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2UuIFVz
ZSBwcm9wZXINCj4gY2F1dGlvbiB3aGVuIG9wZW5pbmcgYXR0YWNobWVudHMsIGNsaWNraW5nIGxp
bmtzLCBvciByZXNwb25kaW5nLg0KPg0KPg0KPiBIaQ0KPg0KPiBBbSAxMi4wNi4yNCB1bSAxNDo0
MSBzY2hyaWViIExpbnV4IHJlZ3Jlc3Npb24gdHJhY2tpbmcgKFRob3JzdGVuIExlZW1odWlzKToN
Cj4gPiBbQ0NpbmcgYSBmZXcgbW9yZSBwZW9wbGUgYW5kIGxpc3RzIHRoYXQgZ2V0X21haW50YWlu
ZXJzIHBvaW50ZWQgb3V0DQo+ID4gZm9yIHF4bF0NCj4gPg0KPiA+IEhpLCBUaG9yc3RlbiBoZXJl
LCB0aGUgTGludXgga2VybmVsJ3MgcmVncmVzc2lvbiB0cmFja2VyLiBUb3AtcG9zdGluZw0KPiA+
IGZvciBvbmNlLCB0byBtYWtlIHRoaXMgZWFzaWx5IGFjY2Vzc2libGUgdG8gZXZlcnlvbmUuDQo+
ID4NCj4gPiBUaG9tYXMsIGZyb20gaGVyZSBpdCBsb29rcyBsaWtlIHRoaXMgcmVwb3J0IHRoYXQg
YXBwYXJlbnRseSBpcyBjYXVzZWQNCj4gPiBieSBhIGNoYW5nZSBvZiB5b3VycyB0aGF0IHdlbnQg
aW50byA2LjEwLXJjMSAoYjMzNjUxYTVjOThkYmQNCj4gPiAoImRybS9xeGw6IERvIG5vdCBwaW4g
YnVmZmVyIG9iamVjdHMgZm9yIHZtYXAiKSkgZmVsbCB0aHJvdWdoIHRoZQ0KPiA+IGNyYWNrcy4g
T3Igd2FzIHByb2dyZXNzIG1hZGUgdG8gcmVzb2x2ZSB0aGlzIGFuZCBJIGp1c3QgbWlzc2VkIHRo
aXM/DQo+ID4NCj4gPiBDaWFvLCBUaG9yc3RlbiAod2VhcmluZyBoaXMgJ3RoZSBMaW51eCBrZXJu
ZWwncyByZWdyZXNzaW9uIHRyYWNrZXInDQo+ID4gaGF0KQ0KPiA+IC0tDQo+ID4gRXZlcnl0aGlu
ZyB5b3Ugd2FubmEga25vdyBhYm91dCBMaW51eCBrZXJuZWwgcmVncmVzc2lvbiB0cmFja2luZzoN
Cj4gPiBodHRwczovL2xpbnV4LXJlZ3RyYWNraW5nLmxlZW1odWlzLmluZm8vYWJvdXQvI3RsZHIN
Cj4gPiBJZiBJIGRpZCBzb21ldGhpbmcgc3R1cGlkLCBwbGVhc2UgdGVsbCBtZSwgYXMgZXhwbGFp
bmVkIG9uIHRoYXQgcGFnZS4NCj4gPg0KPiA+ICNyZWd6Ym90IHBva2UNCj4gPg0KPiA+DQo+ID4g
T24gMDMuMDYuMjQgMDQ6MjksIEthcGxhbiwgRGF2aWQgd3JvdGU6DQo+ID4+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4gRnJvbTogS2FwbGFuLCBEYXZpZA0KPiA+Pj4gU2VudDog
U3VuZGF5LCBKdW5lIDIsIDIwMjQgOToyNSBQTQ0KPiA+Pj4gVG86IHR6aW1tZXJtYW5uQHN1c2Uu
ZGU7IGRtaXRyeS5vc2lwZW5rb0Bjb2xsYWJvcmEuY29tOyBLb2VuaWcsDQo+ID4+PiBDaHJpc3Rp
YW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IHphY2gucnVzaW5AYnJvYWRjb20uY29tDQo+
ID4+PiBDYzogUGV0a292LCBCb3Jpc2xhdiA8Qm9yaXNsYXYuUGV0a292QGFtZC5jb20+Ow0KPiA+
Pj4gcmVncmVzc2lvbnNAbGlzdC5saW51eC5kZXYNCj4gPj4+IFN1YmplY3Q6IFtSRUdSRVNTSU9O
XSBRWEwgZGlzcGxheSBtYWxmdW5jdGlvbg0KPiA+Pj4NCj4gPj4+IEhpLA0KPiA+Pj4NCj4gPj4+
IEkgYW0gcnVubmluZyBhbiBVYnVudHUgMTkuMTAgVk0gd2l0aCBhIHRpcCBrZXJuZWwgdXNpbmcg
UVhMIHZpZGVvDQo+ID4+PiBhbmQgSSd2ZSBvYnNlcnZlZCB0aGUgVk0gZ3JhcGhpY3Mgb2Z0ZW4g
bWFsZnVuY3Rpb24gYWZ0ZXIgYm9vdCwNCj4gPj4+IHNvbWV0aW1lcyBmYWlsaW5nIHRvIGxvYWQg
dGhlIFVidW50dSBkZXNrdG9wIG9yIGV2ZW4gaW1tZWRpYXRlbHkNCj4gc2h1dHRpbmcgdGhlIGd1
ZXN0IGRvd24uDQo+ID4+PiBXaGVuIGl0IGRvZXMgbG9hZCwgdGhlIGd1ZXN0IGRtZXNnIGxvZyBv
ZnRlbiBjb250YWlucyBlcnJvcnMgbGlrZQ0KPiA+Pj4NCj4gPj4+IFsgICAgNC4zMDM1ODZdIFtk
cm06ZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X3BsYW5lc10gKkVSUk9SKiBoZWFkDQo+IDENCj4g
Pj4+IHdyb25nOiA2NTM3NjI1NngxNjc3NzIxNiswKzANCj4gPj4+IFsgICAgNC41ODY4ODNdIFtk
cm06ZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X3BsYW5lc10gKkVSUk9SKiBoZWFkDQo+IDENCj4g
Pj4+IHdyb25nOiA2NTM3NjI1NngxNjc3NzIxNiswKzANCj4gPj4+IFsgICAgNC45MDQwMzZdIFtk
cm06ZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X3BsYW5lc10gKkVSUk9SKiBoZWFkDQo+IDENCj4g
Pj4+IHdyb25nOiA2NTMzNTI5NngxNjc3NzIxNiswKzANCj4NCj4gSSBkb24ndCBzZWUgaG93IHRo
ZXNlIG1lc3NhZ2VzIGFyZSByZWxhdGVkLiBEaWQgdGhleSBhbHJlYWR5IGFwcGVhciBiZWZvcmUN
Cj4gdGhlIGJyb2tlbiBjb21taXQgd2FzIHRoZXJlPw0KDQpObywgSSBkaWQgbm90IG9ic2VydmUg
dGhlbSBwcmlvciB0byB0aGUgYnJva2VuIGNvbW1pdC4NCg0KPg0KPiA+Pj4gWyAgICA1LjM3NDM0
N10gW2RybTpxeGxfcmVsZWFzZV9mcm9tX2lkX2xvY2tlZF0gKkVSUk9SKiBmYWlsZWQgdG8gZmlu
ZA0KPiBpZCBpbg0KPiA+Pj4gcmVsZWFzZV9pZHINCj4NCj4gSXMgdGhlcmUgb25seSBvbmUgc3Vj
aCBtZXNzYWdlIGluIHRoZSBsb2c/IE9yIG11bHRpcGxlL2ZyZXF1ZW50IG9uZXMuDQoNCkkgd291
bGQgdXN1YWxseSBvbmx5IHNlZSBvbmUuDQoNCj4NCj4gQ291bGQgeW91IHByb3ZpZGUgYSBzdGFj
ayB0cmFjZSBvZiB3aGF0IGhhcHBlbnMgYmVmb3JlPw0KDQpIZXJlJ3MgdGhlIHRvcCBvZiBhIGJh
Y2t0cmFjZSB3aGVuIHRoZSBlcnJvciBvY2N1cnM6DQojMCAgcXhsX3JlbGVhc2VfZnJvbV9pZF9s
b2NrZWQgKHFkZXY9cWRldkBlbnRyeT0weGZmZmY4ODgxMDEyNmUwMDAsIGlkPWlkQGVudHJ5PTI2
MjE1MSkNCiAgICBhdCBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9yZWxlYXNlLmM6MzczDQojMSAg
MHhmZmZmZmZmZjgxOWY1YjZhIGluIHF4bF9nYXJiYWdlX2NvbGxlY3QgKHFkZXY9MHhmZmZmODg4
MTAxMjZlMDAwKQ0KICAgIGF0IGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2NtZC5jOjIyMg0KIzIg
IDB4ZmZmZmZmZmY4MTBlM2FhOCBpbiBwcm9jZXNzX29uZV93b3JrICh3b3JrZXI9d29ya2VyQGVu
dHJ5PTB4ZmZmZjg4ODEwMTY4MDMwMCwNCiAgICB3b3JrPTB4ZmZmZjg4ODEwMTI2ZjM0MCkgYXQg
a2VybmVsL3dvcmtxdWV1ZS5jOjMyMzENCiMzICAweGZmZmZmZmZmODEwZTYyODEgaW4gcHJvY2Vz
c19zY2hlZHVsZWRfd29ya3MgKHdvcmtlcj08b3B0aW1pemVkIG91dD4pDQogICAgYXQga2VybmVs
L3dvcmtxdWV1ZS5jOjMzMTINCiM0ICB3b3JrZXJfdGhyZWFkIChfX3dvcmtlcj0weGZmZmY4ODgx
MDE2ODAzMDApIGF0IGtlcm5lbC93b3JrcXVldWUuYzozMzkzDQoNCj4NCj4gV2Ugc29tZXRpbWVz
IGRyYXcgaW50byB0aGUgYnVmZmVyIG9iamVjdCBmcm9tIHRoZSBDUFUuIEZvciBhY2Nlc3Npbmcg
dGhlDQo+IGJ1ZmZlciBvYmplY3QncyBwYWdlcyBmcm9tIHRoZSBDUFUsIG9ubHkgYSB2bWFwIG9w
ZXJhdGlvbiBzaG91bGQgYmUNCj4gbmVjZXNzYXJ5LiBJdCBhcHBlYXJzIGFzIGlmIHF4bCBhbHNv
IHJlcXVpcmVzIGEgcGluLiBNeSBndWVzcyBpcyB0aGF0IHRoZSBwaW4NCj4gaW5zZXJ0cyB0aGUg
YnVmZmVyLW9iamVjdCdzIGhvc3Qtc2lkZSBwYWdlcyBhbmQgdGhlIGNvZGUgYXJvdW5kDQo+IHF4
bF9yZWxlYXNlX2Zyb21faWRfbG9ja2VkKCkgYXBwZWFycyB0byBiZSBnYXJiYWdlLWNvbGxlY3Rp
bmcgdGhlbS4NCj4gSGVuY2Ugd2l0aG91dCB0aGUgcGluLCB0aGUgR0MgY29tcGxhaW5zIGFib3V0
IGluY29uc2lzdGVudCBzdGF0ZS4NCj4gPj4+DQo+ID4+PiBJIGJpc2VjdGVkIHRoZSBpc3N1ZSBk
b3duIHRvICJkcm0vcXhsOiBEbyBub3QgcGluIGJ1ZmZlciBvYmplY3RzIGZvcg0KPiB2bWFwIg0K
PiA+Pj4gKGIzMzY1MWE1Yzk4ZGJkNWE5MTkyMTlkOGMxMjlkMDY3NGVmNzQyOTkpLg0KPg0KPiBU
aGFua3MgZm9yIGJpc2VjdGluZy4gRG9lcyBpdCB3b3JrIGlmIHlvdSByZXZlcnQgdGhhdCBjb21t
aXQ/DQoNClllcw0KDQpUaGFua3MgLS1EYXZpZCBLYXBsYW4NCg==
