Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4ACB3333E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 01:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A934D10E050;
	Sun, 24 Aug 2025 23:11:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k/LRs5vF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A43710E04E;
 Sun, 24 Aug 2025 11:51:15 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-76e2eb6d07bso2878569b3a.3; 
 Sun, 24 Aug 2025 04:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756036275; x=1756641075; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5mPsCzVzELE3GW17tjG44mq7hYqZu6NFHUC+sngu+N0=;
 b=k/LRs5vFexHU5OJGUB8Bo+TewmhRJDhcV/UuPytfGHRZ0govXutntdsbi7NfIzS6NE
 KmUk0jgpatuQg9qZEOYS1Jg45GknahiBCUgUXX6YW2W8CsnrfDr6ZB/yLOo+XR8lEAg5
 19HhhTiYyrOZL4BfJs3A3kofR6vKLvI5S2tFx8gZAwwrrnRfGOOdugR5MmIiEXarGRPa
 GROKSFnfpKRP3Qn0tb7fYkoZ/CfODYB2ufATWF2ZxLmmeWJ6it8CokOFiBdxc02ck5Xf
 mS8mhTVNMngf9EhTpXvVLwpRI0klrl7rWYt/LxUThpgJcbEomJhIJL57t5DNs6CISqgk
 duyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756036275; x=1756641075;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5mPsCzVzELE3GW17tjG44mq7hYqZu6NFHUC+sngu+N0=;
 b=LinYWy6m+eTfPPZSQ9SyhYaNEHmtP/PG5KZQdS6EFM34OR70fhi1MMd7785rN9Q2mh
 ksitiT7CIr1ylx+kuUkhpA/WwWtsHQGjIZc08lO1M2gkxJBAyRtZ/xzTm66rFlFrvvUE
 OKxmDp3hAYdz5zDnaPsffKv1xbTnPh48MowE9z614J0SGygzn+Mee6ZhFvNZQ9NQsTQy
 CUmNAuCddVejAe3haW8LnvLUKVGv96F0egYmxnHGcjebJR+4NsudVV7R9Ioiya+4ENep
 qYC6ljJAZGEC0eBCZbeSBm3yX32kUJtKS4NaAD6xJSBAlqGTvXAQIFxEAxTOes+MHIFD
 d8Sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuqV9gcJepVHyo9QhFEvOxuzntIHv8pwjJPLdwkMZWpthP4+peHtJywBTUPCP7oP0OD3DJaX1pClE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9QVIrbqCSaOWZaHPSczJG+yVf7wEdnrf0ZDqjWEPnED7JBDfg
 /FzG1I64LiiUqIz5M0bigvE1Bb5krMsU1z78q1IUSX6kQqPKPopbIZJBEPZXcvoP/IrEyA==
X-Gm-Gg: ASbGncuI7Ui81noJiUmGsVnNROa/x1GbifmmqhpgBicqKgp7+FV7xJubqZuf5fsCdOV
 +T2NyOJPRqVnpJVXvZBD8nNkJzGKLu8Uer4y5JHFDSxaDGZ07Xgw6Oy51aft/ey3zqV/4gYGacc
 awe0/5ahZAD3uI+g3X7/MxLsvgBIFHsjBZcsKkjaZSwEDw91UmoEqdtl1PQG+uP8j+sbJf1XbCC
 K5cifq3b2zxFqO3Ju/gQqi5hLp44VVLvVKUd9hAzuxahTXsXTOZ9QzrX2h5NZ0zfBCncg3RHPRC
 cWfwf76cQ6c6E91CYgbAWovnbubcsnozO0IuAMINOdSiYXioseJVFM8beBhJa4ML9xKrtSVax7v
 42ZXweP0/lT2E4GkKMEnsdHYbnuClox8NBjhk7sCtXYauIJxTNr4=
X-Google-Smtp-Source: AGHT+IEsTJzNogBKF2aw5fT6u7NYENiRajAD+1opZxqjVK01030T9537BIgwLgexfe99DuG3t4GwSQ==
X-Received: by 2002:a05:6a20:914d:b0:243:78a:8298 with SMTP id
 adf61e73a8af0-24340e068dfmr14116551637.49.1756036274616; 
 Sun, 24 Aug 2025 04:51:14 -0700 (PDT)
