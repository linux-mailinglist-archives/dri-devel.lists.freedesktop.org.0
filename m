Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A836873E66
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 19:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F93113404;
	Wed,  6 Mar 2024 18:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HFfTq5WP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3B3113403;
 Wed,  6 Mar 2024 18:21:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6Q5yFmxZgEzSX2fCi9vNgO84DQ/DgocTqtohqiJ6mcIzrfM8pMLAm65yCY2n7S9iWCkqTDmF0xKNPfRdeNMGoSWFE83NLwrFIN9AAxOUn8taVITdzC4l3Uhphiu5JuxKoDlXr/6vtToTPI1EtCuf7SPs7ulB++LGWLgAVefzyz8gO+kxUZNbBVhqP3gihfloz4VAWWum+gc0yWswn7E1USKS15RUHS4scZEcHUlX/vrvjp0NRDH/mfVz0eThQgTQhrTQnmjvPDjUd+qkbT12gBREYhRH8rQyWW6qyxnlM00YpCCGUY1jozpNgO4p+WkFuz639jELp8pYIPz3j8Nyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1NQvloMBWzTth0YhLMDyIqdm0uAwqqEzEYa0yluYPk=;
 b=Ew+ZJwZm3hnKeGtzT4I00ADZkGyh8dWgtUQwWkCeS3ld4UkO5u85tOEP5UqnHr2q3mXGzrMiePKKtIewGN1YGM/L+z09+5x5BQvarTuubmiM8YgcH9Ade5VqaLtGY+HuTWTM2pw7hsnstK+yMOCQvd0HnH5CxjXn2MgRGoP83xPGtLwqncNgvXVo13zrmKBS9zTKrBrHxJBvDfYJdNyB/u2X40+q7OitdJbT9JYn7VhgCF7WpHogE+NjpX65/ZQELR47VEJZQnSW1c/HWbtqDAlXOSWNkk+nClA4FXNtjjWsO4473nOo6VPIEHDYHfYo4frdD4z44DBl+NLVtqwskQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1NQvloMBWzTth0YhLMDyIqdm0uAwqqEzEYa0yluYPk=;
 b=HFfTq5WPrPlknLorQsUS33IcXquUMbDOF8awfzT5mKyzBDob29hW0UEIcy7gaYcpJ4LtqPE2xEAAMDKkvo8fDQUmsC3OvgPEjK1SBrdLmzHr0aNBa0KIBJgtVPj/caR5xFsfYGRt4Cl0w9I+dwZWnbNBDhOFpwa8GQ5tnqADlfI=
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by DM6PR12MB4105.namprd12.prod.outlook.com (2603:10b6:5:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.37; Wed, 6 Mar
 2024 18:20:58 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd%4]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 18:20:58 +0000
From: "Khatri, Sunil" <Sunil.Khatri@amd.com>
To: "Khatri, Sunil" <Sunil.Khatri@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Joshi, Mukul"
 <Mukul.Joshi@amd.com>, "Paneer Selvam, Arunpravin"
 <Arunpravin.PaneerSelvam@amd.com>
Subject: RE: [PATCH] drm/amdgpu: cache in more vm fault information
Thread-Topic: [PATCH] drm/amdgpu: cache in more vm fault information
Thread-Index: AQHab/LdrvwAfg0zAkKIpsvH9Yf/ybErBhxQ
Date: Wed, 6 Mar 2024 18:20:58 +0000
Message-ID: <PH7PR12MB55969E46DE97968839CE025F93212@PH7PR12MB5596.namprd12.prod.outlook.com>
References: <20240306181937.3551648-1-sunil.khatri@amd.com>
In-Reply-To: <20240306181937.3551648-1-sunil.khatri@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=9a5e1642-9e58-4919-b3a8-858cd66ae208;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2024-03-06T18:20:44Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5596:EE_|DM6PR12MB4105:EE_
x-ms-office365-filtering-correlation-id: e1cdf4c5-b9c3-49d4-ea80-08dc3e0a2b8c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fRkuCngeMeI56vrwkOCbfzQ5IYT8YMd0chdd1jZGdvuUUf9e/lwvK3hZDIkNrk0GMW28IgNAnMUGUIjEil+xeprh9UzZDW+Mjkh7hB/cG5T3ipvZUWChYwz01n8MmVJetxtXN/5FAoNDopu5Pi600ZDTC92ZEVBps3+G4iCZqq8U51ke8wS+rF3ifiCvlsAPaVqOTSSUatzi9dUAEf2m9E12HfmqwKd0Z3Bl6Swnuz0wnW7bGjchHkRysxMQstOm1Fo+r1mQHtZZHrUUS3Qld58TPp6V9DHbiwcIoHrz5VTlsUorQ4nkYxr9BmBZONB4w6sA7HzL3I0IW0BLjfMJv/dHosGW/scWtZUG0eEAG8pZzYKLT79mveUzuQTF2Wv5AEGG8Ed3xBJG9q+FrGVuUK/aR7hDpsBGkgiOKmdUP5+plNPIq9pWxnp1bKbU/PX1BtjwZsV+SHNaA+E3AMut+GzNt4/2Hdkw+i+IN25duOsQvE53Laul5FdIZb4VJYGTkC5tsQqL+MP0QsV6hVQ8qnON9adp6YLksVYGVE2aXzapo4FdZQS8KceF9MKdn+b/FZP9HwgMtsgA8gX50g7YAm2X2ttY1vkpbI9a/FuzH3UEkCRsQqWDFhEU7cuGxQfqEBQriiXscakOuiDKtNCbv1V6hKPqxD6tGi1gS0NaIT/46l9t63a+guOe70S8EyVw7+c0dXl0Aa9IIAN45Sk9vA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AXiVnlewVItsfZfwDWXzkA6lEEtOUO/42mCcmJKdsf/2XrtpNBBhyPnabh8T?=
 =?us-ascii?Q?RwQt9G/TVKntbu0uhRmhNsS+sXPJkbzXXD1218/imIjrEv9dbyTQbBMRIqyM?=
 =?us-ascii?Q?1dS0Hg33quO0QVbvIUl5Pkkspg94NAyOS0LsFhYhkNjzIyvCsqHN5Xm8pPDx?=
 =?us-ascii?Q?z99sFJ0IMrUirIcjWpxXwZGyldYefi/AvYzfWLC5P0xhTvvZSqqvhM30sBcC?=
 =?us-ascii?Q?hKtM52sJFDe4tlGHfvWewp3WcE9qCd1+jUYlF0607cirzXwI6UTxQns7CrPV?=
 =?us-ascii?Q?VNbD+SqYmSM54siQyQErPNaYWEUNYojRY55WsajWQ7LmyuxeqXfvK16xE/BH?=
 =?us-ascii?Q?w9Mgd7tylQ1Ied3Ws+k/1SO0zfNst5h64C1IBni6Y0eTEcrAvHhZdG7mho80?=
 =?us-ascii?Q?SZdRSuqeZ/8L8ozURRf+kawSF0zctFlCLhEsAi1YVfu4Z6E3wncL7RyeQTJ+?=
 =?us-ascii?Q?Q4kZGMTqlM1/5O8YfTF4tgAFKeupN7lALyS1ItqyW0DP9PNtMDfFsxg35QSd?=
 =?us-ascii?Q?gaEcgBvzDTG9X/tZtrpeBY8tsiX+NALmZpMlhZmyzJ8UDSaOsidJILP4Umfn?=
 =?us-ascii?Q?FO9T/eA/Ktd+4XVpHjQKrMTlgOeHxpLG3Ywhf+D8/82FQLsj+wiabXQdcUoy?=
 =?us-ascii?Q?EnRZzaz7vs8JD31UI2zBVcStk0FLWytyXl//3+Qjy6ynvwTOU5+ufDsW2RE8?=
 =?us-ascii?Q?GOPwILynKaW4rjBQ8X2PClagap5d6witINAWrU9uzdCRLJM9Lq/Qu9B2EsKR?=
 =?us-ascii?Q?xR7bTK3ck0hTJRzNzoeJCXIyUAGmjVOx91PnXd7ZfDwTfT+aDMwuxVfmRzdK?=
 =?us-ascii?Q?dbW5hC9ruUBGjApGkbgDM5BIeDebcWylHwi0T5jqGGHCZd5t4R3FOvnJ9eDo?=
 =?us-ascii?Q?5Kd7GrDPElum0Mt+x0dqQgMTl3ZbjR6R7vROrFPXL/lnUnWdX0yT59uNBXwX?=
 =?us-ascii?Q?PtMYaSHTVgexIGswJnjt/gRDI3H/ExSqS1rh30WSfEq+hs782aYK3VHhCXty?=
 =?us-ascii?Q?8F0EwherE423qFNc3pwCVYuY8dmvs9thWoJKx07d3HNdbxFx5FqbzHGHhmbu?=
 =?us-ascii?Q?dSVLte1RA5JwhU+p8SpamIC38a3XD13us43NK+YET/YAlTA8tgCKpuZuFAOr?=
 =?us-ascii?Q?zbxMTbRk2LOC6UHxKutFhgrtx+Q0pgV5jSe2dptUfqAw/xUETknV5cpMoZfO?=
 =?us-ascii?Q?ujxZzhmhLSCs2PR6/ipNNQQW7B8gMrkDpq/79/jcntkf7vENOfxT68I8DueY?=
 =?us-ascii?Q?FhtZjaEIDmRlxhYwvDEu/7CJeQMyOShepNYE5w4y68rMe7jTTHyicmmm1ZIU?=
 =?us-ascii?Q?dUOcP5DlE99L6JQS4zra4TNOfE5o+/glkIjN7EJn+rh+Cf0LPWGXPDBuGamB?=
 =?us-ascii?Q?hkwLSJRYIF+kbbIr/l3+N6gnIj6BgqDTssqf1P8wNmDKctUMhBj0pLhmEtIE?=
 =?us-ascii?Q?hwcgbCuPuMaus3jnIMUHAELIgb9jGhokHumOeao5wdCB48188MEhtqbmfOsN?=
 =?us-ascii?Q?WMuOyAUplhJY7vXKbyFQGeHttjYUjO5KMDvFtD8Z+7Xk7NCcGph8GrfooMjC?=
 =?us-ascii?Q?88xtfSUTil9PO0WwFwoUyFSzGthFinsDA88re3Iy?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1cdf4c5-b9c3-49d4-ea80-08dc3e0a2b8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2024 18:20:58.0468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G4jJdZZp9Exdq5hICsa7Uy6NmBHG9ETZmRThqo9PQXkIudO3ZMO5OYGu0S02pef+uyfGyEX+nEEmKO5USBiB7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4105
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