Received: from yugansh-Inspiron-14-5410..
 ([2401:4900:1c5c:9483:43fb:2a6d:1506:f2f1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7703ffed02bsm4550834b3a.24.2025.08.24.04.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 04:51:14 -0700 (PDT)
From: Yugansh Mittal <mittalyugansh1@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yugansh Mittal <mittalyugansh1@gmail.com>
Subject: [PATCH] atomfirmware.h: fix multiple spelling mistakes
Date: Sun, 24 Aug 2025 17:20:51 +0530
Message-ID: <20250824115051.32988-1-mittalyugansh1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 24 Aug 2025 23:11:22 +0000
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

This patch corrects several typographical errors in atomfirmware.h.
The fixes improve readability and maintain consistency in the codebase.
No functional changes are introduced.

Corrected terms include:
- aligment    → alignment
- Offest      → Offset
- defintion   → definition
- swithing    → switching
- calcualted  → calculated
- compability → compatibility
- intenal     → internal
- sequece     → sequence
- indiate     → indicate
- stucture    → structure
- regiser     → register

Signed-off-by: Yugansh Mittal <mittalyugansh1@gmail.com>
---
 drivers/gpu/drm/amd/include/atomfirmware.h | 30 +++++++++++-----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/atomfirmware.h b/drivers/gpu/drm/amd/include/atomfirmware.h
index 5c86423c2..3d083010e 100644
--- a/drivers/gpu/drm/amd/include/atomfirmware.h
+++ b/drivers/gpu/drm/amd/include/atomfirmware.h
@@ -211,7 +211,7 @@ atom_bios_string          = "ATOM"
 };
 */
 
-#pragma pack(1)                          /* BIOS data must use byte aligment*/
+#pragma pack(1)                          /* BIOS data must use byte alignment*/
 
 enum atombios_image_offset{
   OFFSET_TO_ATOM_ROM_HEADER_POINTER          = 0x00000048,
@@ -255,8 +255,8 @@ struct atom_rom_header_v2_2
   uint16_t subsystem_vendor_id;
   uint16_t subsystem_id;
   uint16_t pci_info_offset;
-  uint16_t masterhwfunction_offset;      //Offest for SW to get all command function offsets, Don't change the position
-  uint16_t masterdatatable_offset;       //Offest for SW to get all data table offsets, Don't change the position
+  uint16_t masterhwfunction_offset;      //Offset for SW to get all command function offsets, Don't change the position
+  uint16_t masterdatatable_offset;       //Offset for SW to get all data table offsets, Don't change the position
   uint16_t reserved;
   uint32_t pspdirtableoffset;
 };
@@ -453,7 +453,7 @@ struct atom_dtd_format
   uint8_t   refreshrate;
 };
 
-/* atom_dtd_format.modemiscinfo defintion */
+/* atom_dtd_format.modemiscinfo definition */
 enum atom_dtd_format_modemiscinfo{
   ATOM_HSYNC_POLARITY    = 0x0002,
   ATOM_VSYNC_POLARITY    = 0x0004,
@@ -678,7 +678,7 @@ struct lcd_info_v2_1
   uint32_t reserved1[8];
 };
 
-/* lcd_info_v2_1.panel_misc defintion */
+/* lcd_info_v2_1.panel_misc definition */
 enum atom_lcd_info_panel_misc{
   ATOM_PANEL_MISC_FPDI            =0x0002,
 };
@@ -716,7 +716,7 @@ enum atom_gpio_pin_assignment_gpio_id {
   /* gpio_id pre-define id for multiple usage */
   /* GPIO use to control PCIE_VDDC in certain SLT board */
   PCIE_VDDC_CONTROL_GPIO_PINID = 56,
-  /* if PP_AC_DC_SWITCH_GPIO_PINID in Gpio_Pin_LutTable, AC/DC swithing feature is enable */
+  /* if PP_AC_DC_SWITCH_GPIO_PINID in Gpio_Pin_LutTable, AC/DC switching feature is enable */
   PP_AC_DC_SWITCH_GPIO_PINID = 60,
   /* VDDC_REGULATOR_VRHOT_GPIO_PINID in Gpio_Pin_LutTable, VRHot feature is enable */
   VDDC_VRHOT_GPIO_PINID = 61,
@@ -734,7 +734,7 @@ enum atom_gpio_pin_assignment_gpio_id {
 struct atom_gpio_pin_lut_v2_1
 {
   struct  atom_common_table_header  table_header;
-  /*the real number of this included in the structure is calcualted by using the (whole structure size - the header size)/size of atom_gpio_pin_lut  */
+  /*the real number of this included in the structure is calculated by using the (whole structure size - the header size)/size of atom_gpio_pin_lut  */
   struct  atom_gpio_pin_assignment  gpio_pin[];
 };
 
@@ -997,7 +997,7 @@ enum atom_connector_layout_info_mini_type_def {
 
 enum atom_display_device_tag_def{
   ATOM_DISPLAY_LCD1_SUPPORT            = 0x0002, //an embedded display is either an LVDS or eDP signal type of display
-  ATOM_DISPLAY_LCD2_SUPPORT			       = 0x0020, //second edp device tag 0x0020 for backward compability
+  ATOM_DISPLAY_LCD2_SUPPORT            = 0x0020, //second edp device tag 0x0020 for backward compatibility
   ATOM_DISPLAY_DFP1_SUPPORT            = 0x0008,
   ATOM_DISPLAY_DFP2_SUPPORT            = 0x0080,
   ATOM_DISPLAY_DFP3_SUPPORT            = 0x0200,
@@ -1011,7 +1011,7 @@ struct atom_display_object_path_v2
 {
   uint16_t display_objid;                  //Connector Object ID or Misc Object ID
   uint16_t disp_recordoffset;
-  uint16_t encoderobjid;                   //first encoder closer to the connector, could be either an external or intenal encoder
+  uint16_t encoderobjid;                   //first encoder closer to the connector, could be either an external or internal encoder
   uint16_t extencoderobjid;                //2nd encoder after the first encoder, from the connector point of view;
   uint16_t encoder_recordoffset;
   uint16_t extencoder_recordoffset;
@@ -1023,7 +1023,7 @@ struct atom_display_object_path_v2
 struct atom_display_object_path_v3 {
 	uint16_t display_objid; //Connector Object ID or Misc Object ID
 	uint16_t disp_recordoffset;
-	uint16_t encoderobjid; //first encoder closer to the connector, could be either an external or intenal encoder
+	uint16_t encoderobjid; //first encoder closer to the connector, could be either an external or internal encoder
 	uint16_t reserved1; //only on USBC case, otherwise always = 0
 	uint16_t reserved2; //reserved and always = 0
 	uint16_t reserved3; //reserved and always = 0
@@ -3547,7 +3547,7 @@ struct atom_voltage_object_header_v4{
 enum atom_voltage_object_mode 
 {
    VOLTAGE_OBJ_GPIO_LUT              =  0,        //VOLTAGE and GPIO Lookup table ->atom_gpio_voltage_object_v4
-   VOLTAGE_OBJ_VR_I2C_INIT_SEQ       =  3,        //VOLTAGE REGULATOR INIT sequece through I2C -> atom_i2c_voltage_object_v4
+   VOLTAGE_OBJ_VR_I2C_INIT_SEQ       =  3,        //VOLTAGE REGULATOR INIT sequence through I2C -> atom_i2c_voltage_object_v4
    VOLTAGE_OBJ_PHASE_LUT             =  4,        //Set Vregulator Phase lookup table ->atom_gpio_voltage_object_v4
    VOLTAGE_OBJ_SVID2                 =  7,        //Indicate voltage control by SVID2 ->atom_svid2_voltage_object_v4
    VOLTAGE_OBJ_EVV                   =  8, 
@@ -3585,7 +3585,7 @@ struct atom_gpio_voltage_object_v4
 {
    struct atom_voltage_object_header_v4 header;  // voltage mode = VOLTAGE_OBJ_GPIO_LUT or VOLTAGE_OBJ_PHASE_LUT
    uint8_t  gpio_control_id;                     // default is 0 which indicate control through CG VID mode 
-   uint8_t  gpio_entry_num;                      // indiate the entry numbers of Votlage/Gpio value Look up table
+   uint8_t  gpio_entry_num;                      // indicate the entry numbers of Votlage/Gpio value Look up table
    uint8_t  phase_delay_us;                      // phase delay in unit of micro second
    uint8_t  reserved;   
    uint32_t gpio_mask_val;                         // GPIO Mask value
@@ -4507,8 +4507,8 @@ struct amd_acpi_description_header{
 struct uefi_acpi_vfct{
   struct   amd_acpi_description_header sheader;
   uint8_t  tableUUID[16];    //0x24
-  uint32_t vbiosimageoffset; //0x34. Offset to the first GOP_VBIOS_CONTENT block from the beginning of the stucture.
-  uint32_t lib1Imageoffset;  //0x38. Offset to the first GOP_LIB1_CONTENT block from the beginning of the stucture.
+  uint32_t vbiosimageoffset; //0x34. Offset to the first GOP_VBIOS_CONTENT block from the beginning of the structure.
+  uint32_t lib1Imageoffset;  //0x38. Offset to the first GOP_LIB1_CONTENT block from the beginning of the structure.
   uint32_t reserved[4];      //0x3C
 };
 
@@ -4540,7 +4540,7 @@ struct gop_lib1_content {
 /* 
   ***************************************************************************
                    Scratch Register definitions
-  Each number below indicates which scratch regiser request, Active and 
+  Each number below indicates which scratch register request, Active and
   Connect all share the same definitions as display_device_tag defines
   *************************************************************************** 
 */   
-- 
2.43.0