[AMD Official Use Only - General]

Ignore this. Triggered wrongly.

-----Original Message-----
From: Sunil Khatri <sunil.khatri@amd.com>
Sent: Wednesday, March 6, 2024 11:50 PM
To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Chri=
stian.Koenig@amd.com>; Sharma, Shashank <Shashank.Sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-k=
ernel@vger.kernel.org; Joshi, Mukul <Mukul.Joshi@amd.com>; Paneer Selvam, A=
runpravin <Arunpravin.PaneerSelvam@amd.com>; Khatri, Sunil <Sunil.Khatri@am=
d.com>
Subject: [PATCH] drm/amdgpu: cache in more vm fault information

When an  page fault interrupt is raised there is a lot more information tha=
t is useful for developers to analyse the pagefault.

Add all such information in the last cached pagefault from an interrupt han=
dler.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 9 +++++++--  drivers/gpu/drm/amd/=
amdgpu/amdgpu_vm.h | 7 ++++++-  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 2 =
+-  drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c | 2 +-  drivers/gpu/drm/amd/amdg=
pu/gmc_v7_0.c  | 2 +-  drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c  | 2 +-  drive=
rs/gpu/drm/amd/amdgpu/gmc_v9_0.c  | 2 +-
 7 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_vm.c
index 4299ce386322..b77e8e28769d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2905,7 +2905,7 @@ void amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm, =
struct seq_file *m)
  * Cache the fault info for later use by userspace in debugging.
  */
 void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev,
-                                 unsigned int pasid,
+                                 struct amdgpu_iv_entry *entry,
                                  uint64_t addr,
                                  uint32_t status,
                                  unsigned int vmhub)
@@ -2915,7 +2915,7 @@ void amdgpu_vm_update_fault_cache(struct amdgpu_devic=
e *adev,

        xa_lock_irqsave(&adev->vm_manager.pasids, flags);

-       vm =3D xa_load(&adev->vm_manager.pasids, pasid);
+       vm =3D xa_load(&adev->vm_manager.pasids, entry->pasid);
        /* Don't update the fault cache if status is 0.  In the multiple
         * fault case, subsequent faults will return a 0 status which is
         * useless for userspace and replaces the useful fault status, so @=
@ -2924,6 +2924,11 @@ void amdgpu_vm_update_fault_cache(struct amdgpu_devic=
e *adev,
        if (vm && status) {
                vm->fault_info.addr =3D addr;
                vm->fault_info.status =3D status;
+               vm->fault_info.client_id =3D entry->client_id;
+               vm->fault_info.src_id =3D entry->src_id;
+               vm->fault_info.vmid =3D entry->vmid;
+               vm->fault_info.pasid =3D entry->pasid;
+               vm->fault_info.ring_id =3D entry->ring_id;
                if (AMDGPU_IS_GFXHUB(vmhub)) {
                        vm->fault_info.vmhub =3D AMDGPU_VMHUB_TYPE_GFX;
                        vm->fault_info.vmhub |=3D
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_vm.h
index 047ec1930d12..c7782a89bdb5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -286,6 +286,11 @@ struct amdgpu_vm_fault_info {
        uint32_t        status;
        /* which vmhub? gfxhub, mmhub, etc. */
        unsigned int    vmhub;
+       unsigned int    client_id;
+       unsigned int    src_id;
+       unsigned int    ring_id;
+       unsigned int    pasid;
+       unsigned int    vmid;
 };

 struct amdgpu_vm {
@@ -605,7 +610,7 @@ static inline void amdgpu_vm_eviction_unlock(struct amd=
gpu_vm *vm)  }

 void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev,
-                                 unsigned int pasid,
+                                 struct amdgpu_iv_entry *entry,
                                  uint64_t addr,
                                  uint32_t status,
                                  unsigned int vmhub);
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/a=
mdgpu/gmc_v10_0.c
index d933e19e0cf5..6b177ce8db0e 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -150,7 +150,7 @@ static int gmc_v10_0_process_interrupt(struct amdgpu_de=
vice *adev,
                status =3D RREG32(hub->vm_l2_pro_fault_status);
                WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);

-               amdgpu_vm_update_fault_cache(adev, entry->pasid, addr, stat=
us,
+               amdgpu_vm_update_fault_cache(adev, entry, addr, status,
                                             entry->vmid_src ? AMDGPU_MMHUB=
0(0) : AMDGPU_GFXHUB(0));
        }

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c b/drivers/gpu/drm/amd/a=
mdgpu/gmc_v11_0.c
index 527dc917e049..bcf254856a3e 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
@@ -121,7 +121,7 @@ static int gmc_v11_0_process_interrupt(struct amdgpu_de=
vice *adev,
                status =3D RREG32(hub->vm_l2_pro_fault_status);
                WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);

-               amdgpu_vm_update_fault_cache(adev, entry->pasid, addr, stat=
us,
+               amdgpu_vm_update_fault_cache(adev, entry, addr, status,
                                             entry->vmid_src ? AMDGPU_MMHUB=
0(0) : AMDGPU_GFXHUB(0));
        }

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/am=
dgpu/gmc_v7_0.c
index 3da7b6a2b00d..e9517ebbe1fd 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
@@ -1270,7 +1270,7 @@ static int gmc_v7_0_process_interrupt(struct amdgpu_d=
evice *adev,
        if (!addr && !status)
                return 0;

-       amdgpu_vm_update_fault_cache(adev, entry->pasid,
+       amdgpu_vm_update_fault_cache(adev, entry,
                                     ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT, =
status, AMDGPU_GFXHUB(0));

        if (amdgpu_vm_fault_stop =3D=3D AMDGPU_VM_FAULT_STOP_FIRST) diff --=
git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gm=
c_v8_0.c
index d20e5f20ee31..a271bf832312 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
@@ -1438,7 +1438,7 @@ static int gmc_v8_0_process_interrupt(struct amdgpu_d=
evice *adev,
        if (!addr && !status)
                return 0;

-       amdgpu_vm_update_fault_cache(adev, entry->pasid,
+       amdgpu_vm_update_fault_cache(adev, entry,
                                     ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT, =
status, AMDGPU_GFXHUB(0));

        if (amdgpu_vm_fault_stop =3D=3D AMDGPU_VM_FAULT_STOP_FIRST) diff --=
git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gm=
c_v9_0.c
index 47b63a4ce68b..dc9fb1fb9540 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -666,7 +666,7 @@ static int gmc_v9_0_process_interrupt(struct amdgpu_dev=
ice *adev,
        rw =3D REG_GET_FIELD(status, VM_L2_PROTECTION_FAULT_STATUS, RW);
        WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);

-       amdgpu_vm_update_fault_cache(adev, entry->pasid, addr, status, vmhu=
b);
+       amdgpu_vm_update_fault_cache(adev, entry, addr, status, vmhub);

        dev_err(adev->dev,
                "VM_L2_PROTECTION_FAULT_STATUS:0x%08X\n",
--
2.34.1

